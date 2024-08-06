-- Register the server-side event
RegisterNetEvent('extralib:client:notify')

-- Define what happens when the event is triggered
AddEventHandler('extralib:client:notify', function(message)
    -- Trigger the chat message event to all clients (-1 means all clients)
 --   TriggerClientEvent('chatMessage', -1, "SYSTEM", 1, message, 'game')
end)

-- Handle resource start
AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        -- Create a new thread that runs indefinitely
        Citizen.CreateThread(function()
            while true do
                -- This Deletes the Created Trashcan stash so the trashcans empty them selves
                MySQL.query("DELETE FROM stashitems WHERE stash = @stashName", { ['@stashName'] = 'Trashcan' }, function(result)
                    -- Notify in the chat that the deletion was executed
                --    TriggerEvent('extralib:client:notify', 'Trashbins have been cleared') 
                end)

                -- Wait for 2 minutes (120,000 milliseconds) before running again
                Citizen.Wait(5 * 60 * 1000)
            end
        end)
    end
end)
