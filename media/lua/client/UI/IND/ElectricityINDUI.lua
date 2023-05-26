local UI

local num1 = 10
local num2 = 10
local ANSWERNEED = 20


local CurrentProgressValueMAX = 0
local CurrentProgressValue = 0

local function CloseUI()
	if UI~=nil then
	ANSWERNEED = 20
	num1 = 10
	num2 = 10
	CurrentProgressValue = 0
	CurrentProgressValueMAX = 0
	UI:close()
	end
end

local function Back(player)
  CloseUI()
  ANSWERNEED = 20
  num1 = 10
  num2 = 10
  CurrentProgressValue = 0
  CurrentProgressValueMAX = 0
  CreateElectricityINDUI(player)
end

local function TakeItem(player,craft_type)
	player:Say(getText("IGUI_RPCRAFT_ELECTRICITYCRAFTCOMPLEATE"))
	invetory = player:getInventory()
	invetory:AddItem(craft_type)
	CloseUI()	
end

local function GetHardLevel(item)
	if(item == "Base.ElectronicsScrap") then return 2 end
	if(item == "Radio.ElectricWire") then return 3 end
	if(item == "Base.Amplifier") then return 4 end
	if(item == "Base.Receiver") then return 5 end
	if(item == "Radio.RadioTransmitter") then return 6 end
	if(item == "Radio.RadioReceiver") then return 7 end
	if(item == "Base.MotionSensor") then return 8 end
	if(item == "Base.Battery") then return 10 end
end

local function Check(player,ID,craft_type)
	
	if(CurrentIDFIND~=nil or ID ~=nil) then
		if(UI["ANSWER"]:getValue() == tostring(ANSWERNEED)) then UI["pbar1"]:setValue(CurrentProgressValue+1) 
		CurrentProgressValue=CurrentProgressValue+1
		if(CurrentProgressValue>=CurrentProgressValueMAX) then
			TakeItem(player,craft_type)
		end
		else 
			CloseUI() 
			player:Say(getText("IGUI_RPCRAFT_ELECTRICITYCRAFTFAIL"))
			return
		end
	end
	
	num1 = ZombRand(1,101)
	num2 =ZombRand(1,101)
	
	ANSWERNEED = num1+num2
	
	UI["TXTQ"]:setText(tostring(num1).. "+" .. tostring(num2).. "=")
end

local function CraftUI(player,craft_type,count)
	CloseUI()
	UI = NewUI();
	CurrentProgressValueMAX = count
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	
    UI:addText("", getText("IGUI_RPCRAFT_ELECTRICITYCRAFT"), "Small", "Center");
	UI:nextLine()
	UI:addImage("image1", "media/ui/ElectronicIND.png")
	UI:nextLine()
	UI:addEmpty()
	UI:nextLine()
	UI:addText("txt3", getText("IGUI_RPCRAFT_ELECTRICITYWHATWENEED"), "Small", "Center");
	UI:nextLine()
	UI:addEmpty()
	UI:nextLine()
	
	UI:addText("TXTQ", tostring(num1).. "+" .. tostring(num2).. "=", "Small", "Center");
	UI:addEntry("ANSWER", "", false)
	UI:addButton("1", "0", function(button,args) Check(player,1,craft_type) end)

	UI:nextLine()
	UI:addEmpty()
	UI:nextLine()
	UI:addText("txt2", getText("IGUI_RPCRAFT_ELECTRICITYWHENFINISH"), "Small", "Center");
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


function CreateElectricityINDUI(player)
	CloseUI()
	UI = NewUI()
	
	local items = {};
		items[getText("IGUI_RPCRAFT_ELECTRICITYCRAFT_ElectricScrap")] = "Base.ElectronicsScrap";
		items[getText("IGUI_RPCRAFT_ELECTRICITYCRAFT_ElectricWire")] = "Radio.ElectricWire";
		items[getText("IGUI_RPCRAFT_ELECTRICITYCRAFT_Amplifier")] = "Base.Amplifier";
		items[getText("IGUI_RPCRAFT_ELECTRICITYCRAFT_Receiver")] = "Base.Receiver";
		items[getText("IGUI_RPCRAFT_ELECTRICITYCRAFT_RadioTransmitter")] = "Radio.RadioTransmitter";
		items[getText("IGUI_RPCRAFT_ELECTRICITYCRAFT_RadioReceiver")] = "Radio.RadioReceiver";
		items[getText("IGUI_RPCRAFT_ELECTRICITYCRAFT_MotionSensor")] = "Base.MotionSensor";
		items[getText("IGUI_RPCRAFT_ELECTRICITYCRAFT_Battery")] = "Base.Battery";
	
    UI:addText("", getText("IGUI_RPCRAFT_ELECTRICITY"), "Title", "Center");
    UI:nextLine()
	UI:addImage("image1", "media/ui/ElectronicIND.png")
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