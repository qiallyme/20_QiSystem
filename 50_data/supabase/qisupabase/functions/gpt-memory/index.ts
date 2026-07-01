import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

type JsonObject = Record<string, unknown>;

const FUNCTION_NAME = "gpt-memory";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "GET, POST, PUT, PATCH, DELETE, OPTIONS",
};

function jsonResponse(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: {
      ...corsHeaders,
      "Content-Type": "application/json",
    },
  });
}

function emptyResponse(status = 204): Response {
  return new Response(null, {
    status,
    headers: corsHeaders,
  });
}

function errorResponse(message: string, status = 400, details?: unknown): Response {
  return jsonResponse(
    {
      error: message,
      details,
    },
    status,
  );
}

function getRequiredEnv(name: string): string {
  const value = Deno.env.get(name);
  if (!value) {
    throw new Error(`Missing required environment variable: ${name}`);
  }
  return value;
}

function getUserId(): string {
  return Deno.env.get("GPT_USER_ID") ?? "main_user";
}

function getSupabaseClient() {
  const supabaseUrl = getRequiredEnv("SUPABASE_URL");
  const serviceRoleKey = getRequiredEnv("SERVICE_ROLE_KEY");

  return createClient(supabaseUrl, serviceRoleKey, {
    auth: {
      persistSession: false,
      autoRefreshToken: false,
    },
  });
}

function authorizeRequest(req: Request): Response | null {
  const expectedToken = getRequiredEnv("ACTION_BEARER_TOKEN");
  const authHeader = req.headers.get("authorization") ?? "";

  if (authHeader !== `Bearer ${expectedToken}`) {
    return errorResponse("Unauthorized", 401);
  }

  return null;
}

function getRoute(req: Request): { resource: string; id?: string } {
  const url = new URL(req.url);
  const parts = url.pathname.split("/").filter(Boolean);

  const functionIndex = parts.lastIndexOf(FUNCTION_NAME);
  const routeParts = functionIndex >= 0 ? parts.slice(functionIndex + 1) : parts;

  return {
    resource: routeParts[0] ?? "",
    id: routeParts[1],
  };
}

async function readJsonBody(req: Request): Promise<JsonObject> {
  try {
    return await req.json();
  } catch {
    return {};
  }
}

function toMemory(row: any) {
  return {
    id: row.id,
    content: row.content,
    category: row.category,
    importance: row.importance,
    tags: row.tags ?? [],
    source: row.source,
    confidence: Number(row.confidence ?? 1),
    createdAt: row.created_at,
    updatedAt: row.updated_at,
    expiresAt: row.expires_at,
  };
}

function toConfig(row: any) {
  return {
    id: row.id,
    namespace: row.namespace,
    key: row.key,
    value: row.value,
    description: row.description,
    createdAt: row.created_at,
    updatedAt: row.updated_at,
  };
}

function toRule(row: any) {
  return {
    id: row.id,
    rule: row.rule,
    priority: row.priority,
    active: row.active,
    createdAt: row.created_at,
    updatedAt: row.updated_at,
  };
}

function emptyInstructions() {
  return {
    id: null,
    instructions: "",
    style: "",
    boundaries: "",
    createdAt: null,
    updatedAt: null,
  };
}

function toInstructions(row: any) {
  if (!row) return emptyInstructions();

  return {
    id: row.id,
    instructions: row.instructions ?? "",
    style: row.style ?? "",
    boundaries: row.boundaries ?? "",
    createdAt: row.created_at,
    updatedAt: row.updated_at,
  };
}

function clampInteger(value: unknown, fallback: number, min: number, max: number): number {
  const parsed = Number.parseInt(String(value), 10);

  if (Number.isNaN(parsed)) return fallback;

  return Math.min(Math.max(parsed, min), max);
}

