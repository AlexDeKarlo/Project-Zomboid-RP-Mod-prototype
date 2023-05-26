local UI

local CurrentIDFIND = nil
local CurrentProgressValueMAX = 0
local CurrentProgressValue = 0

local function CloseUI()
	if UI~=nil then
	CurrentIDFIND = nil
	CurrentProgressValue = 0
	CurrentProgressValueMAX = 0
	UI:close()
	end
end

local function Back(player)
  CloseUI()
  CurrentIDFIND = nil
  CurrentProgressValue = 0
  CurrentProgressValueMAX = 0
  CreateWoodINDUI(player)
end

local function TakeItem(player,craft_type)
	player:Say(getText("IGUI_RPCRAFT_WOODCRAFTCOMPLEATE"))
	invetory = player:getInventory()
	invetory:AddItem(craft_type)
	CloseUI()	
end

local function GetHardLevel(item)
	if(item == "Base.UnusableWood") then return 2 end
	if(item == "Base.Twigs") then return 3 end
	if(item == "Base.TreeBranch") then return 4 end
	if(item == "Base.WoodenStick") then return 5 end
	if(item == "Base.PercedWood") then return 8 end
	if(item == "Base.Log") then return 10 end
	if(item == "Base.Plank") then return 11 end
	if(item == "Base.Doorknob") then return 12 end
end

local function Check(player,ID,craft_type)
	if(CurrentIDFIND~=nil or ID ~=nil) then
		if(CurrentIDFIND == ID) then UI["pbar1"]:setValue(CurrentProgressValue+1) 
		CurrentProgressValue=CurrentProgressValue+1
		if(CurrentProgressValue>=CurrentProgressValueMAX) then
			TakeItem(player,craft_type)
		end
		else 
			CloseUI() 
			player:Say(getText("IGUI_RPCRAFT_WOODCRAFTFAIL"))
			return
		end
	end
	
	local CraftPoint = ZombRand(1,25)
	for i = 1, 24,1 do -- цикл от 1 до 10 с шагом 1
		if(CraftPoint == i) then 
		UI[tostring(i)]:setText("X") 
		CurrentIDFIND = i
		else 
			tempRand = ZombRand(1,10)
			if(tempRand == 1) then UI[tostring(i)]:setText("O") end
			if(tempRand == 2) then UI[tostring(i)]:setText("T") end
			if(tempRand == 3) then UI[tostring(i)]:setText("V") end
			if(tempRand == 4) then UI[tostring(i)]:setText("P") end
			if(tempRand == 5) then UI[tostring(i)]:setText("J") end
			if(tempRand == 6) then UI[tostring(i)]:setText("L") end
			if(tempRand == 7) then UI[tostring(i)]:setText("M") end
			if(tempRand == 8) then UI[tostring(i)]:setText("H") end
			if(tempRand == 9) then UI[tostring(i)]:setText(">") end
			if(tempRand == 10) then UI[tostring(i)]:setText("1") end
		end
	end
end

local function CraftUI(player,craft_type,count)
	CloseUI()
	UI = NewUI();
	CurrentProgressValueMAX = count
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	
    UI:addText("", getText("IGUI_RPCRAFT_WOODCRAFT"), "Small", "Center");
	UI:nextLine()
	UI:addImage("image1", "media/ui/WoodIND.png")
	UI:nextLine()
	UI:addEmpty()
	UI:nextLine()
	UI:addText("txt3", getText("IGUI_RPCRAFT_WOODWHATWENEED"), "Small", "Center");
	UI:nextLine()
	UI:addEmpty()
	UI:nextLine()
	
	UI:addButton("1", "0", function(button,args) Check(player,1,craft_type) end)
	UI:addButton("2", "0", function(button,args) Check(player,2,craft_type) end)
	UI:addButton("3", "0", function(button,args) Check(player,3,craft_type) end)
	UI:addButton("4", "0", function(button,args) Check(player,4,craft_type) end)
	UI:addButton("5", "0", function(button,args) Check(player,5,craft_type) end)
	UI:nextLine()
	UI:addButton("6", "0", function(button,args) Check(player,6,craft_type) end)
	UI:addButton("7", "0", function(button,args) Check(player,7,craft_type) end)
	UI:addButton("8", "0", function(button,args) Check(player,8,craft_type) end)
	UI:addButton("9", "0", function(button,args) Check(player,9,craft_type) end)
	UI:addButton("10", "0", function(button,args) Check(player,10,craft_type) end)
	UI:nextLine()
	UI:addButton("11", "0", function(button,args) Check(player,11,craft_type) end)
	UI:addButton("12", "0", function(button,args) Check(player,12,craft_type) end)
	UI:addButton("13", "0", function(button,args) Check(player,13,craft_type) end)
	UI:addButton("14", "0", function(button,args) Check(player,14,craft_type) end)
	UI:addButton("15", "0", function(button,args) Check(player,15,craft_type) end)
	UI:nextLine()
	UI:addButton("16", "0", function(button,args) Check(player,16,craft_type) end)
	UI:addButton("17", "0", function(button,args) Check(player,17,craft_type) end)
	UI:addButton("18", "0", function(button,args) Check(player,18,craft_type) end)
	UI:addButton("19", "0", function(button,args) Check(player,19,craft_type) end)
	UI:addButton("20", "0", function(button,args) Check(player,20,craft_type) end)
	UI:nextLine()
	UI:addButton("21", "0", function(button,args) Check(player,21,craft_type) end)
	UI:addButton("22", "0", function(button,args) Check(player,22,craft_type) end)
	UI:addButton("23", "0", function(button,args) Check(player,23,craft_type) end)
	UI:addButton("24", "0", function(button,args) Check(player,24,craft_type) end)
	UI:addButton("25", "0", function(button,args) Check(player,25,craft_type) end)
	UI:nextLine()
	UI:addEmpty()
	UI:nextLine()
	UI:addText("txt2", getText("IGUI_RPCRAFT_WOODWHENFINISH"), "Small", "Center");
	UI:nextLine()
	UI:addProgressBar("pbar1", 0, 0, count)
	UI:nextLine()
	UI:addEmpty()
	UI:nextLine()
	UI:addButton("button1", getText("IGUI_ATM_BACK"), function(button,args) Back(player) end)
	
	
	Check(player,nil)
    UI:setBorderToAllElements(true);                        
    UI:saveLayout();                                    
end

function CreateWoodINDUI(player)
	CloseUI()
	UI = NewUI()
	
	local items = {};
		items[getText("IGUI_RPCRAFT_WOODCRAFT_UnusableWood")] = "Base.UnusableWood";
		items[getText("IGUI_RPCRAFT_WOODCRAFT_Twigs")] = "Base.Twigs";
		items[getText("IGUI_RPCRAFT_WOODCRAFT_TreeBranch")] = "Base.TreeBranch";
		items[getText("IGUI_RPCRAFT_WOODCRAFT_WoodenStick")] = "Base.WoodenStick";
		items[getText("IGUI_RPCRAFT_WOODCRAFT_PercedWood")] = "Base.PercedWood";
		items[getText("IGUI_RPCRAFT_WOODCRAFT_Log")] = "Base.Log";
		items[getText("IGUI_RPCRAFT_WOODCRAFT_Plank")] = "Base.Plank";
		items[getText("IGUI_RPCRAFT_WOODCRAFT_Doorknob")] = "Base.Doorknob";
	
	
    UI:addText("", getText("IGUI_RPCRAFT_WOOD"), "Title", "Center");
    UI:nextLine()
	UI:addImage("image1", "media/ui/WoodIND.png")
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