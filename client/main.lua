-- ## Interactions ## --

-- Clock In or Out Interaction
exports.interact:AddInteraction({
    coords = vec3(441.85, -981.98, 30.84),
    distance = 4.0,
    interactDst = 1.0,
    id = 'police_duty',
    groups = {
        ['police'] = 1,
    },
    options = {
        {
            label = 'Sign In / Out',
            action = function(entity, coords, args)
                playEmoteWithCallback('notepad', 1500, function()
                    TriggerServerEvent('QBCore:ToggleDuty')
                    exports["rpemotes"]:EmoteCancel(forceCancel)
                    clearProps()
                end)
            end,
        },
    }
})

-- Chief Office Boss Menu Interaction
exports.interact:AddInteraction({
    coords = vec3(461.47, -986.2, 30.66),
    distance = 4.0,
    interactDst = 1.0,
    id = 'police_management',
    groups = {
        ['police'] = 4,
    },
    options = {
        {
            label = 'Manage Employees',
            action = function(entity, coords, args)
                playEmoteWithCallback('clipboard', 1500, function()
                TriggerEvent('QBCore:Notify', "Looking at the Employees list", 'success', 1500)
                    TriggerEvent('qb-bossmenu:client:OpenMenu')
                    exports["rpemotes"]:EmoteCancel(forceCancel)
                    clearProps()
                end)
            end,
        },
    }
})


-- Clothing Room Interactions
exports.interact:AddInteraction({
    coords = vec3(462.98, -1000.02, 30.66),
    distance = 7.0,
    interactDst = 1.0,
    id = 'police_clothing',
    groups = {
        ['police'] = 1,
    },
    options = {
        {
            label = 'Look for Clothing',
            action = function(entity, coords, args)
                TriggerEvent('QBCore:Notify', Lang:t('isuccess.pdclothing1'), 'success', 1500)
                playEmoteWithCallback('picklock', 1500, function()
                    PlaySoundFromCoord(-1, "Generic_Door_Push", coords.x, coords.y, coords.z, "GTAO_Script_Doors_Sounds", 0, 0, 0)

                    Citizen.SetTimeout(300, function()
                        PlaySoundFromCoord(-1, "Clothes_Swap", coords.x, coords.y, coords.z, "GTAO_Change_Outfit_Sounds", 0, 0, 0)
                        TriggerEvent('qb-clothing:client:openMenu')

                        exports["rpemotes"]:EmoteCancel(forceCancel)
                        clearProps()
                    end)
                end)
            end,
        },
        {
            label = 'Clothing Cabinet',
            action = function(entity, coords, args)
                TriggerEvent('QBCore:Notify', Lang:t('interactions.pdclothing2'), 'success', 1500)
                playEmoteWithCallback('picklock', 1500, function()
                    PlaySoundFromCoord(-1, "Generic_Door_Push", coords.x, coords.y, coords.z, "GTAO_Script_Doors_Sounds", 0, 0, 0)

                    Citizen.SetTimeout(500, function()
                        PlaySoundFromCoord(-1, "Clothes_Swap", coords.x, coords.y, coords.z, "GTAO_Change_Outfit_Sounds", 0, 0, 0)
                        TriggerEvent("qb-clothing:client:openOutfitMenu")
                    end)

                    exports["rpemotes"]:EmoteCancel(forceCancel)
                    clearProps()
                end)
            end,
        },
    }
})

exports.interact:AddInteraction({
    coords = vec3(461.31, -1000.02, 30.68),
    distance = 6.0,
    interactDst = 1.0,
    id = 'police_clothing',
    groups = {
        ['police'] = 1,
    },
    options = {
        {
            label = 'Look for Clothing',
            action = function(entity, coords, args)
                TriggerEvent('QBCore:Notify', Lang:t('isuccess.pdclothing1'), 'success', 1500)
                playEmoteWithCallback('picklock', 1500, function()
                    PlaySoundFromCoord(-1, "Generic_Door_Push", coords.x, coords.y, coords.z, "GTAO_Script_Doors_Sounds", 0, 0, 0)

                    Citizen.SetTimeout(300, function()
                        PlaySoundFromCoord(-1, "Clothes_Swap", coords.x, coords.y, coords.z, "GTAO_Change_Outfit_Sounds", 0, 0, 0)
                        TriggerEvent('qb-clothing:client:openMenu')

                        exports["rpemotes"]:EmoteCancel(forceCancel)
                        clearProps()
                    end)
                end)
            end,
        },
        {
            label = 'Clothing Cabinet',
            action = function(entity, coords, args)
                TriggerEvent('QBCore:Notify', Lang:t('isuccess.pdclothing1'), 'success', 1500)
                playEmoteWithCallback('picklock', 1500, function()
                    PlaySoundFromCoord(-1, "Generic_Door_Push", coords.x, coords.y, coords.z, "GTAO_Script_Doors_Sounds", 0, 0, 0)

                    Citizen.SetTimeout(500, function()
                        PlaySoundFromCoord(-1, "Clothes_Swap", coords.x, coords.y, coords.z, "GTAO_Change_Outfit_Sounds", 0, 0, 0)
                        TriggerEvent("qb-clothing:client:openOutfitMenu")
                    end)

                    exports["rpemotes"]:EmoteCancel(forceCancel)
                    clearProps()
                end)
            end,
        },
    }
})

-- Locker Interactions
exports.interact:AddInteraction({
    coords = vec3(460.93, -995.57, 30.7),
    distance = 6.0,
    interactDst = 1.0,
    id = 'police_locker',
    groups = {
        ['police'] = 1,
    },
    options = {
        {
            label = 'Open Locker',
            action = function(entity, coords, args)
                playEmoteWithCallback('picklock', 1500, function()
                    PlaySoundFromCoord(-1, "Generic_Door_Push", coords.x, coords.y, coords.z, "GTAO_Script_Doors_Sounds", 0, 0, 0)
                    TriggerEvent('openstash:open', 'MRPD Locker')
                end)

                exports["rpemotes"]:EmoteCancel(forceCancel)
                clearProps()
            end,
        },
    }
})

exports.interact:AddInteraction({
    coords = vec3(463.16, -995.57, 30.69),
    distance = 7.0,
    interactDst = 1.0,
    id = 'police_locker',
    groups = {
        ['police'] = 1,
    },
    options = {
        {
            label = 'Open Locker',
            action = function(entity, coords, args)
                playEmoteWithCallback('picklock', 1500, function()
                    PlaySoundFromCoord(-1, "Generic_Door_Push", coords.x, coords.y, coords.z, "GTAO_Script_Doors_Sounds", 0, 0, 0)
                    TriggerEvent('exytralib:open:stash', 'MRPD Locker')
                end)

                exports["rpemotes"]:EmoteCancel(forceCancel)
                clearProps()
            end,
        },
    }
})

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
