local function ClickFunction(player,v)

	invetory = player:getInventory()
	if(invetory:getCapacityWeight() > invetory:getMaxWeight()) then
		player:Say(getText("ContextMenu_ProjectRP_TOOMATCHITEMS"))
		return
	end

if(CheckRange(player:getX(),player:getY(),player:getZ(),v:getX(),v:getY(),v:getZ())) then
	CreateMetalINDUI(player)
else
	player:Say(getText("ContextMenu_ProjectRP_TOOFAR"))
end
end


local function OnFillWorldObjectContextMenu(player, context, worldObjects, test)
    for i, v in ipairs(worldObjects) do
        local spriteName2 = v:getSprite():getName()
		if(spriteName2 == "industry_02_156" or spriteName2 == "industry_02_159") then
            context:addOptionOnTop(getText("IGUI_RPCRAFT_METAL"), player, function() ClickFunction(getSpecificPlayer(player),v) end,'Arg')
			break
		end
    end
end

Events.OnFillWorldObjectContextMenu.Add(OnFillWorldObjectContextMenu)