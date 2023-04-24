local function NPCSSay(_data)
	player = getPlayer()
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	if(steamID == _data.ARG2) then
	player:Say(getText(_data.ARG1))
	end
end

local function NPCSSayWithAttribute(_data)
	player = getPlayer()
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	if(steamID == _data.ARG3) then
	player:Say(getText(_data.ARG1) .. tostring(_data.ARG2))
	end
end

local function NPCGiveMoney(_data)
	player = getPlayer()
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	if(steamID == _data.ARG2) then
	
	invetory = player:getInventory()
		for i = 1, _data.ARG1, 1 do -- цикл от 1 до 10 с шагом 1
			invetory:AddItem("Base.Money")
		end	
	end
end


local function onServerNPCSCommand(_module, _command, _data)
    if _module ~= "ProjectRP" then return end
    if _command == "NPCSSAYCOMMAND" then
		NPCSSay(_data)
    end

	if _command == "NPCSSAYWITHATTRIBUTECOMMAND" then
		NPCSSayWithAttribute(_data)
    end
	
	if _command == "NPCGIVEMONEYCOMMAND" then
		NPCGiveMoney(_data)
    end
	
end
Events.OnServerCommand.Add(onServerNPCSCommand)---server to client
