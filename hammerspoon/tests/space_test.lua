-- Space switch integration test
-- Run from the Hammerspoon console:
--   dofile(hs.configdir .. "/space_test.lua")

local WAIT_SECS  = 0.8          -- time to wait after each switch before checking
local LOOPS      = _G.LOOPS or 1  -- how many times to cycle through all spaces
local SPACES     = _G.SPACES          -- limit test to specific space indices, e.g. {1, 3}
local LOG_PATH   = _G.SPACE_TEST_LOG or "/tmp/space_test.log"

-- Build a flat ordered list of spaces across all screens, matching the
-- incremental index used by PaperWM's switchToSpace(n).
local function collect_spaces()
    local list = {}
    for _, screen in ipairs(hs.screen.allScreens()) do
        local uuid   = screen:getUUID()
        local spaces = hs.spaces.allSpaces()[uuid] or {}
        for _, id in ipairs(spaces) do
            table.insert(list, { index = #list + 1, id = id, screen = uuid })
        end
    end
    return list
end

local all_spaces = collect_spaces()
local spaces
if SPACES then
    spaces = {}
    for _, idx in ipairs(SPACES) do
        table.insert(spaces, all_spaces[idx])
    end
else
    spaces = all_spaces
end
local origin_id     = hs.spaces.focusedSpace()
local results       = {}
local current_loop  = 1
local current_step  = 0

local function write_log()
    local passed, total = 0, #results
    local lines = {
        "Space Switch Integration Test",
        "==============================",
        os.date("%Y-%m-%d %H:%M:%S"),
        string.format("Spaces tested: %d  |  Loops: %d  |  Wait per switch: %.1fs", total, LOOPS, WAIT_SECS),
        "",
    }
    local current_loop_num = 0
    for _, r in ipairs(results) do
        if r.loop ~= current_loop_num then
            current_loop_num = r.loop
            table.insert(lines, string.format("\nLoop %d:", r.loop))
        end
        local status = r.ok and "PASS" or "FAIL"
        if r.ok then passed = passed + 1 end
        local line = string.format("  [%s]  index=%-2d  expected_id=%-6d  actual_id=%-6d",
            status, r.index, r.expected_id, r.actual_id)
        if r.err then line = line .. "  error=" .. tostring(r.err) end
        table.insert(lines, line)
    end
    table.insert(lines, "")
    table.insert(lines, string.format("Result: %d / %d passed", passed, total))

    local content = table.concat(lines, "\n") .. "\n"

    local f = assert(io.open(LOG_PATH, "w"))
    f:write(content)
    f:close()

    print("[space_test] " .. content)

    return passed, total
end

local function finish()
    -- Return to the space we started on
    local origin_idx = 1
    for _, s in ipairs(all_spaces) do
        if s.id == origin_id then
            origin_idx = s.index
            break
        end
    end
    spoon.PaperWM.space.switchToSpace(origin_idx)

    local ok_write, passed, total = pcall(write_log)
    if not ok_write then
        print("[space_test] ERROR writing log: " .. tostring(passed))
        return
    end
    local summary = string.format("%d / %d spaces switched correctly  —  log: %s",
        passed, total, LOG_PATH)
    hs.notify.show("PaperWM Space Test", "", summary)
    print("[space_test] " .. summary)
end

local function run_step()
    current_step = current_step + 1

    if current_step > #spaces then
        if current_loop < LOOPS then
            current_loop = current_loop + 1
            current_step = 0
            run_step()
        else
            finish()
        end
        return
    end

    local s = spaces[current_step]
    spoon.PaperWM.space.switchToSpace(s.index)

    hs.timer.doAfter(WAIT_SECS, function()
        local ok_call, err = pcall(function()
            local actual_id = hs.spaces.focusedSpace()
            local ok        = (actual_id == s.id)
            table.insert(results, {
                loop        = current_loop,
                index       = s.index,
                expected_id = s.id,
                actual_id   = actual_id,
                ok          = ok,
            })
        end)
        if not ok_call then
            table.insert(results, {
                loop        = current_loop,
                index       = s.index,
                expected_id = s.id,
                actual_id   = -1,
                ok          = false,
                err         = err,
            })
        end
        run_step()
    end)
end

print(string.format("[space_test] Starting — %d space(s) x %d loop(s)", #spaces, LOOPS))
run_step()
