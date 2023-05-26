local UI

local QT1 = 10
local QT2 = 10
local QT3 = 10

local T1 = 0
local T2 = 0
local T3 = 0

local CurrentProgressValueMAX = 0
local CurrentProgressValue = 0

local function CloseUI()
	if UI~=nil then
	QT1 = 10
	QT2 = 10
	QT3 = 10
	T1 = 0
	T2 = 0
	T3 = 0
	CurrentProgressValueMAX = 0
	CurrentProgressValue = 0
	UI:close()
	end
end

local function Back(player)
	QT1 = 10
	QT2 = 10
	QT3 = 10
	T1 = 0
	T2 = 0
	T3 = 0
	CurrentProgressValueMAX = 0
	CurrentProgressValue = 0
	CloseUI()
	CreateMetalINDUI(player)
end

local function TakeItem(player,craft_type)
	player:Say(getText("IGUI_RPCRAFT_METALCRAFTCOMPLEATE"))
	invetory = player:getInventory()
	invetory:AddItem(craft_type)
	CloseUI()	
end

local function GetHardLevel(item)
	if(item == "Base.UnusableMetal") then return 2 end
	if(item == "Base.ScrapMetal") then return 4 end
	if(item == "Base.Paperclip") then return 5 end
	if(item == "Base.Nails") then return 6 end
	if(item == "Base.Screws") then return 6 end
	if(item == "Base.Aluminum") then return 7 end
	if(item == "Base.WeldingRods") then return 9 end
	if(item == "Base.Wire") then return 10 end
	if(item == "Base.SmallSheetMetal") then return 12 end
	if(item == "Base.SheetMetal") then return 13 end
	if(item == "Base.Hinge") then return 15 end
end

local function AddValue(ID)
	if(ID == "1") then 
	T1=T1+1
	UI["1"]:setText(tostring(T1))
	end
	
	if(ID == "2") then 
	T2=T2+1
	UI["2"]:setText(tostring(T2))
	end
	
	if(ID == "3") then 
	T3=T3+1
	UI["3"]:setText(tostring(T3))
	end
	
end

local function Check(player,ID,craft_type)
	if(ID ~=nil) then AddValue(tostring(ID)) end

	if(craft_type~=nil or ID ~=nil) then
		if(T1 == QT1 and T2 == QT2 and T3 == QT3) then 
		UI["pbar1"]:setValue(CurrentProgressValue+1) 
		CurrentProgressValue=CurrentProgressValue+1
		T1 = 0
		T2 = 0
		T3 = 0
		QT1 = ZombRand(1,10)
		QT2 = ZombRand(1,10)
		QT3 = ZombRand(1,10)
		
		UI["1"]:setText(tostring(T1))
		UI["2"]:setText(tostring(T2))
		UI["3"]:setText(tostring(T3))
		
		UI["Q1"]:setText(tostring(QT1))
		UI["Q2"]:setText(tostring(QT2))
		UI["Q3"]:setText(tostring(QT3))
		elseif(T1 > QT1 or T2 > QT2 or T3 > QT3) then
			CloseUI() 
			player:Say(getText("IGUI_RPCRAFT_METALCRAFTFAIL"))
			return
		end

		if(CurrentProgressValue>=CurrentProgressValueMAX) then
			TakeItem(player,craft_type)
		end
	end

end

local function CraftUI(player,craft_type,count)
	CloseUI()
	UI = NewUI();
	CurrentProgressValueMAX = count
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	
    UI:addText("", getText("IGUI_RPCRAFT_METALCRAFT"), "Small", "Center");
	UI:nextLine()
	UI:addImage("image1", "media/ui/MetalIND.png")
	UI:nextLine()
	UI:addEmpty()
	UI:nextLine()
	UI:addText("txt3", getText("IGUI_RPCRAFT_METALWHATWENEED"), "Small", "Center");
	UI:nextLine()
	UI:addEmpty()
	UI:nextLine()
	UI:addText("Q1", "10", "Small", "Center");
	UI:addText("Q2", "10", "Small", "Center");
	UI:addText("Q3", "10", "Small", "Center");
	UI:nextLine()
	
	UI:addButton("1", "0", function(button,args) Check(player,1,craft_type) end)
	UI:addButton("2", "0", function(button,args) Check(player,2,craft_type) end)
	UI:addButton("3", "0", function(button,args) Check(player,3,craft_type) end)

	UI:nextLine()
	UI:addEmpty()
	UI:nextLine()
	UI:addText("txt2", getText("IGUI_RPCRAFT_METALWHENFINISH"), "Small", "Center");
	UI:nextLine()
	UI:addProgressBar("pbar1", 0, 0, count)
	UI:nextLine()
	UI:addEmpty()
	UI:nextLine()
	UI:addButton("button1", getText("IGUI_ATM_BACK"), function(button,args) Back(player) end)
	
	
	Check(player,nil,nil)
    UI:setBorderToAllElements(true);                        
    UI:saveLayout();                                    
end


function CreateMetalINDUI(player)
	CloseUI()
	UI = NewUI()
	
	local items = {};
		items[getText("IGUI_RPCRAFT_METALCRAFT_UnusableMetal")] = "Base.UnusableMetal";
		items[getText("IGUI_RPCRAFT_METALCRAFT_ScrapMetal")] = "Base.ScrapMetal";
		items[getText("IGUI_RPCRAFT_METALCRAFT_Paperclip")] = "Base.Paperclip";
		items[getText("IGUI_RPCRAFT_METALCRAFT_Nails")] = "Base.Nails";
		items[getText("IGUI_RPCRAFT_METALCRAFT_Screws")] = "Base.Screws";
		items[getText("IGUI_RPCRAFT_METALCRAFT_Aluminum")] = "Base.Aluminum";
		items[getText("IGUI_RPCRAFT_METALCRAFT_WeldingRods")] = "Base.WeldingRods";
		items[getText("IGUI_RPCRAFT_METALCRAFT_Wire")] = "Base.Wire";
		items[getText("IGUI_RPCRAFT_METALCRAFT_SmallSheetMetal")] = "Base.SmallSheetMetal";
		items[getText("IGUI_RPCRAFT_METALCRAFT_SheetMetal")] = "Base.SheetMetal";
		items[getText("IGUI_RPCRAFT_METALCRAFT_Hinge")] = "Base.Hinge";
	
    UI:addText("", getText("IGUI_RPCRAFT_METAL"), "Title", "Center");
    UI:nextLine()
	UI:addImage("image1", "media/ui/MetalIND.png")
	UI:nextLine()
	UI:addText("txt2", getText("IGUI_RPCRAFT_GETSOMECRAFT"), "Small", "Center");
	UI:nextLine()
	UI:addScrollList("list", items); -- Create list
	UI:nextLine()
	UI:addButton("button1", getText("IGUI_RPCRAFT_GETSOMECRAFTSTART"),function(button,args) text, item = UI["list"]:getValue() CraftUI(player,item,GetHardLevel(item)) end)

    UI:setBorderToAllElements(true);                        -- Add border
    UI:saveLayout();                                    -- Save and create the UI
end

Events.OnPlayerMove.Add(CloseUI)