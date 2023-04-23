REMOVETILE = nil

local function ClickConcreteFinal(player,v)
	if(REMOVETILE~=nil) then return end
	invetory = player:getInventory()
	if(invetory:getCapacityWeight() > invetory:getMaxWeight()) then
		player:Say(getText("ContextMenu_ProjectRP_TOOMATCHITEMS"))
		return
	end
	
if(CheckRange(player:getX(),player:getY(),player:getZ(),v:getX(),v:getY(),v:getZ())) then
	ISTimedActionQueue.add(WheatPROJECTRPTimedAction:new(player))
	--v:removeFromSquare()
	REMOVETILE = v
else
	player:Say(getText("ContextMenu_ProjectRP_TOOFAR"))
end
end


local function OnFillWorldObjectContextMenu(player, context, worldObjects, test)
    for i, v in ipairs(worldObjects) do
        local spriteName2 = v:getSprite():getName()
		if(spriteName2 == "vegetation_farm_01_0") then
            context:addOptionOnTop(getText("ContextMenu_ProjectRP_WHEATTAKE"), player, function() ClickConcreteFinal(getSpecificPlayer(player),v) end,'Arg')
			break
		end
    end
end

Events.OnFillWorldObjectContextMenu.Add(OnFillWorldObjectContextMenu)