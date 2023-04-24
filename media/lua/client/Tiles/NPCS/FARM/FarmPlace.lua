local function ClickWheatFinal(player,v)
	invetory = player:getInventory()
	item = invetory:FindAndReturn("ProjectRP.Wheat")
	
	if(item == nil) then
		player:Say(getText("ContextMenu_ProjectRP_NOITEMS"))
		return
	end
	
	if(CheckRange(player:getX(),player:getY(),player:getZ(),v:getX(),v:getY(),v:getZ())) then
		ISTimedActionQueue.add(WheatPlaceTimedAction:new(player))
	else
	player:Say(getText("ContextMenu_ProjectRP_TOOFAR"))
	end
end


local function OnFillWorldObjectContextMenu(player, context, worldObjects, test)
    for i, v in ipairs(worldObjects) do
        local spriteName2 = v:getSprite():getName()
		if(spriteName2 == "vegetation_farm_01_11") then
            context:addOptionOnTop(getText("ContextMenu_ProjectRP_WHEATDROP"), player, function() ClickWheatFinal(getSpecificPlayer(player),v) end,'Arg')
			break
		end
    end
end

Events.OnFillWorldObjectContextMenu.Add(OnFillWorldObjectContextMenu)