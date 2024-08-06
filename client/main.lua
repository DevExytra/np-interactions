
-- ## Threads ## --
RegisterNetEvent('exytralib:client:playAnimation', function() -- Animation Wrapper for qb-inventory server > main.lua line 550
    local playerPed = PlayerPedId()
    if not playerPed or not DoesEntityExist(playerPed) then return end

    -- Load the animation dictionary
    RequestAnimDict("mp_common")
    while not HasAnimDictLoaded("mp_common") do
        Citizen.Wait(100)
    end

    -- Play the animation
    TaskPlayAnim(playerPed, "mp_common", "givetake1_a", 8.0, -8.0, 1500, 49, 0, false, false, false)

    -- Optional: Wait for the animation to complete
    Citizen.Wait(1500)
end)

RegisterNetEvent('exytralib:client:playPickupAnimation', function() -- Animation Wrapper for qb-inventory server > main.lua line 550
    local playerPed = PlayerPedId()
    if not playerPed or not DoesEntityExist(playerPed) then return end

    -- Load the animation dictionary
    RequestAnimDict("mp_common")
    while not HasAnimDictLoaded("mp_common") do
        Citizen.Wait(100)
    end

    -- Play the animation
    TaskPlayAnim(playerPed, "mp_common", "givetake1_a", 8.0, -8.0, 1500, 49, 0, false, false, false)

    -- Optional: Wait for the animation to complete
    Citizen.Wait(1500)
end)

RegisterNetEvent('exytralib:open:stash')
AddEventHandler('exytralib:open:stash', function(box)
    local name = box
    TriggerServerEvent("inventory:server:OpenInventory", "stash", name, {
        maxweight = 25000000,
        slots = 100,
    })
    TriggerEvent("inventory:client:SetCurrentStash", name)
end)

RegisterNetEvent('exytralib:open:trunk')
AddEventHandler('exytralib:open:trunk', function(box)
    local name = box
    TriggerServerEvent("inventory:server:OpenInventory", "stash", name, {
        maxweight = 25000000,
        slots = 100,
    })
    TriggerEvent("inventory:client:SetCurrentStash", name)
end)

RegisterNetEvent('exytralib:open:bin')
AddEventHandler('exytralib:open:bin', function(box)
    local name = box
    TriggerServerEvent("inventory:server:OpenInventory", "stash", name, {
        maxweight = 25000000,
        slots = 100,
    })
    TriggerEvent("inventory:client:SetCurrentStash", name)
end)
