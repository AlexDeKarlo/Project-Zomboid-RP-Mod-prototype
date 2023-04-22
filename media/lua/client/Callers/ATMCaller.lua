if isServer() then return end;

function SendToATM(wallet,count)
	local player = getPlayer()
    local username = player:getUsername()
    
    local ToAtmData = {}
	
	ToAtmData.steamID = getSteamIDFromUsername(username);
    ToAtmData.wallet = wallet;
    ToAtmData.count = count;
   
    print("SteamID "..tostring(ToAtmData.steamID))
    print("Wallet "..tostring(ToAtmData.wallet))
	print("Count "..tostring(ToAtmData.count))
	
    sendClientCommand("ProjectRP", "SendToATM", ToAtmData)
end


function ReciveFromATM(wallet,pin,count)

	local FromAtmData = {}
	
    FromAtmData.wallet = wallet;
	FromAtmData.pin = pin;
    FromAtmData.count = count;
	
	print("Pin "..tostring(FromAtmData.pin))
    print("Wallet "..tostring(FromAtmData.wallet))
	print("Count "..tostring(FromAtmData.count))
	
    sendClientCommand("ProjectRP", "ReciveFromATM", FromAtmData)
end
