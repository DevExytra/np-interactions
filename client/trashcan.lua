local binModels = {
    'prop_bin_01a',
    'prop_bin_02a',
    'prop_bin_03a',
    'prop_bin_04a',
    'prop_bin_05a',
    'prop_bin_06a',
    'prop_bin_07a',
    'prop_bin_07b',
    'prop_bin_07c',
    'prop_bin_07d',
    'prop_bin_08a',
    'prop_bin_08open',
    'prop_bin_09a',
    'prop_bin_10a',
    'prop_dumpster_02b', 
    'prop_dumpster_01a',
    'prop_dumpster_03a' 
    -- Add more models as needed
}

local searchableDumpsters = {
    'prop_dumpster_02b',
    'prop_dumpster_01a',
    'prop_dumpster_03a'
    -- Add more searchable dumpster models as needed
}

-- Define offsets and interaction distances for specific props
local propDetails = {
    ['prop_bin_01a'] = { offset = vec3(0.0, 0.0, 0.9), interactDst = 2.0, distance = 5.0 },
    ['prop_bin_10a'] = { offset = vec3(0.0, 0.0, 0.6), interactDst = 1.0, distance = 4.0 }, 
    ['prop_dumpster_02b'] = { offset = vec3(0.0, 0.0, 1.0), interactDst = 2.5, distance = 4.0 },
    ['prop_dumpster_01a'] = { offset = vec3(0.0, 0.0, 1.2), interactDst = 3.0, distance = 4.0 },
    ['prop_dumpster_03a'] = { offset = vec3(0.0, 0.0, 1.1), interactDst = 2.8, distance = 4.0 },
    -- Add details for other models as needed
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

-- Function to add bin interaction with specific offset and interactDst
local function addBinInteraction(model)
    local options = {
        {
            label = 'Open Trash',
            action = function(entity, coords, args)
                TriggerEvent('exytralib:open:bin', "Trashcan")
             --   print(entity, coords, json.encode(args))
            end,
        }
    }

    -- Add 'Search Trash' option only for models in the searchableDumpsters list
    if table.includes(searchableDumpsters, model) then
        table.insert(options, {
            label = 'Search Trash',
            action = function(entity, coords, args)
                TriggerEvent('qb-trashsearch:client:searchtrash')
              --  print(entity, coords, json.encode(args))
            end,
        })
    end

    -- Determine the offset and interactDst for the model, default to vec3(0.0, 0.0, 0.9) and 2.0 if not specified
    local details = propDetails[model] or { offset = vec3(0.0, 0.0, 0.0), interactDst = 1.0, distance = 1.0 }

    exports.interact:AddModelInteraction({
        model = model,
        id = 'trashbin_' .. model, -- Ensure unique IDs for each interaction
        distance = details.distance, -- optional
        interactDst = details.interactDst, -- Use the specified interactDst
        ignoreLos = false, -- optional ignores line of sight
        offset = details.offset, -- Use the specified offset
        options = options
    })
end

-- Add interactions for each model
for _, model in ipairs(binModels) do
    addBinInteraction(model)
end
