-- ATM TILES 
-- location_business_bank_01_66 location_business_bank_01_67
-- location_business_bank_01_64 location_business_bank_01_65

local function ClickFunction(player)
	CreateATMUI(player)
end


local function OnFillWorldObjectContextMenu(player, context, worldObjects, test)
    for i, v in ipairs(worldObjects) do
        local spriteName2 = v:getSprite():getName()
		if(spriteName2 == "location_business_bank_01_66" or spriteName2 == "location_business_bank_01_67" or spriteName2 == "location_business_bank_01_65" or spriteName2 == "location_business_bank_01_64") then
            context:addOptionOnTop(getText("ContextMenu_ProjectRP_OpenATM"), player, function() ClickFunction(getSpecificPlayer(player)) end,'Arg')
			break
		end
    end
end

Events.OnFillWorldObjectContextMenu.Add(OnFillWorldObjectContextMenu)