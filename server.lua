local function hasPerm(src)
    if src == 0 then return true end -- console
    return IsPlayerAceAllowed(src, Config.AcePerm)
end

local function reply(src, msg, ntype)
    if src == 0 then
        print(('[admin_pedswap] %s'):format(msg))
    else
        Config.Notify(src, 'admin_pedswap', msg, ntype or 'inform')
    end
end

-- /setped <id> <model>
RegisterCommand(Config.Commands.setPed, function(source, args)
    if not hasPerm(source) then
        if source ~= 0 then reply(source, 'No permission.', 'error') end
        return
    end

    local target = tonumber(args[1] or '')
    local model = tostring(args[2] or '')

    if not target or model == '' then
        reply(source, ('Usage: /%s <id> <model>'):format(Config.Commands.setPed), 'error')
        return
    end

    if GetPlayerPing(target) <= 0 then
        reply(source, 'Target player not online.', 'error')
        return
    end

    TriggerClientEvent('admin_pedswap:applyPed', target, model)
    reply(source, ('Applied one-time ped "%s" to %d'):format(model, target), 'success')
end, false)

-- /forcereloadskin <id>
RegisterCommand(Config.Commands.forceReload, function(source, args)
    if not hasPerm(source) then
        if source ~= 0 then reply(source, 'No permission.', 'error') end
        return
    end

    local target = tonumber(args[1] or '')
    if not target then
        reply(source, ('Usage: /%s <id>'):format(Config.Commands.forceReload), 'error')
        return
    end

    if GetPlayerPing(target) <= 0 then
        reply(source, 'Target player not online.', 'error')
        return
    end

    TriggerClientEvent('admin_pedswap:reloadIllenium', target)
    reply(source, ('Triggered illenium skin reload for %d'):format(target), 'success')
end, false)
