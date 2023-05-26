local items

local function TeleportTO(player,v,XTP,YTP,ZTP)
if(CheckRange(player:getX(),player:getY(),player:getZ(),v:getX(),v:getY(),v:getZ())) then	
	if(player:hasTimedActions()) then 
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORTIME"))
		return
	end
		
	local inv = player:getInventory()
	local container_items = inv:getItemsFromCategory("Container")
	local keys_items = inv:getItemsFromFullType("Base.KeyRing")

	if(container_items:size() ~= keys_items:size()) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORIN"))
		return
	end
	
	player:setX(XTP)
	player:setLx(XTP)
	
	player:setY(YTP)
	player:setLy(YTP)
	
	player:setZ(ZTP)
	player:setLz(ZTP)

end
end

local function TeleportFrom(player,v,XTP,YTP,ZTP)
if(CheckRange(player:getX(),player:getY(),player:getZ(),v:getX(),v:getY(),v:getZ())) then	
	if(player:hasTimedActions()) then 
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORTIME"))
		return
	end
	
	invetory = player:getInventory()
	local item = nil
	
	item = invetory:FindAndReturn("Base.UnusableWood")	
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.Twigs")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.TreeBranch")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.WoodenStick")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.PercedWood")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.Log")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.Plank")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.Doorknob")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.UnusableMetal")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.ScrapMetal")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.Paperclip")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.Nails")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.Screws")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.Aluminum")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.WeldingRods")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.Wire")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.SmallSheetMeta")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.SheetMetal")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.Hinge")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.ElectronicsScrap")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Radio.ElectricWire")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.Amplifier")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.Receiver")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Radio.RadioTransmitter")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Radio.RadioReceiver")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.MotionSensor")
		if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end
	item = invetory:FindAndReturn("Base.Battery")
	if(item~=nil) then
		player:Say(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_ERRORFROM"))
		return
	end

	player:setX(XTP)
	player:setLx(XTP)
	
	player:setY(YTP)
	player:setLy(YTP)
	
	player:setZ(ZTP)
	player:setLz(ZTP)
	end
end



local function OnFillWorldObjectContextMenu(player, context, worldObjects, test)
    for i, v in ipairs(worldObjects) do
        local spriteName2 = v:getSprite():getName()
		if((v:getX() == 11757 or v:getX() == 11758) and v:getY() == 6705 and (spriteName2 == "fixtures_escalators_01_51" or spriteName2 == "fixtures_escalators_01_50")) then
            context:addOptionOnTop(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_IN"), player, function() TeleportTO(getSpecificPlayer(player),v,11761,6706,0) end,'Arg')
			break
		end
		
		if((v:getX() == 11760 or v:getX() == 11761) and v:getY() == 6705 and (spriteName2 == "fixtures_escalators_01_51" or spriteName2 == "fixtures_escalators_01_50")) then
            context:addOptionOnTop(getText("ContextMenu_ProjectRP_ELEVATOR_FACTORY_FROM"), player, function() TeleportFrom(getSpecificPlayer(player),v,11758,6706,0) end,'Arg')
			break
		end
		
		if(1==1) then
            context:addOptionOnTop(getText("TELEPORT"), player, function() TeleportTO(getSpecificPlayer(player),v,11761,6697,0) end,'Arg')
			break
		end
		
    end
end

Events.OnFillWorldObjectContextMenu.Add(OnFillWorldObjectContextMenu)