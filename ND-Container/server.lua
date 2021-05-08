--[[
██╗ ██████╗███████╗██╗   ██╗ ██╗ ██╗ ██╗  ██╗ █████╗ ██╗  ██╗ █████╗ 
██║██╔════╝██╔════╝╚██╗ ██╔╝████████╗██║  ██║██╔══██╗██║  ██║██╔══██╗
██║██║     █████╗   ╚████╔╝ ╚██╔═██╔╝███████║╚█████╔╝███████║╚█████╔╝
██║██║     ██╔══╝    ╚██╔╝  ████████╗╚════██║██╔══██╗╚════██║██╔══██╗
██║╚██████╗███████╗   ██║   ╚██╔═██╔╝     ██║╚█████╔╝     ██║╚█████╔╝
╚═╝ ╚═════╝╚══════╝   ╚═╝    ╚═╝ ╚═╝      ╚═╝ ╚════╝      ╚═╝ ╚════╝  
]]--

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","ND-Container")

local random = 0

local antal = 0

local item = "intet"

RegisterNetEvent("icey-givitem")
AddEventHandler("icey-givitem", function()
    local source = source
    local user_id = vRP.getUserId({source})
    random = math.random(1, 4)

    if random == 1 then
        item = "plastikflaske"
    elseif random == 2 then
        item = "plastikpose"
    elseif random == 3 then
        item = "metaldåse"
    elseif random == 4 then
        item = "bananskrald"
    end

    antal = math.random(Icey.min, Icey.max)
    vRP.giveInventoryItem({user_id,item,antal,true})
end)

RegisterNetEvent("icey-salg")
AddEventHandler("icey-salg", function()
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.getInventoryItemAmount({user_id,"plastikflaske"}) > 0 then
        vRP.tryGetInventoryItem({user_id,"plastikflaske",1,true})
        vRP.giveMoney({user_id,Icey.flaske})
        TriggerClientEvent("flaske:besked", source)
    elseif vRP.getInventoryItemAmount({user_id,"plastikpose"}) > 0 then
        vRP.tryGetInventoryItem({user_id,"plastikpose",1,true})
        vRP.giveMoney({user_id,Icey.pose})
        TriggerClientEvent("pose:besked", source)
    elseif vRP.getInventoryItemAmount({user_id,"metaldåse"}) > 0 then
        vRP.tryGetInventoryItem({user_id,"metaldåse",1,true})
        vRP.giveMoney({user_id,Icey.daase})
        TriggerClientEvent("dase:besked", source)
    else
        TriggerClientEvent("ingen:besked", source)
    end
end)