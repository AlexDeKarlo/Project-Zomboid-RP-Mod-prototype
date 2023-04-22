local function FindPlayer(PassportName)
	for	playerIndex = 0, getNumActivePlayers() - 1 do
	local player = getSpecificPlayer(playerIndex)	
	if(PassportName == getText("IGUI_Passport") .. " " .. player:getFullName()) then
	return player
	end
	end
	return nil
end

local function OpenPass(Passport)
	local player = FindPlayer(Passport:getName())
	if(player == nil) then return end
	CreatePassportUI(player)
end

--[[local function ShowPass(Passport)
	local player = FindPlayer(Passport:getName())
	if(player == nil) then return end
	
	player:Say(getText("ContextMenu_ProjectRP_CHATTakePassport"))
	player:Say(getText("ContextMenu_ProjectRP_CHATShowPassport"))
	player:Say(getText("ContextMenu_ProjectRP_CHATNameAndSurPassport")..player:getFullName())	
	player:Say(getText("ContextMenu_ProjectRP_CHATSurviveTime")..player:getTimeSurvived())	
end]]

local function FillContextItems(playerIndex, tables, items)
	items = ISInventoryPane.getActualItems(items)
	
    for i, item in ipairs(items) do
		local fullname = item:getFullType()
		if(fullname == "ProjectRP.Passport") then
		tables:addOptionOnTop(getText("ContextMenu_ProjectRP_OpenPassport"), playerIndex,function() OpenPass(item) end)
        --tables:addOptionOnTop(getText("ContextMenu_ProjectRP_ShowPassport"), playerIndex,function() ShowPass(item) end)
		end
    end
	
end

Events.OnFillInventoryObjectContextMenu.Add(FillContextItems)