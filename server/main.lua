local QBCore = exports['qb-core']:GetCoreObject()
local availableJobs = {
    ["unemployed"] = "Unemployed",
    ["trucker"] = "Trucker",
    ["taxi"] = "Taxi",
    ["tow"] = "Tow Truck",
    ["reporter"] = "News Reporter",
    ["garbage"] = "Garbage Collector",
    ["bus"] = "Bus Driver",
    --["hotdog"] = "Hot Dog Stand"
}

-- Exports

local function AddCityJob(jobName, label)
    if availableJobs[jobName] ~= nil then
        return false, "already added"
    else
        availableJobs[jobName] = label
        return true, "success"
    end
end

exports('AddCityJob', AddCityJob)

-- Functions

-- Callbacks

QBCore.Functions.CreateCallback('qb-cityhall:server:receiveJobs', function(_, cb)
    cb(availableJobs)
end)

-- Events

RegisterNetEvent('qb-cityhall:server:requestId', function(item, hall)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local itemInfo = Config.Cityhalls[hall].licenses[item]
    if not Player.Functions.RemoveMoney("cash", itemInfo.cost) then return TriggerClientEvent('QBCore:Notify', src, ('You don\'t have enough money on you, you need %s cash'):format(itemInfo.cost), 'error') end
    local info = {}
    if item == "id_card" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
    elseif item == "driver_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Class C Driver License"
    elseif item == "boat_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.type = "Pleasurecraft Operator's License"
    elseif item == "firearm_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.type = "Firearms [Unrestricted] License"
    elseif item == "firearm_restricted_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.type = "Firearms [Restricted] License"
    elseif item == "outdoor_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.type = "Outdoors License"
    -- DEPRECATE --
    elseif item == "weaponlicense" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
    else
        return DropPlayer(src, 'Attempted exploit abuse')
    end
    if not Player.Functions.AddItem(item, 1, nil, info) then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
end)

RegisterNetEvent('qb-cityhall:server:ApplyJob', function(job, cityhallCoords)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local ped = GetPlayerPed(src)
    local pedCoords = GetEntityCoords(ped)
    local JobInfo = QBCore.Shared.Jobs[job]
    if #(pedCoords - cityhallCoords) >= 20.0 or not availableJobs[job] then
        return DropPlayer(source, "Attempted exploit abuse")
    end
    Player.Functions.SetJob(job, 0)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.new_job', {job = JobInfo.label}))
end)

--RegisterNetEvent('qb-cityhall:server:getIDs', giveStarterItems)