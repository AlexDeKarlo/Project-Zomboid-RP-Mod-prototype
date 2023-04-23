local function ClickConcreteFinal(player,v)

	invetory = player:getInventory()
	item = invetory:FindAndReturn("ProjectRP.BuildMaterials")
	
	if(item == nil) then
		player:Say(getText("ContextMenu_ProjectRP_NOITEMS"))
		return
	end
	
if(CheckRange(player:getX(),player:getY(),player:getZ(),v:getX(),v:getY(),v:getZ())) then
	ISTimedActionQueue.add(MixerPlaceTimedAction:new(player))
else
	player:Say(getText("ContextMenu_ProjectRP_TOOFAR"))
end
end


local function OnFillWorldObjectContextMenu(player, context, worldObjects, test)
    for i, v in ipairs(worldObjects) do
        local spriteName2 = v:getSprite():getName()
		if(spriteName2 == "construction_01_4") then
            context:addOptionOnTop(getText("ContextMenu_ProjectRP_ConcreteMixerEnd"), player, function() ClickConcreteFinal(getSpecificPlayer(player),v) end,'Arg')
			break
		end
    end
end

Events.OnFillWorldObjectContextMenu.Add(OnFillWorldObjectContextMenu)