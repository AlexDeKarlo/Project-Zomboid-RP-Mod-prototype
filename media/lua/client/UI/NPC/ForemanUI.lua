local UI

local function CloseUI()
	if UI~=nil then
	UI:close()
	end
end

local function Back(player)
  CreateForemanUI(player)
end

local function SEND(player)
	CloseUI()    
	ReciveFromForeman(player,_)	
end

local function CreateINFOUI(player)
	CloseUI()
	UI = NewUI();
	
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	
    UI:addText("", getText("IGUI_NPCS_FOREMAN"), "Title", "Center");
	UI:nextLine()
	UI:addImage("image1", "media/ui/NPC2.png")
	UI:nextLine()
	UI:addRichText("rtext", getText("IGUI_NPCS_FOREMANTEXT"));  
	UI:nextLine()
	UI:addButton("button1", getText("IGUI_ATM_BACK"), function(button,args) Back(player) end)
	
    UI:setBorderToAllElements(true);                        
    UI:saveLayout();                                    
end


function CreateForemanUI(player)
	CloseUI()
	UI = NewUI()
	
    UI:addText("", getText("IGUI_NPCS_FOREMAN"), "Title", "Center");
    UI:nextLine()
	UI:addImage("image1", "media/ui/NPC2.png")
	UI:nextLine()
	UI:addButton("button1", getText("IGUI_NPCS_FOREMAN_INFO"),function(button,args) CreateINFOUI(player) end)
	UI:nextLine()
	UI:addButton("button2", getText("IGUI_NPCS_FOREMAN_GET"),function(button,args)  SEND(player)  end)

    UI:setBorderToAllElements(true);                        -- Add border
    UI:saveLayout();                                    -- Save and create the UI
end

Events.OnPlayerMove.Add(CloseUI)