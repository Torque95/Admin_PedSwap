local function notify(title, desc, ntype)
    if GetResourceState('ox_lib') ~= 'started' then return end
    lib.notify({ title = title or 'admin_pedswap', description = desc or '', type = ntype or 'inform' })
end

local function requestModel(hash)
    RequestModel(hash)
    local timeout = GetGameTimer() + 10000
    while not HasModelLoaded(hash) do
        Wait(0)
        if GetGameTimer() > timeout then
            return false
        end
    end
    return true
end

local function isValidModel(hash)
    return IsModelInCdimage(hash) and IsModelValid(hash)
end

local function setPlayerPed(modelName)
    local hash = joaat(modelName)
    if not isValidModel(hash) then
        notify('admin_pedswap', ('Invalid ped model: %s'):format(modelName), 'error')
        return
    end

    if not requestModel(hash) then
        notify('admin_pedswap', ('Failed loading model: %s'):format(modelName), 'error')
        return
    end

    SetPlayerModel(PlayerId(), hash)
    SetModelAsNoLongerNeeded(hash)
end

local function reloadIllenium()
    if GetResourceState('illenium-appearance') ~= 'started' then
        notify('admin_pedswap', 'illenium-appearance not started; cannot reload skin.', 'error')
        return
    end

    -- Common illenium reload path. Calling both variants to cover installs.
    TriggerEvent('illenium-appearance:client:reloadSkin', true)
    TriggerEvent('illenium-appearance:client:reloadSkin')
end

RegisterNetEvent('admin_pedswap:applyPed', function(modelName)
    setPlayerPed(modelName)
    -- One-time only: no persistence, no re-apply logic.
end)

RegisterNetEvent('admin_pedswap:reloadIllenium', function()
    reloadIllenium()
end)
