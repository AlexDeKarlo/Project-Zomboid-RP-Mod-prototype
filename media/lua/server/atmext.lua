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
		
        local dataFile = getFileWriter("/ServerATMData/" .. tostring(data.wallet) .. ".txt", true, false);
		dataFile:writeln(tostring(pin));
		dataFile:writeln(tostring(data.count + countINT));
        dataFile:close()	
        print("SPDServer: " .. data.username .. " data saved to file!");  
    end
end

--[[
local function ReciveATMData(data)
	local countINT = 0
	local pin = "4rtgrh54h6ytj67j65kj67k"
	local dataRead = getFileReader("/ServerATMData/" .. tostring(data._Wallet) .. ".txt", false)
	if dataRead then 
		pin = dataRead:readLine()
		countSTR = dataRead:readLine()
		countINT = tonumber(countSTR)
		dataRead:close()
	end
	
	if(dataRead == nil) then sendServerCommand("ProjectRP", "SAYCOMMAND", { SAY = "WALLET NOT EXIST", ARG2= true}) end
	elseif(pin ~= data._Pin) then sendServerCommand("ProjectRP", "SAYCOMMAND", { SAY = "Wrong PIN", ARG2= true}) end
	elseif(countINT < data._Count) then sendServerCommand("ProjectRP", "SAYCOMMAND", { SAY = "NOT ENOUGH MONEY", ARG2= true}) end
	else sendServerCommand("ProjectRP", "TESTFROMSERVER", { ARG1 = true, ARG2 = true })
end ]]

local function ReciveATMData()
	sendServerCommand("ProjectRP", "TESTFROMSERVER", { ARG1 = true, ARG2= true})
end

local onATMDataReceived = function(_module, command, player, args)   
	
	if command == "SendToATM" then      
        SaveATMData(args);
	end 
	
	if command == "ReciveFromATM" then    
        ReciveATMData()
	end 
	
end


Events.OnClientCommand.Add(onATMDataReceived);