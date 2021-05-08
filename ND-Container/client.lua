--[[
██╗ ██████╗███████╗██╗   ██╗ ██╗ ██╗ ██╗  ██╗ █████╗ ██╗  ██╗ █████╗ 
██║██╔════╝██╔════╝╚██╗ ██╔╝████████╗██║  ██║██╔══██╗██║  ██║██╔══██╗
██║██║     █████╗   ╚████╔╝ ╚██╔═██╔╝███████║╚█████╔╝███████║╚█████╔╝
██║██║     ██╔══╝    ╚██╔╝  ████████╗╚════██║██╔══██╗╚════██║██╔══██╗
██║╚██████╗███████╗   ██║   ╚██╔═██╔╝     ██║╚█████╔╝     ██║╚█████╔╝
╚═╝ ╚═════╝╚══════╝   ╚═╝    ╚═╝ ╚═╝      ╚═╝ ╚════╝      ╚═╝ ╚════╝  
]]--

local cooldown = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        oPlayer = PlayerPedId()
		local pedPos = GetEntityCoords(oPlayer)
        for k,v in pairs(Icey.objects.locations) do
            local oSelectedObject = GetClosestObjectOfType(pedPos.x, pedPos.y, pedPos.z, 0.8, GetHashKey(v.object), 0, 0, 0)
            local oEntityCoords = GetEntityCoords(oSelectedObject)
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), oEntityCoords.x,oEntityCoords.y,oEntityCoords.z, true ) < 8 then
            DrawText3D(oEntityCoords.x,oEntityCoords.y + 0.8,oEntityCoords.z + 1.8, "Tryk ~m~[E]~w~ for at lede skraldespanden igennem")
            if IsControlJustReleased(1, 38) then
                if cooldown == false then 
                    local player = GetPlayerPed(-1)
                    TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
                    exports['ND-Progressbar']:startUI(12000, "Leder skraldespanden igennem")
                    Citizen.Wait(12000)
                    exports['mythic_notify']:SendAlert('inform', 'Du ledede skraldespanden igennem')
                    TriggerServerEvent("icey-givitem")
                    ClearPedTasks(player)
                    cooldown = true
                else
                    exports['mythic_notify']:SendAlert('error', 'Du har lige ledt en skraldespand igennem, vent venligst...')
                end
            end
        end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if cooldown == true then
        Citizen.Wait(60000)
        cooldown = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 904.08428955078,3560.1396484375,33.807495117188, true ) < 4 then
            DrawText3D(904.08428955078,3560.1396484375,34.400495117188, "Tryk ~m~[E]~w~ for at sælge materialer")
            if IsControlJustReleased(1, 38) then
                local player = GetPlayerPed(-1)
                TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                exports['ND-Progressbar']:startUI(4000, "Sælger materialer")
                Citizen.Wait(4000)
                TriggerServerEvent("icey-salg")
                ClearPedTasks(player)
            end
        end
    end
end)

Citizen.CreateThread(function()
      stationBlip = AddBlipForCoord(904.08428955078,3560.1396484375,33.807495117188)
      SetBlipSprite(stationBlip, 467)
      SetBlipDisplay(stationBlip, 2)
      SetBlipAsShortRange(stationBlip, true)
      SetBlipScale(stationBlip, 1.1)
      SetBlipColour(stationBlip, 69)
      SetBlipScale(blip,1)
      SetBlipAlpha(stationBlip, 255)
      BeginTextCommandSetBlipName("String")
      AddTextComponentString("Genbrugsplads")
      EndTextCommandSetBlipName(stationBlip)
end)

flaske = Icey.flaske
pose = Icey.pose
dase = Icey.daase

RegisterNetEvent("flaske:besked")
AddEventHandler("flaske:besked", function()
    exports['mythic_notify']:SendAlert('inform', 'Du solgte 1 plastikflaske og modtog ' ..flaske.. ' KR')
end)

RegisterNetEvent("pose:besked")
AddEventHandler("pose:besked", function()
    exports['mythic_notify']:SendAlert('inform', 'Du solgte 1 plastikpose og modtog ' ..pose.. ' KR')
end)

RegisterNetEvent("dase:besked")
AddEventHandler("dase:besked", function()
    exports['mythic_notify']:SendAlert('inform', 'Du solgte 1 metaldåse og modtog ' ..dase.. ' KR')
end)

RegisterNetEvent("ingen:besked")
AddEventHandler("ingen:besked", function()
    exports['mythic_notify']:SendAlert('error', 'Du har ingen materialer på dig')
end)

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
