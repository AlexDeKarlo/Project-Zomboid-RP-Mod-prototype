local UI

local function CloseUI()
	if UI~=nil then
	UI:close()
	end
end

local function Back(player)
  CreateFarmerUI(player)
end

local function SEND(player)
	CloseUI()    
	ReciveFromFarmer(player,_)	
end

local function CreateINFOUI(player)
	CloseUI()
	UI = NewUI();
	
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	
    UI:addText("", getText("IGUI_NPCS_FARM"), "Title", "Center");
	UI:nextLine()
	UI:addImage("image1", "media/ui/NPC1.png")
	UI:nextLine()
	UI:addRichText("rtext", getText("IGUI_NPCS_FARMERTEXT"));  
	UI:nextLine()
	UI:addButton("button1", getText("IGUI_ATM_BACK"), function(button,args) Back(player) end)
	
    UI:setBorderToAllElements(true);                        
    UI:saveLayout();                                    
end


function CreateFarmerUI(player)
	CloseUI()
	UI = NewUI()
	
    UI:addText("", getText("IGUI_NPCS_FARM"), "Title", "Center");
    UI:nextLine()
	UI:addImage("image1", "media/ui/NPC1.png")
	UI:nextLine()
	UI:addButton("button1", getText("IGUI_NPCS_FARM_INFO"),function(button,args) CreateINFOUI(player) end)
	UI:nextLine()
	UI:addButton("button2", getText("IGUI_NPCS_FARM_GET"),function(button,args)  SEND(player)  end)

    UI:setBorderToAllElements(true);                        -- Add border
    UI:saveLayout();                                    -- Save and create the UI
end

Events.OnPlayerMove.Add(CloseUI)