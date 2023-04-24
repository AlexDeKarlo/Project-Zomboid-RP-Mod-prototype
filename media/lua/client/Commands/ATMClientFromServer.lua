
local function PlayerSayCommand(_data)
	player = getPlayer()
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	if(steamID == _data.ARG2) then
	player:Say(getText(_data.ARG1))
	end
end

local function PlayerSayCommandWithAddArg(_data)
	player = getPlayer()
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	if(steamID == _data.ARG2) then
	player:Say(getText(_data.ARG1) .. ": " .. tostring(_data.ARG3))
	end
end


local function PlayerAddMoney(_data)
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


local function PlayerRemoveMoney(_data)
	player = getPlayer()
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	if(steamID == _data.ARG2) then
	
	invetory = player:getInventory()	
	local item
	item = invetory:FindAndReturn("Base.Money")
		for i = 1, _data.ARG1, 1 do -- цикл от 1 до 10 с шагом 1
			invetory:Remove(item)
			item = invetory:FindAndReturn("Base.Money")
		end
	end
end


local function onServerATMCommand(_module, _command, _data)
    if _module ~= "ProjectRP" then return end
    if _command == "SAYCOMMAND" then
		PlayerSayCommand(_data)
    end
	
	if _command == "ATMAccauntBalanceGetData" then
		PlayerSayCommandWithAddArg(_data)
    end
	
	if _command == "ATMRECIVEMONEYTOPLAYER" then
		PlayerAddMoney(_data)
    end
	
	if _command == "ATMREMOVEMONEYFROMPLAYER" then
		PlayerRemoveMoney(_data)
    end
	
end
Events.OnServerCommand.Add(onServerATMCommand)---server to client
