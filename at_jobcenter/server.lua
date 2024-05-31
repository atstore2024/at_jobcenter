ESX = nil

ESX = exports["es_extended"]:getSharedObject() -- lavet til den nyere version af ESX Legacy.


-- Brug følgende event, hvis du bruger en ældre version af esx og fjern den overstående.

--[[
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
--]]


RegisterServerEvent("at_jobcenter:job1") 
AddEventHandler('at_jobcenter:job1', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob("unemployed", 0)
end)

RegisterServerEvent("at_jobcenter:job2") 
AddEventHandler('at_jobcenter:job2', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob("garbage", 0)

end)

RegisterServerEvent("at_jobcenter:job3") 
AddEventHandler('at_jobcenter:job3', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob("tailor", 0)

end)

RegisterServerEvent("at_jobcenter:job4") 
AddEventHandler('at_jobcenter:job4', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob("taxi", 0)

end)

RegisterServerEvent("at_jobcenter:job5") 
AddEventHandler('at_jobcenter:job5', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob("mail", 0)

end)


-- Eksempel på server.lua

--[[
RegisterServerEvent("at_jobcenter:job4") HUSK OG ÆNDRE TALLERNE ALTSÅ (job4) HVERGANG DU LAVER EN NY!!
AddEventHandler('at_jobcenter:job4', function(job) HUSK OG ÆNDRE TALLERNE ALTSÅ (job4) HVERGANG DU LAVER EN NY!!
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob("trucker", 0) Job id navnet

end)
--]]