async function getProfile() {
  const supabase = getSupabaseClient();
  const userId = getUserId();

  const memoriesResult = await supabase
    .from("gpt_memories")
    .select("*")
    .eq("user_id", userId)
    .order("importance", { ascending: false })
    .order("updated_at", { ascending: false })
    .limit(100);

  if (memoriesResult.error) {
    return errorResponse("Failed to load memories", 500, memoriesResult.error);
  }

  const configsResult = await supabase
    .from("gpt_configs")
    .select("*")
    .eq("user_id", userId)
    .order("namespace", { ascending: true })
    .order("key", { ascending: true });

  if (configsResult.error) {
    return errorResponse("Failed to load configs", 500, configsResult.error);
  }

  const rulesResult = await supabase
    .from("gpt_rules")
    .select("*")
    .eq("user_id", userId)
    .eq("active", true)
    .order("priority", { ascending: true });

  if (rulesResult.error) {
    return errorResponse("Failed to load rules", 500, rulesResult.error);
  }

  const instructionsResult = await supabase
    .from("gpt_instructions")
    .select("*")
    .eq("user_id", userId)
    .maybeSingle();

  if (instructionsResult.error) {
    return errorResponse("Failed to load instructions", 500, instructionsResult.error);
  }

  return jsonResponse({
    userId,
    memories: (memoriesResult.data ?? []).map(toMemory),
    configs: (configsResult.data ?? []).map(toConfig),
    rules: (rulesResult.data ?? []).map(toRule),
    instructions: toInstructions(instructionsResult.data),
  });
}

async function searchMemories(req: Request) {
  const supabase = getSupabaseClient();
  const userId = getUserId();
  const url = new URL(req.url);

  const query = url.searchParams.get("query");
  const category = url.searchParams.get("category");
  const tag = url.searchParams.get("tag");
  const minImportance = url.searchParams.get("minImportance");
  const limit = clampInteger(url.searchParams.get("limit"), 20, 1, 100);

  let builder = supabase
    .from("gpt_memories")
    .select("*")
    .eq("user_id", userId);

  if (query) {
    builder = builder.ilike("content", `%${query}%`);
  }

  if (category) {
    builder = builder.eq("category", category);
  }

  if (tag) {
    builder = builder.contains("tags", [tag]);
  }

  if (minImportance) {
    builder = builder.gte("importance", clampInteger(minImportance, 1, 1, 10));
  }

  const result = await builder
    .order("importance", { ascending: false })
    .order("updated_at", { ascending: false })
    .limit(limit);

  if (result.error) {
    return errorResponse("Failed to search memories", 500, result.error);
  }

  return jsonResponse({
    memories: (result.data ?? []).map(toMemory),
  });
}

async function createMemory(req: Request) {
  const supabase = getSupabaseClient();
  const userId = getUserId();
  const body = await readJsonBody(req);

  if (!body.content || typeof body.content !== "string") {
    return errorResponse("Memory content is required", 400);
  }

  const row = {
    user_id: userId,
    content: body.content,
    category: typeof body.category === "string" ? body.category : "other",
    importance: clampInteger(body.importance, 5, 1, 10),
    tags: Array.isArray(body.tags) ? body.tags : [],
    source: typeof body.source === "string" ? body.source : "conversation",
    confidence: typeof body.confidence === "number" ? body.confidence : 1,
    expires_at: typeof body.expiresAt === "string" ? body.expiresAt : null,
  };

  const result = await supabase
    .from("gpt_memories")
    .insert(row)
    .select("*")
    .single();

  if (result.error) {
    return errorResponse("Failed to create memory", 500, result.error);
  }

  return jsonResponse(toMemory(result.data), 201);
}

async function updateMemory(req: Request, memoryId?: string) {
  if (!memoryId) return errorResponse("Memory ID is required", 400);

  const supabase = getSupabaseClient();
  const userId = getUserId();
  const body = await readJsonBody(req);

  const patch: JsonObject = {};

  if ("content" in body) patch.content = body.content;
  if ("category" in body) patch.category = body.category;
  if ("importance" in body) patch.importance = clampInteger(body.importance, 5, 1, 10);
  if ("tags" in body) patch.tags = Array.isArray(body.tags) ? body.tags : [];
  if ("source" in body) patch.source = body.source;
  if ("confidence" in body) patch.confidence = body.confidence;
  if ("expiresAt" in body) patch.expires_at = body.expiresAt;

  const result = await supabase
    .from("gpt_memories")
    .update(patch)
    .eq("id", memoryId)
    .eq("user_id", userId)
    .select("*")
    .maybeSingle();

  if (result.error) {
    return errorResponse("Failed to update memory", 500, result.error);
  }

  if (!result.data) {
    return errorResponse("Memory not found", 404);
  }

  return jsonResponse(toMemory(result.data));
}

