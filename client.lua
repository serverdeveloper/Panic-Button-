
--[[
As mentioned in the readme and the resource, this is my first script - a Panic Button script. If you see any faults, let me know! 

Orginally From - aka-lucifer, Vespera and Austin Grandpre
Edited By - Callum
Created - 01-22-2019

Change Log:
10-12-2018 - I have now made the command pb and it displays a message in chat giving the location
10-12-2018 - Added the ability to show a cross street and if there is no cross street, what to do.
]]

RegisterCommand('pb', function(source, args, rawCommand)
    local ped = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(ped, false))
    local streetName, crossing = GetStreetNameAtCoord(x, y, z)
    streetName = GetStreetNameFromHashKey(streetName)
    local message = ""
    if crossing ~= nil then
        crossing = GetStreetNameFromHashKey(crossing)
        message = "(INFO) " .. GetPlayerName(source) .. " has called a 10-99 near " .. streetName .. " and " .. crossing
    else
        message = "(INFO) " .. GetPlayerName(source) .. " has called a 10-99 near " .. streetName .. " ^1 Notice: No Nearby Cross-Street"
	end

    TriggerServerEvent('sendPlayerChatMessage', -1, message, {255, 0, 0})
end, false)


