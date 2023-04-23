if not isServer() then return end;

-- Parse player data and save it to a .csv file inside Lua/ServerPlayersData/ folder
local function SaveATMData(data)
    if data then
		
		local steamid = data.steamID
		local countINT = 0
		local pin = nil
			
		local dataRead = getFileReader("/ServerATMData/" .. tostring(data.wallet) .. ".txt", false)
		if dataRead then 
		pin = dataRead:readLine()
		countSTR = dataRead:readLine()
		countINT = tonumber(countSTR)
		dataRead:close()
		end
			
		if(pin == nil) then 
		sendServerCommand("ProjectRP", "SAYCOMMAND", { ARG1 = "IGUI_ATMERRORWALLET", ARG2= steamid})
		return 
		end
			
        local dataFile = getFileWriter("/ServerATMData/" .. tostring(data.wallet) .. ".txt", false, false);
		dataFile:writeln(tostring(pin));
		dataFile:writeln(tostring(data.count + countINT));
        dataFile:close()	
		
		sendServerCommand("ProjectRP", "ATMREMOVEMONEYFROMPLAYER", { ARG1 = data.count, ARG2= steamid})
		sendServerCommand("ProjectRP", "SAYCOMMAND", { ARG1 = "IGUI_ATMOK", ARG2= steamid})
    end
end

local function ReciveATMData(args)
	local wallet = args.wallet
	local pin = args.pin
	local count = args.count
	local playerid = args.playerid
	
	local dataPIN = nil
	local dataCOUNT = 0
	
	local dataRead = getFileReader("/ServerATMData/" .. tostring(wallet) .. ".txt", false)
	if dataRead then 
		dataPIN = dataRead:readLine()
		countSTR = dataRead:readLine()
		dataCOUNT = tonumber(countSTR)
		dataRead:close()
	end
	
	if dataPIN == nil then
		sendServerCommand("ProjectRP", "SAYCOMMAND", { ARG1 = "IGUI_ATMERRORWALLET", ARG2= playerid})
	return
	end
	
	if dataPIN ~= pin then
	sendServerCommand("ProjectRP", "SAYCOMMAND", { ARG1 = "IGUI_ATMERRORPIN", ARG2= playerid})
	return
	end
	
	if count > dataCOUNT then
	sendServerCommand("ProjectRP", "SAYCOMMAND", { ARG1 = "IGUI_ATMERRORCOUNT", ARG2= playerid})
	return
	end

	local dataFile = getFileWriter("/ServerATMData/" .. tostring(wallet) .. ".txt", true, false);
		dataFile:writeln(tostring(pin));
		dataFile:writeln(tostring(dataCOUNT - count));
        dataFile:close()

	sendServerCommand("ProjectRP", "SAYCOMMAND", { ARG1 = "IGUI_ATMOK", ARG2= playerid})
	sendServerCommand("ProjectRP", "ATMRECIVEMONEYTOPLAYER", { ARG1 = count, ARG2= playerid})		
end

local function CreateATMACcauntData(data)
    if data then
	
		local countINT = 0
		local pin = "1234"
		local steamid = data.steamID
		
		pin = data.pin
		
		
		local dataRead = getFileReader("/ServerATMData/" .. tostring(data.steamID) .. ".txt", false)
		if dataRead then 
		oldpin = dataRead:readLine()
		countSTR = dataRead:readLine()
		countINT = tonumber(countSTR)
		dataRead:close()
		end
		
        local dataFile = getFileWriter("/ServerATMData/" .. tostring(data.steamID) .. ".txt", false, false);
		dataFile:writeln(tostring(pin));
		dataFile:writeln(tostring(countINT));
        dataFile:close()

		sendServerCommand("ProjectRP", "SAYCOMMAND", { ARG1 = "IGUI_ATMOK", ARG2= steamid})
    end
end

local function ATMAccauntBalanceGetData(data)
    if data then
	
	local dataPIN = ""
	local dataCOUNT = 0
	local steamID = data.steamID
	
	local dataRead = getFileReader("/ServerATMData/" .. tostring(steamID) .. ".txt", false)
	if dataRead then 
		dataPIN = dataRead:readLine()
		countSTR = dataRead:readLine()
		dataCOUNT = tonumber(countSTR)
		dataRead:close()
	end
	sendServerCommand("ProjectRP", "ATMAccauntBalanceGetData", { ARG1 = "IGUI_ATMBALANCE", ARG2= steamID, ARG3 = dataCOUNT})
    end
end

local function ATMAccauntTransferData(data)
    if data then
	
	local ARGwallet= data.wallet
	local ARGpin= data.pin
	local ARGcount= data.count
	local ARGsteamID = data.steamID
	
	local DATA1PIN = ""
	local DATA1COUNT = 0
	
	local DATA2PIN = nil
	local DATA2COUNT = 0
	
	local dataRead1 = getFileReader("/ServerATMData/" .. tostring(ARGsteamID) .. ".txt", false)
	if dataRead1 then 
		DATA1PIN = dataRead1:readLine()
		countSTR = dataRead1:readLine()
		DATA1COUNT = tonumber(countSTR)
		dataRead1:close()
	end
	
	local dataRead2 = getFileReader("/ServerATMData/" .. tostring(ARGwallet) .. ".txt", false)
	if dataRead2 then 
		DATA2PIN = dataRead2:readLine()
		count2STR = dataRead2:readLine()
		DATA2COUNT = tonumber(count2STR)
		dataRead2:close()
	end
	
	if DATA2PIN == nil then
		sendServerCommand("ProjectRP", "SAYCOMMAND", { ARG1 = "IGUI_ATMERRORWALLET", ARG2= ARGsteamID})
	return
	end
	
	if ARGpin ~= DATA1PIN then
		sendServerCommand("ProjectRP", "SAYCOMMAND", { ARG1 = "IGUI_ATMERRORPIN", ARG2= ARGsteamID})
	return
	end
	
	if ARGcount > DATA1COUNT then
		sendServerCommand("ProjectRP", "SAYCOMMAND", { ARG1 = "IGUI_ATMERRORCOUNT", ARG2= ARGsteamID})
	return
	end
		
	
	local dataFile1 = getFileWriter("/ServerATMData/" .. tostring(ARGsteamID) .. ".txt", false, false);
		dataFile1:writeln(tostring(DATA1PIN));
		dataFile1:writeln(tostring(DATA1COUNT - ARGcount));
        dataFile1:close()
		
	local dataFile2 = getFileWriter("/ServerATMData/" .. tostring(ARGwallet) .. ".txt", false, false);
		dataFile2:writeln(tostring(DATA2PIN));
		dataFile2:writeln(tostring(DATA2COUNT + ARGcount));
        dataFile2:close()
	
	
	sendServerCommand("ProjectRP", "SAYCOMMAND", { ARG1 = "IGUI_ATMOK", ARG2= ARGsteamID})
    end
end


local onATMDataReceived = function(_module, command, player, args)   
	
	if command == "SendToATM" then      
        SaveATMData(args);
	end 
	
	if command == "ReciveFromATM" then    
        ReciveATMData(args)
	end 
	
	if command == "CreateATMACcaunt" then    
        CreateATMACcauntData(args)
	end 
	
	if command == "ATMAccauntBalanceGet" then    
        ATMAccauntBalanceGetData(args)
	end 
	
	if command == "ATMACcauntTransfer" then    
        ATMAccauntTransferData(args)
	end 
	
end


Events.OnClientCommand.Add(onATMDataReceived);