async function deleteMemory(memoryId?: string) {
  if (!memoryId) return errorResponse("Memory ID is required", 400);

  const supabase = getSupabaseClient();
  const userId = getUserId();

  const result = await supabase
    .from("gpt_memories")
    .delete()
    .eq("id", memoryId)
    .eq("user_id", userId);

  if (result.error) {
    return errorResponse("Failed to delete memory", 500, result.error);
  }

  return emptyResponse(204);
}

async function listConfigs(req: Request) {
  const supabase = getSupabaseClient();
  const userId = getUserId();
  const url = new URL(req.url);
  const namespace = url.searchParams.get("namespace");

  let builder = supabase
    .from("gpt_configs")
    .select("*")
    .eq("user_id", userId);

  if (namespace) {
    builder = builder.eq("namespace", namespace);
  }

  const result = await builder
    .order("namespace", { ascending: true })
    .order("key", { ascending: true });

  if (result.error) {
    return errorResponse("Failed to list configs", 500, result.error);
  }

  return jsonResponse({
    configs: (result.data ?? []).map(toConfig),
  });
}

async function upsertConfig(req: Request) {
  const supabase = getSupabaseClient();
  const userId = getUserId();
  const body = await readJsonBody(req);

  if (!body.key || typeof body.key !== "string") {
    return errorResponse("Config key is required", 400);
  }

  if (!("value" in body)) {
    return errorResponse("Config value is required", 400);
  }

  const row = {
    user_id: userId,
    namespace: typeof body.namespace === "string" ? body.namespace : "default",
    key: body.key,
    value: body.value,
    description: typeof body.description === "string" ? body.description : null,
  };

  const result = await supabase
    .from("gpt_configs")
    .upsert(row, {
      onConflict: "user_id,namespace,key",
    })
    .select("*")
    .single();

  if (result.error) {
    return errorResponse("Failed to save config", 500, result.error);
  }

  return jsonResponse(toConfig(result.data));
}

async function listRules(req: Request) {
  const supabase = getSupabaseClient();
  const userId = getUserId();
  const url = new URL(req.url);
  const activeOnly = url.searchParams.get("activeOnly") !== "false";

  let builder = supabase
    .from("gpt_rules")
    .select("*")
    .eq("user_id", userId);

  if (activeOnly) {
    builder = builder.eq("active", true);
  }

  const result = await builder.order("priority", { ascending: true });

  if (result.error) {
    return errorResponse("Failed to list rules", 500, result.error);
  }

  return jsonResponse({
    rules: (result.data ?? []).map(toRule),
  });
}

async function createRule(req: Request) {
  const supabase = getSupabaseClient();
  const userId = getUserId();
  const body = await readJsonBody(req);

  if (!body.rule || typeof body.rule !== "string") {
    return errorResponse("Rule text is required", 400);
  }

  const row = {
    user_id: userId,
    rule: body.rule,
    priority: clampInteger(body.priority, 50, 1, 100),
    active: typeof body.active === "boolean" ? body.active : true,
  };

  const result = await supabase
    .from("gpt_rules")
    .insert(row)
    .select("*")
    .single();

  if (result.error) {
    return errorResponse("Failed to create rule", 500, result.error);
  }

  return jsonResponse(toRule(result.data), 201);
}

async function updateRule(req: Request, ruleId?: string) {
  if (!ruleId) return errorResponse("Rule ID is required", 400);

  const supabase = getSupabaseClient();
  const userId = getUserId();
  const body = await readJsonBody(req);

  const patch: JsonObject = {};

  if ("rule" in body) patch.rule = body.rule;
  if ("priority" in body) patch.priority = clampInteger(body.priority, 50, 1, 100);
  if ("active" in body) patch.active = body.active;

  const result = await supabase
    .from("gpt_rules")
    .update(patch)
    .eq("id", ruleId)
    .eq("user_id", userId)
    .select("*")
    .maybeSingle();

  if (result.error) {
    return errorResponse("Failed to update rule", 500, result.error);
  }

  if (!result.data) {
    return errorResponse("Rule not found", 404);
  }

  return jsonResponse(toRule(result.data));
}

