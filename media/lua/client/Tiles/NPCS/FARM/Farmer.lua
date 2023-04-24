local function ClickFunction(player,v)
if(CheckRange(player:getX(),player:getY(),player:getZ(),v:getX(),v:getY(),v:getZ())) then
	CreateFarmerUI(player)
else
	player:Say(getText("ContextMenu_ProjectRP_TOOFAR"))
end
end


local function OnFillWorldObjectContextMenu(player, context, worldObjects, test)
    for i, v in ipairs(worldObjects) do
        local spriteName2 = v:getSprite():getName()
		if(spriteName2 == "NPCS_0") then
            context:addOptionOnTop(getText("ContextMenu_ProjectRP_FARMER"), player, function() ClickFunction(getSpecificPlayer(player),v) end,'Arg')
			break
		end
    end
end

Events.OnFillWorldObjectContextMenu.Add(OnFillWorldObjectContextMenu)