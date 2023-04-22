-- ATM TILES 
-- location_business_bank_01_66 location_business_bank_01_67
-- location_business_bank_01_64 location_business_bank_01_65

local function TalkFunction(v)
player = getPlayer()
player:Say(v:getSprite():getName())
player:Say(tostring(v:getX()))
player:Say(tostring(v:getY()))
player:Say(tostring(v:getZ()))
end


local function OnFillWorldObjectContextMenu(player, context, worldObjects, test)
    for i, v in ipairs(worldObjects) do
        local spriteName2 = v:getSprite():getName()
            context:addOptionOnTop("DebugTile", player, function() TalkFunction(v) end,'Arg')
    end
end

Events.OnFillWorldObjectContextMenu.Add(OnFillWorldObjectContextMenu)