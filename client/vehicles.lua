QBCore = exports['qb-core']:GetCoreObject()

-- Define vehicle models
local vehicleModels = {
    'police',
    'police2',
    'sheriff',
    'policeold2',
    'police4',
    'pranger',
    'fbi'
    -- Add more models as needed
}

-- Define offsets and interaction distances for specific vehicles
local vehicleDetails = {
    ['police'] = {
        offset = vec3(0.0, -2.5, 0.4),
        interactDst = 1.0,
        distance = 2.0
    },
    ['police2'] = {
        offset = vec3(0.0, -2.25, 0.4),
        interactDst = 1.0,
        distance = 2.0
    },
    ['police4'] = {
        offset = vec3(0.0, -2.5, 0.4),
        interactDst = 1.0,
        distance = 2.0
    },
    ['fbi'] = {
        offset = vec3(0.0, -2.3, 0.4),
        interactDst = 1.0,
        distance = 2.0
    },
    ['sheriff'] = {
        offset = vec3(0.0, -2.5, 0.4),
        interactDst = 2.0,
        distance = 7.0
    },
    ['policeold2'] = {
        offset = vec3(0.0, -2.2, 0.4),
        interactDst = 2.0,
        distance = 7.0
    },
    ['pranger'] = {
        offset = vec3(0.0, -3.0, 0.0),
        interactDst = 2.0,
        distance = 7.0
    }
    -- Add details for other models as needed
}

local BackEngineVehicles = {
    ['ninef'] = true,
    ['adder'] = true,
    ['vagner'] = true,
    ['t20'] = true,
    ['infernus'] = true,
    ['zentorno'] = true,
    ['reaper'] = true,
    ['comet2'] = true,
    ['comet3'] = true,
    ['jester'] = true,
    ['jester2'] = true,
    ['cheetah'] = true,
    ['cheetah2'] = true,
    ['prototipo'] = true,
    ['turismor'] = true,
    ['pfister811'] = true,
    ['ardent'] = true,
    ['nero'] = true,
    ['nero2'] = true,
    ['tempesta'] = true,
    ['vacca'] = true,
    ['bullet'] = true,
    ['osiris'] = true,
    ['entityxf'] = true,
    ['turismo2'] = true,
    ['fmj'] = true,
    ['re7b'] = true,
    ['tyrus'] = true,
    ['italigtb'] = true,
    ['penetrator'] = true,
    ['monroe'] = true,
    ['ninef2'] = true,
    ['stingergt'] = true,
    ['surfer'] = true,
    ['surfer2'] = true,
    ['gp1'] = true,
    ['autarch'] = true,
    ['tyrant'] = true
}

-- Function to check if a table includes a value
function table.includes(tbl, value)
    for _, v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

-- Function to toggle a vehicle door
local function ToggleDoor(vehicle, door)
    if GetVehicleDoorLockStatus(vehicle) < 2 then
        local doorAngle = GetVehicleDoorAngleRatio(vehicle, door)
     --   print("DEBUG: Current door angle ratio: " .. tostring(doorAngle)) -- Debug message

        if doorAngle > 0.0 then
            -- Door is open; close it
         --   print("DEBUG: Closing door " .. tostring(door)) -- Debug message
            SetVehicleDoorShut(vehicle, door, false)
        else
            -- Door is closed; open it
       --     print("DEBUG: Opening door " .. tostring(door)) -- Debug message
            SetVehicleDoorOpen(vehicle, door, false)
        end
    else
      --  print("DEBUG: Vehicle is locked; cannot toggle door") -- Debug message
    end
end

function GetVehiclePlate(entity)
    return GetVehicleNumberPlateText(entity)
end

local trunkState = {}

-- Function to handle closing the trunk
local function closeTrunk(entity, vehiclePlate, doorToToggle)
    ToggleDoor(entity, doorToToggle)
    trunkState[vehiclePlate] = false
end

local function CloseTrunk()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    SetVehicleDoorShut(vehicle, 5, false)
end

local trunkState = {}

local function addVehicleInteraction(model)
    local options = {
        {
            label = 'Trunk',
            action = function(entity)
                local vehiclePlate = GetVehiclePlate(entity)
                local vehicleModel = GetEntityModel(entity)
                local menuId = 69

                -- Check if the vehicle is locked
                if GetVehicleDoorLockStatus(entity) ~= 1 then
                    TriggerEvent('QBCore:Notify', "The vehicle is locked", 'error', 1500)
                    return
                end

                local doorToToggle = BackEngineVehicles[vehicleModel] and 4 or 5

                if not trunkState[vehiclePlate] then
                    -- Trunk is closed, so open it and the inventory
                    ToggleDoor(entity, doorToToggle)
                    trunkState[vehiclePlate] = true

                    -- Open the trunk and inventory
                    -- Comment this if you are using PA-Inventory
                    TriggerEvent('exytralib:open:trunk', vehiclePlate, vehicleModel)

                    -- Uncomment this if you are using PA-Inventory
                    -- TriggerEvent('inventory:client:SetCurrentStash', vehiclePlate .. menuId)
                    -- TriggerServerEvent('inventory:server:OpenInventory', 'stash', vehiclePlate .. menuId, {
                    --     maxweight = 2000000,
                    --     slots = 20
                    -- })
                else
                    -- Trunk is open, so close it
                    closeTrunk(entity, vehiclePlate, doorToToggle)
                    trunkState[vehiclePlate] = nil
                end
            end,
        }
    }

    -- Determine the offset and interactDst for the model, default values if not specified
    local details = vehicleDetails[model] or {
        offset = vec3(0.0, 0.0, 0.0),
        interactDst = 1.0,
        distance = 8.0,
        bone = "engine"
    }

    exports.interact:AddModelInteraction({
        model = model,
        id = 'vehicle_' .. model, -- Ensure unique IDs for each interaction
        distance = details.distance, -- Optional
        interactDst = details.interactDst, -- Use the specified interactDst
        ignoreLos = false, -- Optional, ignores line of sight
        offset = details.offset, -- Use the specified offset
        bone = details.bone,
        options = options
    })
end


-- Add interactions for each model
for _, model in ipairs(vehicleModels) do
    addVehicleInteraction(model)
end
