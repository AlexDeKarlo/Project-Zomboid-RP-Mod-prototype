local UI

local function CloseUI()
	if UI~=nil then
	UI:close()
	end
end

local function Back(player)
  CreateFabricmanUI(player)
end

local function SEND(player)
	CloseUI()    
	
	money = fabricGiveItems(player)
	if(money<=0) then 
		player:Say(getText("IGUI_NPCS_FACTORYMAN_NOITEMS"))
		return
	end 
	player:Say(getText("IGUI_NPCS_FACTORYMAN_GIVEITEMS") .. tostring(money).. "$")
	ReciveFromFabricman(player,money)	
end

local function CreateINFOUI(player)
	CloseUI()
	UI = NewUI();
	
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	
    UI:addText("", getText("IGUI_NPCS_FACTORYMAN"), "Title", "Center");
	UI:nextLine()
	UI:addImage("image1", "media/ui/NPC3.png")
	UI:nextLine()
	UI:addRichText("rtext", getText("IGUI_NPCS_FACTORYMANTEXT"));  
	UI:nextLine()
	UI:addButton("button1", getText("IGUI_ATM_BACK"), function(button,args) Back(player) end)
	
    UI:setBorderToAllElements(true);                        
    UI:saveLayout();                                    
end

local function CreatePRICEUI(player)
	CloseUI()
	UI = NewUI();
		
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	
	local items = {};
		items[getText("IGUI_RPCRAFT_PRICE_1")] = "Base.UnusableMetal";
		items[getText("IGUI_RPCRAFT_PRICE_2")] = "Base.ScrapMetal";
		items[getText("IGUI_RPCRAFT_PRICE_3")] = "Base.Paperclip";
		items[getText("IGUI_RPCRAFT_PRICE_4")] = "Base.Nails";
		items[getText("IGUI_RPCRAFT_PRICE_5")] = "Base.Screws";
		items[getText("IGUI_RPCRAFT_PRICE_6")] = "Base.Aluminum";
		items[getText("IGUI_RPCRAFT_PRICE_7")] = "Base.WeldingRods";
		items[getText("IGUI_RPCRAFT_PRICE_8")] = "Base.Wire";
		items[getText("IGUI_RPCRAFT_PRICE_9")] = "Base.SmallSheetMetal";
		items[getText("IGUI_RPCRAFT_PRICE_10")] = "Base.SheetMetal";
		items[getText("IGUI_RPCRAFT_PRICE_11")] = "Base.Hinge";
		items[getText("IGUI_RPCRAFT_PRICE_12")] = "Base.UnusableMetal";
		items[getText("IGUI_RPCRAFT_PRICE_13")] = "Base.ScrapMetal";
		items[getText("IGUI_RPCRAFT_PRICE_14")] = "Base.Paperclip";
		items[getText("IGUI_RPCRAFT_PRICE_15")] = "Base.Nails";
		items[getText("IGUI_RPCRAFT_PRICE_16")] = "Base.Screws";
		items[getText("IGUI_RPCRAFT_PRICE_17")] = "Base.Aluminum";
		items[getText("IGUI_RPCRAFT_PRICE_18")] = "Base.WeldingRods";
		items[getText("IGUI_RPCRAFT_PRICE_19")] = "Base.Wire";
		items[getText("IGUI_RPCRAFT_PRICE_20")] = "Base.SmallSheetMetal";
		items[getText("IGUI_RPCRAFT_PRICE_21")] = "Base.SheetMetal";
		items[getText("IGUI_RPCRAFT_PRICE_22")] = "Base.Hinge";
		items[getText("IGUI_RPCRAFT_PRICE_23")] = "Base.UnusableMetal";
		items[getText("IGUI_RPCRAFT_PRICE_24")] = "Base.ScrapMetal";
		items[getText("IGUI_RPCRAFT_PRICE_25")] = "Base.Paperclip";
		items[getText("IGUI_RPCRAFT_PRICE_26")] = "Base.Nails";
		items[getText("IGUI_RPCRAFT_PRICE_27")] = "Base.Screws";

    UI:addText("", getText("IGUI_NPCS_FACTORYMAN"), "Title", "Center");
	UI:nextLine()
	UI:addImage("image1", "media/ui/NPC3.png")	
	UI:nextLine()
	UI:addScrollList("list", items); -- Create list
	UI:nextLine()
	UI:addButton("button1", getText("IGUI_ATM_BACK"), function(button,args) Back(player) end)
	
    UI:setBorderToAllElements(true);                        
    UI:saveLayout();                                    
end

function CreateFabricmanUI(player)
	CloseUI()
	UI = NewUI()
	
    UI:addText("", getText("IGUI_NPCS_FACTORYMAN"), "Title", "Center");
    UI:nextLine()
	UI:addImage("image1", "media/ui/NPC3.png")
	UI:nextLine()
	UI:addButton("button1", getText("IGUI_NPCS_FACTORYMAN_INFO"),function(button,args) CreateINFOUI(player) end)
	UI:nextLine()
	UI:addButton("button2", getText("IGUI_NPCS_FACTORYMANPRICE_INFO"),function(button,args) CreatePRICEUI(player) end)
	UI:nextLine()
	UI:addButton("button3", getText("IGUI_NPCS_FACTORYMAN_GET"),function(button,args)  SEND(player)  end)

    UI:setBorderToAllElements(true);                        -- Add border
    UI:saveLayout();                                    -- Save and create the UI
end

Events.OnPlayerMove.Add(CloseUI)