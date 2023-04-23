local function TalkFunction(v)
player = getPlayer()
player:Say(v:getSprite():getName())
player:Say(tostring(v:getX()))
player:Say(tostring(v:getY()))
player:Say(tostring(v:getZ()))
player:Say(tostring(CheckRange(player:getX(),player:getY(),player:getZ(),v:getX(),v:getY(),v:getZ())))	
end

local function OnFillWorldObjectContextMenu(player, context, worldObjects, test)
    for i, v in ipairs(worldObjects) do
        local spriteName2 = v:getSprite():getName()
            context:addOptionOnTop("DebugTile", player, function() TalkFunction(v) end,'Arg')
    end
end

Events.OnFillWorldObjectContextMenu.Add(OnFillWorldObjectContextMenu)