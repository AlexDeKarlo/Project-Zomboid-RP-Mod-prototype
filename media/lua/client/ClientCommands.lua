--[[
local function PlayerSayCommand(data)
 player = data.player	
	invetory = player:getInventory()
	invetory:AddItem("Base.Money")
end
]]

local function onServerATMCommand(_module, _command, _data)
		player = getPlayer()
		player:Say("123")
    if _module ~= "ProjectRP" then return end
    if _command == "TESTFROMSERVER" then
		player:Say("123")
    end
end
Events.OnServerCommand.Add(onServerATMCommand)---server to client
