local spawnedPeds = {}
local spawnedPetPeds = {}

--------------------------------------
-- PETSHOP NPC SPAWN
--------------------------------------

CreateThread(function()
    while true do
        Wait(500)
        for k,v in pairs(Config.Shops) do
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - v.npccoords.xyz)

            if distance < Config.DistanceSpawn and not spawnedPeds[k] then
                local spawnedPed = NearPed(v.npcmodel, v.npccoords)
                spawnedPeds[k] = { spawnedPed = spawnedPed }
				TaskStartScenarioInPlace(spawnedPed, joaat(v.scenario), -1, true)
            end
            
            if distance >= Config.DistanceSpawn and spawnedPeds[k] then
                if Config.FadeIn then
                    for i = 255, 0, -51 do
                        Wait(50)
                        SetEntityAlpha(spawnedPeds[k].spawnedPed, i, false)
                    end
                end
                DeletePed(spawnedPeds[k].spawnedPed)
                spawnedPeds[k] = nil
            end
        end
    end
end)

function NearPed(npcmodel, npccoords)
    RequestModel(npcmodel)
    while not HasModelLoaded(npcmodel) do
        Wait(50)
    end
    spawnedPed = CreatePed(npcmodel, npccoords.x, npccoords.y, npccoords.z - 1.0, npccoords.w, false, false, 0, 0)
    SetEntityAlpha(spawnedPed, 0, false)
    SetRandomOutfitVariation(spawnedPed, true)
    SetEntityCanBeDamaged(spawnedPed, false)
    SetEntityInvincible(spawnedPed, true)
    FreezeEntityPosition(spawnedPed, true)
    SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    -- set relationship group between npc and player
    SetPedRelationshipGroupHash(spawnedPed, GetPedRelationshipGroupHash(spawnedPed)) -- SetPedRelationshipGroupHash
    SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(spawnedPed), `PLAYER`) -- SetRelationshipBetweenGroups
    if Config.Debug then
        local relationship = GetRelationshipBetweenGroups(GetPedRelationshipGroupHash(spawnedPed), `PLAYER`) -- GetRelationshipBetweenGroups
        print(relationship)
    end
    -- end of relationship group
    if Config.FadeIn then
        for i = 0, 255, 51 do
            Wait(50)
            SetEntityAlpha(spawnedPed, i, false)
        end
    end
    -- if target is enabled
    if Config.EnableTarget then
        exports['rsg-target']:AddTargetEntity(spawnedPed, {
            options = {
                {
                    icon = "fa-solid fa-paw",
                    label = Lang:t('label.petshop'),
                    targeticon = "fas fa-eye",
                    action = function()
                        TriggerEvent("tbrp_companions:client:openpetshop2")
                    end
                },
            },
            distance = 3.0,
        })
    end
    return spawnedPed
end

--------------------------------------
-- PETSHOP PET NPC SPAWN
--------------------------------------

CreateThread(function()
    while true do
        Wait(500)
        for k2,v2 in pairs(Config.Shops) do
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - v2.npcpetcoords.xyz)

            if distance < Config.DistanceSpawn and not spawnedPetPeds[k2] then
                local spawnedPed2 = NearPed2(v2.npcpetmodel, v2.npcpetcoords)
                spawnedPetPeds[k2] = { spawnedPed2 = spawnedPed2 }
            end
            
            if distance >= Config.DistanceSpawn and spawnedPetPeds[k2] then
                if Config.FadeIn then
                    for i2 = 255, 0, -51 do
                        Wait(50)
                        SetEntityAlpha(spawnedPetPeds[k2].spawnedPed2, i2, false)
                    end
                end
                DeletePed(spawnedPetPeds[k2].spawnedPed2)
                spawnedPetPeds[k2] = nil
            end
        end
    end
end)

function NearPed2(npcpetmodel, npcpetcoords)
    RequestModel(npcpetmodel)
    while not HasModelLoaded(npcpetmodel) do
        Wait(50)
    end
    spawnedPed2 = CreatePed(npcpetmodel, npcpetcoords.x, npcpetcoords.y, npcpetcoords.z - 1.0, npcpetcoords.w, false, false, 0, 0)
    SetEntityAlpha(spawnedPed2, 0, false)
    SetRandomOutfitVariation(spawnedPed2, true)
    SetEntityCanBeDamaged(spawnedPed2, false)
    SetEntityInvincible(spawnedPed2, true)
    FreezeEntityPosition(spawnedPed2, true)
    SetBlockingOfNonTemporaryEvents(spawnedPed2, true)
    -- set relationship group between npc and player
    SetPedRelationshipGroupHash(spawnedPed2, GetPedRelationshipGroupHash(spawnedPed2)) -- SetPedRelationshipGroupHash
    SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(spawnedPed2), `PLAYER`) -- SetRelationshipBetweenGroups
    if Config.Debug then
        local relationship2 = GetRelationshipBetweenGroups(GetPedRelationshipGroupHash(spawnedPed2), `PLAYER`) -- GetRelationshipBetweenGroups
        print(relationship2)
    end
    -- end of relationship group
    if Config.FadeIn then
        for i2 = 0, 255, 51 do
            Wait(50)
            SetEntityAlpha(spawnedPed2, i2, false)
        end
    end
    return spawnedPed2
end

-- cleanup
AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    for k,v in pairs(spawnedPeds) do
        DeletePed(spawnedPeds[k].spawnedPed)
        spawnedPeds[k] = nil
    end
    for k2,v2 in pairs(spawnedPetPeds) do
        DeletePed(spawnedPetPeds[k2].spawnedPed2)
        spawnedPetPeds[k2] = nil
    end
end)
