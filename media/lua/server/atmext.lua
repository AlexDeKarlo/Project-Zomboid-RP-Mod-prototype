if not isServer() then return end;

-- Parse player data and save it to a .csv file inside Lua/ServerPlayersData/ folder
local function SaveATMData(data)
    if data then
	
		local countINT = 0
		local pin = "1234"
			
		local dataRead = getFileReader("/ServerATMData/" .. tostring(data.wallet) .. ".txt", false)
		if dataRead then 
		pin = dataRead:readLine()
		countSTR = dataRead:readLine()
		countINT = tonumber(countSTR)
		dataRead:close()
		end
				
        local dataFile = getFileWriter("/ServerATMData/" .. tostring(data.wallet) .. ".txt", false, false);
		dataFile:writeln(tostring(pin));
		dataFile:writeln(tostring(data.count + countINT));
        dataFile:close()	
    end
end

local function ReciveATMData(args)
	local wallet = args.wallet
	local pin = args.pin
	local count = args.count
	local playerid = args.playerid
	
	local dataPIN = ""
	local dataCOUNT = 0
	
	local dataRead = getFileReader("/ServerATMData/" .. tostring(wallet) .. ".txt", false)
	if dataRead then 
		dataPIN = dataRead:readLine()
		countSTR = dataRead:readLine()
		dataCOUNT = tonumber(countSTR)
		dataRead:close()
	end
	
	if dataPIN ~= pin then
	sendServerCommand("ProjectRP", "SAYCOMMAND", { ARG1 = "IGUI_ATMERROR", ARG2= playerid})
	return
	end
	
	if count > dataCOUNT then
	sendServerCommand("ProjectRP", "SAYCOMMAND", { ARG1 = "IGUI_ATMERROR", ARG2= playerid})
	return
	end
	
	sendServerCommand("ProjectRP", "ATMRECIVEMONEYTOPLAYER", { ARG1 = count, ARG2= playerid})
	local dataFile = getFileWriter("/ServerATMData/" .. tostring(wallet) .. ".txt", true, false);
		dataFile:writeln(tostring(pin));
		dataFile:writeln(tostring(dataCOUNT - count));
        dataFile:close()	
end

local function CreateATMACcauntData(data)
    if data then
	
		local countINT = 0
		local pin = "1234"
		
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
	
end


Events.OnClientCommand.Add(onATMDataReceived);