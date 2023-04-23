local function ClickFunction(player,v)
if(CheckRange(player:getX(),player:getY(),player:getZ(),v:getX(),v:getY(),v:getZ())) then
	CreateATMUI(player)
else
	player:Say(getText("ContextMenu_ProjectRP_TOOFAR"))
end
end


local function OnFillWorldObjectContextMenu(player, context, worldObjects, test)
    for i, v in ipairs(worldObjects) do
        local spriteName2 = v:getSprite():getName()
		if(spriteName2 == "location_business_bank_01_66" or spriteName2 == "location_business_bank_01_67" or spriteName2 == "location_business_bank_01_65" or spriteName2 == "location_business_bank_01_64") then
            context:addOptionOnTop(getText("ContextMenu_ProjectRP_OpenATM"), player, function() ClickFunction(getSpecificPlayer(player),v) end,'Arg')
			break
		end
    end
end

Events.OnFillWorldObjectContextMenu.Add(OnFillWorldObjectContextMenu)