async function deleteRule(ruleId?: string) {
  if (!ruleId) return errorResponse("Rule ID is required", 400);

  const supabase = getSupabaseClient();
  const userId = getUserId();

  const result = await supabase
    .from("gpt_rules")
    .delete()
    .eq("id", ruleId)
    .eq("user_id", userId);

  if (result.error) {
    return errorResponse("Failed to delete rule", 500, result.error);
  }

  return emptyResponse(204);
}

async function getInstructions() {
  const supabase = getSupabaseClient();
  const userId = getUserId();

  const result = await supabase
    .from("gpt_instructions")
    .select("*")
    .eq("user_id", userId)
    .maybeSingle();

  if (result.error) {
    return errorResponse("Failed to load instructions", 500, result.error);
  }

  return jsonResponse(toInstructions(result.data));
}

async function updateInstructions(req: Request) {
  const supabase = getSupabaseClient();
  const userId = getUserId();
  const body = await readJsonBody(req);

  const existingResult = await supabase
    .from("gpt_instructions")
    .select("*")
    .eq("user_id", userId)
    .maybeSingle();

  if (existingResult.error) {
    return errorResponse("Failed to load existing instructions", 500, existingResult.error);
  }

  if (!existingResult.data) {
    const insertResult = await supabase
      .from("gpt_instructions")
      .insert({
        user_id: userId,
        instructions: typeof body.instructions === "string" ? body.instructions : "",
        style: typeof body.style === "string" ? body.style : "",
        boundaries: typeof body.boundaries === "string" ? body.boundaries : "",
      })
      .select("*")
      .single();

    if (insertResult.error) {
      return errorResponse("Failed to create instructions", 500, insertResult.error);
    }

    return jsonResponse(toInstructions(insertResult.data));
  }

  const patch: JsonObject = {};

  if ("instructions" in body) patch.instructions = body.instructions;
  if ("style" in body) patch.style = body.style;
  if ("boundaries" in body) patch.boundaries = body.boundaries;

  const updateResult = await supabase
    .from("gpt_instructions")
    .update(patch)
    .eq("user_id", userId)
    .select("*")
    .single();

  if (updateResult.error) {
    return errorResponse("Failed to update instructions", 500, updateResult.error);
  }

  return jsonResponse(toInstructions(updateResult.data));
}

Deno.serve(async (req: Request) => {
  try {
    if (req.method === "OPTIONS") {
      return emptyResponse(204);
    }

    const authError = authorizeRequest(req);
    if (authError) return authError;

    const { resource, id } = getRoute(req);

    if (resource === "" || resource === "health") {
      return jsonResponse({
        ok: true,
        service: FUNCTION_NAME,
      });
    }

    if (resource === "profile" && req.method === "GET") {
      return await getProfile();
    }

    if (resource === "memories" && req.method === "GET") {
      return await searchMemories(req);
    }

    if (resource === "memories" && req.method === "POST") {
      return await createMemory(req);
    }

    if (resource === "memories" && req.method === "PATCH") {
      return await updateMemory(req, id);
    }

    if (resource === "memories" && req.method === "DELETE") {
      return await deleteMemory(id);
    }

    if (resource === "configs" && req.method === "GET") {
      return await listConfigs(req);
    }

    if (resource === "configs" && req.method === "PUT") {
      return await upsertConfig(req);
    }

    if (resource === "rules" && req.method === "GET") {
      return await listRules(req);
    }

    if (resource === "rules" && req.method === "POST") {
      return await createRule(req);
    }

    if (resource === "rules" && req.method === "PATCH") {
      return await updateRule(req, id);
    }

    if (resource === "rules" && req.method === "DELETE") {
      return await deleteRule(id);
    }

    if (resource === "instructions" && req.method === "GET") {
      return await getInstructions();
    }

    if (resource === "instructions" && req.method === "PUT") {
      return await updateInstructions(req);
    }

    return errorResponse("Route not found", 404, {
      method: req.method,
      resource,
      id,
    });
  } catch (error) {
    return errorResponse("Internal server error", 500, {
      message: error instanceof Error ? error.message : String(error),
    });
  }
});
