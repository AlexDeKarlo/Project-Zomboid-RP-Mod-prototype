if not isServer() then return end;

local function SendToFarmerFunc(data)
    if data then
		local steamid = data.steamID
		local count = data.count
		
		local datacountSTR	= "0"
		local datacount	= 0
		
		local dataRead = getFileReader("/ServerFarmerData/" .. tostring(data.steamID) .. ".txt", false)
		if dataRead then 
			datacountSTR = dataRead:readLine()
			datacount = tonumber(datacountSTR)
			dataRead:close()
		end	
			
        local dataFile = getFileWriter("/ServerFarmerData/" .. tostring(data.steamID) .. ".txt", true, false);
		dataFile:writeln(tostring(count + datacount));
        dataFile:close()	
		
		sendServerCommand("ProjectRP", "NPCSSAYWITHATTRIBUTECOMMAND", { ARG1 = "ContextMenu_ProjectRP_WHEATCOUNT", ARG2 = count+datacount, ARG3 = data.steamID})
    end
end

local function ReciveFromFarmerFunc(data)
    if data then
		local steamid = data.steamID
		local count = data.count
			
		local datacount	= 0
		
	
		local dataRead = getFileReader("/ServerFarmerData/" .. tostring(steamid) .. ".txt", false)
		if dataRead then 
			datacountstr = dataRead:readLine()
			datacount = tonumber(datacountstr)
			dataRead:close()
		end

		if datacount == 0 then
			sendServerCommand("ProjectRP", "NPCSSAYCOMMAND", { ARG1 = "ContextMenu_ProjectRP_WHEATERROR", ARG2= steamid})
			return
		end

		local dataFile = getFileWriter("/ServerFarmerData/" .. tostring(steamid) .. ".txt", true, false);
		dataFile:writeln(tostring(0));
		dataFile:close()

		sendServerCommand("ProjectRP", "NPCSSAYWITHATTRIBUTECOMMAND", { ARG1 = "ContextMenu_ProjectRP_WHEATCOUNTEND", ARG2= datacount, ARG3 = steamid})
		sendServerCommand("ProjectRP", "NPCSSAYWITHATTRIBUTECOMMAND", { ARG1 = "ContextMenu_ProjectRP_WHEATCOUNTENDMONEY", ARG2= math.floor(datacount/5), ARG3 = steamid})
		sendServerCommand("ProjectRP", "NPCGIVEMONEYCOMMAND", { ARG1 = math.floor(datacount/5), ARG2= steamid})		
	end
end


local function SendToForemanFunc(data)
    if data then
		local steamid = data.steamID
		local count = data.count
		
		local datacountSTR	= "0"
		local datacount	= 0
		
		local dataRead = getFileReader("/ServerForemanData/" .. tostring(data.steamID) .. ".txt", false)
		if dataRead then 
			datacountSTR = dataRead:readLine()
			datacount = tonumber(datacountSTR)
			dataRead:close()
		end
			
        local dataFile = getFileWriter("/ServerForemanData/" .. tostring(data.steamID) .. ".txt", true, false);
		dataFile:writeln(tostring(count + datacount));
        dataFile:close()	
		
		sendServerCommand("ProjectRP", "NPCSSAYWITHATTRIBUTECOMMAND", { ARG1 = "ContextMenu_ProjectRP_FOREMANCOUNT", ARG2 = count+datacount, ARG3 = data.steamID})
    end
end

local function ReciveFromForemanFunc(data)
    if data then
		local steamid = data.steamID
		local count = data.count
			
		local datacount	= 0
		
	
		local dataRead = getFileReader("/ServerForemanData/" .. tostring(steamid) .. ".txt", false)
		if dataRead then 
			datacountstr = dataRead:readLine()
			datacount = tonumber(datacountstr)
			dataRead:close()
		end

		if datacount == 0 then
			sendServerCommand("ProjectRP", "NPCSSAYCOMMAND", { ARG1 = "ContextMenu_ProjectRP_FOREMANERROR", ARG2= steamid})
			return
		end

		local dataFile = getFileWriter("/ServerForemanData/" .. tostring(steamid) .. ".txt", true, false);
		dataFile:writeln(tostring(0));
		dataFile:close()

		sendServerCommand("ProjectRP", "NPCSSAYWITHATTRIBUTECOMMAND", { ARG1 = "ContextMenu_ProjectRP_FOREMANCOUNTEND", ARG2= datacount, ARG3 = steamid})
		sendServerCommand("ProjectRP", "NPCSSAYWITHATTRIBUTECOMMAND", { ARG1 = "ContextMenu_ProjectRP_FOREMANDMONEY", ARG2= datacount, ARG3 = steamid})
		sendServerCommand("ProjectRP", "NPCGIVEMONEYCOMMAND", { ARG1 = datacount, ARG2= steamid})		
	end
end

local NPCSDataReceived = function(_module, command, player, args)   
	
	if command == "SendToFarmer" then  	
        SendToFarmerFunc(args)
	end 

	if command == "SendToForeman" then    
        SendToForemanFunc(args)
	end 
	
	if command == "ReciveFromFarmer" then      
        ReciveFromFarmerFunc(args)
	end 
	
	if command == "ReciveFromForeman" then    
        ReciveFromForemanFunc(args)
	end 
end


Events.OnClientCommand.Add(NPCSDataReceived);