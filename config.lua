Config = {}

-- Admin-only ACE permission required for all commands (console always allowed)
Config.AcePerm = 'admin.pedswap'

Config.Commands = {
    setPed = 'setped',               -- /setped <id> <model>
    forceReload = 'forcereloadskin', -- /forcereloadskin <id>
}

-- Optional notifications via ox_lib if present
Config.UseOxNotify = true

Config.Notify = function(src, title, description, ntype)
    if not Config.UseOxNotify then return end
    if GetResourceState('ox_lib') ~= 'started' then return end

    TriggerClientEvent('ox_lib:notify', src, {
        title = title or 'admin_pedswap',
        description = description or '',
        type = ntype or 'inform'
    })
end
