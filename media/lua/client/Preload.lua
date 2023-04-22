local function OnCreatePlayer(playerIndex, player)
	invetory = player:getInventory()
	item = invetory:FindAndReturn("ProjectRP.Passport")
	player:Say(tostring(item))
	if(item==nil) then 
	item = invetory:AddItem("ProjectRP.Passport")
	item:setName(getText("IGUI_Passport") .. " " .. player:getFullName())
	end
end


Events.OnCreatePlayer.Add(OnCreatePlayer)