local spawnped = true

-- OX Target system, benyt dit eget hvis du ønsker 
exports.ox_target:addSphereZone({
    coords = vec3(-547.7167, -209.1895, 37.6498), -- ændrer disse koordinater
    size = vec3(2, 2, 2),
    rotation = 257.0,
    debug = false,
    options = {
        {
            name = 'open_jobcenter',
            event = 'at_jobcenter:åben',
            icon = 'fa-solid fa-suitcase',
            label = 'Jobcentret'
        }
    }
})

-- Joncenterets context menu, bygget op på ox context menu
RegisterNetEvent('at_jobcenter:åben', function(job)
    lib.registerContext({
        id = 'jobcenter_menu',
        title = '🏢Jobcentret🏢',
        onExit = function()
        end,
        options = {
            {
                title = '🏢Velkommen til byens jobcenter🏢 \nHer har du mulighed for at vælge lige dit drømme job!',
              },
            {
                title = 'Kontanthjælp',
                description = 'Du modtager kontanthjælp! \n💵Indkomst: 500 DKK',
                onSelect = function(args)
                    lib.notify({
                        title = 'Jobcenter',
                        description = 'Du valgte kontanthjælp!',
                        type = 'inform'
                    })
                end,
                event = 'at_jobcenter:job1'
            },
            {
                title = 'Skraldemand', 
                description = 'Sørg for at holde byen ren! \n💵Indkomst: 1000 DKK',
                onSelect = function(args)
                    lib.notify({
                        title = 'Jobcenter',
                        description = 'Du valgte Skraldemand, som dit nye arbejde! Tilykke',
                        type = 'inform'
                    })
                end,
                event = 'at_jobcenter:job2'
            },
            {
                title = 'Skrædder', 
                description = 'Sørg for der er nyt tøj i butikkerne! \n💵Indkomst: 500 DKK',
                onSelect = function(args)
                    lib.notify({
                        title = 'Jobcenter',
                        description = 'Du valgte Skrædder, som dit nye arbejde! Tilykke',
                        type = 'inform'
                    })
                end,
                event = 'at_jobcenter:job3'
            },
            {
                title = 'Taxa Chauffører', 
                description = 'Kør folk rundt og hjælp folk der ikke kan komme videre! \n💵Indkomst: 500 DKK',
                onSelect = function(args)
                    lib.notify({
                        title = 'Jobcenter',
                        description = 'Du valgte taxi, som dit nye arbejde! Tilykke',
                        type = 'inform'
                    })
                end,
                event = 'at_jobcenter:job4'
            },
            {
                title = 'Postnord', 
                description = 'Sørg for at borgerne modtager deres post! \n💵Indkomst: 500 DKK',
                onSelect = function(args)
                    lib.notify({
                        title = 'Jobcenter',
                        description = 'Du valgte Postnord, som dit nye arbejde! Tilykke',
                        type = 'inform'
                    })
                end,
                event = 'at_jobcenter:job5'
            },
            --[[ Eksempel
            {
                title = 'Job navn', 
                description = 'Job beskrivelse',
                onSelect = function(args)
                    lib.notify({
                        title = 'Jobcenter',
                        description = 'Du valgte Jobnavn, som dit nye arbejde! Tilykke',
                        type = 'inform'
                    })
                end,
                event = 'job event'
            },
            --]]
        }
    })
    lib.showContext('jobcenter_menu')
end)



-- PED spawn 
Citizen.CreateThread(function()
    while true do
        if spawnped == true then
            spawnped = false
            RequestModel(GetHashKey('a_f_y_femaleagent'))
            while not HasModelLoaded(GetHashKey('a_f_y_femaleagent')) do
                Wait(1)
            end

            ped1 = CreatePed(4, GetHashKey('a_f_y_femaleagent'), -547.7167, -209.1895, 36.6498, 211.9808, false, true) -- ændrer disse koordinater
            FreezeEntityPosition(ped1, true)
            SetEntityInvincible(ped1, true)
            SetBlockingOfNonTemporaryEvents(ped1, true)
        end
        Citizen.Wait(10000)
    end
end)


-- EventHandlers - opret en ny, når du tilføjer et nyt job under server.lua
AddEventHandler('at_jobcenter:job1', function(job)
	TriggerServerEvent("at_jobcenter:job1")
end)

AddEventHandler('at_jobcenter:job2', function(job)
	TriggerServerEvent("at_jobcenter:job2")
end)


AddEventHandler('at_jobcenter:job3', function(job)
	TriggerServerEvent("at_jobcenter:job3")
end)

AddEventHandler('at_jobcenter:job4', function(job)
	TriggerServerEvent("at_jobcenter:job4")
end)

AddEventHandler('at_jobcenter:job5', function(job)
	TriggerServerEvent("at_jobcenter:job5")
end)

-- Eksempel

--[[
AddEventHandler('at_jobcenter:job4', function(job) HUSK OG ÆNDRE TALLERNE ALTSÅ (job4) HVERGANG DU LAVER EN NY!!
	TriggerServerEvent("at_jobcenter:job4") HUSK OG ÆNDRE TALLERNE ALTSÅ (job4) HVERGANG DU LAVER EN NY!!
end)
--]]


-- Ikon på mappet
CreateThread(function()
	local blip = AddBlipForCoord(230.9772, -423.5092, 47.9727) -- ændrer disse koordinater

	SetBlipSprite (blip, 475)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.7)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName('Jobcenter')
	EndTextCommandSetBlipName(blip)
end)
        