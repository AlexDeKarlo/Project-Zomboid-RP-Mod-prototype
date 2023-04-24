if isServer() then return end;

function SendToFarmer(player,count)

    local username = player:getUsername()
    local TONPCData = {}
	
	TONPCData.steamID = getSteamIDFromUsername(username);
    TONPCData.count = count;
   
    print("SteamID "..tostring(TONPCData.steamID))
	print("Count "..tostring(TONPCData.count))
	
    sendClientCommand("ProjectRP", "SendToFarmer", TONPCData)
end

function SendToForeman(player,count)

    local username = player:getUsername()
    local Data = {}
	
	Data.steamID = getSteamIDFromUsername(username);
    Data.count = count;
   
    print("SteamID "..tostring(Data.steamID))
	print("Count "..tostring(Data.count))
    sendClientCommand("ProjectRP", "SendToForeman", Data)
end

-- RECIVE

function ReciveFromFarmer(player,count)

    local username = player:getUsername()
    local Data = {}
	
	Data.steamID = getSteamIDFromUsername(username);
    Data.count = count;
   
    print("SteamID "..tostring(Data.steamID))
	print("Count "..tostring(Data.count))
	
    sendClientCommand("ProjectRP", "ReciveFromFarmer", Data)
end

function ReciveFromForeman(player,count)

    local username = player:getUsername()
    local Data = {}
	
	Data.steamID = getSteamIDFromUsername(username);
    Data.count = count;
   
    print("SteamID "..tostring(Data.steamID))
	print("Count "..tostring(Data.count))
	
    sendClientCommand("ProjectRP", "ReciveFromForeman", Data)
end