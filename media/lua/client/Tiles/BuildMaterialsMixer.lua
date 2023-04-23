local function ClickConcrete(player,v)

	invetory = player:getInventory()
	if(invetory:getCapacityWeight() > invetory:getMaxWeight()) then
		player:Say(getText("ContextMenu_ProjectRP_TOOMATCHITEMS"))
		return
	end
	
if(CheckRange(player:getX(),player:getY(),player:getZ(),v:getX(),v:getY(),v:getZ())) then
	ISTimedActionQueue.add(MixerTimedAction:new(player))
else
	player:Say(getText("ContextMenu_ProjectRP_TOOFAR"))
end
end


local function OnFillWorldObjectContextMenu(player, context, worldObjects, test)
    for i, v in ipairs(worldObjects) do
        local spriteName2 = v:getSprite():getName()
		if(spriteName2 == "construction_01_6" or spriteName2 == "construction_01_7") then
            context:addOptionOnTop(getText("ContextMenu_ProjectRP_ConcreteMixer"), player, function() ClickConcrete(getSpecificPlayer(player),v) end,'Arg')
			break
		end
    end
end

Events.OnFillWorldObjectContextMenu.Add(OnFillWorldObjectContextMenu)