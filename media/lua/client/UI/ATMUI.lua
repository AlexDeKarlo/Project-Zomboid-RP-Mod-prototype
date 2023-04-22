local UI

local function CloseUI(player)
	if UI~=nil then
	UI:close()
	end
end

local function Back(player)
  CreateATMUI(player)
end

local function INCOME(player,ATM_NUM,COUNT)
	if player==nil or ATM_NUM == nil or COUNT == nil or COUNT <0 then return end
	COUNT = math.floor(COUNT)
	invetory = player:getInventory()
	
	local item
	item = invetory:FindAndReturn("Base.Money")
	itemcount = invetory:getCountType("Base.Money")
    
	if(itemcount>= COUNT and COUNT <= 1000) then 
		for i = 1, COUNT, 1 do -- цикл от 1 до 10 с шагом 1
			invetory:Remove(item)
			item = invetory:FindAndReturn("Base.Money")
		end
	SendToATM(ATM_NUM,COUNT,player)
	elseif(COUNT > 1000) then player:Say(getText("ContextMenu_ProjectRP_CHATTOMANYMONEY")) 
	else player:Say(getText("ContextMenu_ProjectRP_CHATTOLOWMONEY"))
	end 
	
   CloseUI( _)
end

local function OUTCOME(player,ATM_NUM,PIN,COUNT)
	if player==nil or ATM_NUM == nil or PIN==nil or COUNT == nil or COUNT <0 then return end
	COUNT = math.floor(COUNT)
	invetory = player:getInventory()

	if(COUNT <=1000) then 
	ReciveFromATM(ATM_NUM,PIN,COUNT)
	else player:Say(getText("ContextMenu_ProjectRP_CHATTOMANYMONEY"))
	end
	CloseUI( _)	
end

local function UPDATE(player,NEWPIN)
	CreateATMACcaunt(_,NEWPIN,0,player)
	CloseUI( _)	
end

local function BALANCE(player,NEWPIN)
	GETATMACcauntBalance(_,_,_,player)
	CloseUI( _)	
end

local function CreateATMINUI(player)
	UI = NewUI();
	
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	
    UI:addText("", getText("IGUI_ATM_IN"), "Title", "Center");
	UI:nextLine()
	UI:addImage("image1", "media/ui/atm.png")
    UI:nextLine()
	UI:addText(_, getText("IGUI_ATMNUM"))
	UI:addEntry("INPUT1", tostring(steamID), false)
	UI:nextLine()
	UI:addText(_, getText("IGUI_ATM_COUNT"))
	UI:addEntry("INPUT2", "", true)
	
	UI:nextLine()
	UI:addButton("button1", getText("IGUI_ATM_BACK"),function(button,args) Back(player) end)
	UI:addButton("button2", getText("IGUI_ATM_IN"),function(button,args) INCOME(player,UI["INPUT1"]:getValue(),UI["INPUT2"]:getValue()) end)
	
    UI:setBorderToAllElements(true);                        
    UI:saveLayout();                                                     
end

local function CreateATMOUTUI(player)
	UI = NewUI();
	
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	
    UI:addText("", getText("IGUI_ATM_OUT"), "Title", "Center");
	UI:nextLine()
	UI:addImage("image1", "media/ui/atm.png")
	UI:nextLine()
	UI:addText(_, getText("IGUI_ATMNUM"))
	UI:addEntry("INPUT1", tostring(steamID), false)
	UI:nextLine()
	UI:addText(_, getText("IGUI_ATMPIN"))
	UI:addEntry("INPUT2", "", false)
	UI:nextLine()
	UI:addText(_, getText("IGUI_ATM_COUNT"))
	UI:addEntry("INPUT3", "", true)
	
	UI:nextLine()
	UI:addButton("button1", getText("IGUI_ATM_BACK"), function(button,args) Back(player) end)
	UI:addButton("button2", getText("IGUI_ATM_OUT"), function(button,args) OUTCOME(player,UI["INPUT1"]:getValue(),UI["INPUT2"]:getValue(),UI["INPUT3"]:getValue()) end)
	
    UI:setBorderToAllElements(true);                        
    UI:saveLayout();                                    
end

local function CreateATMAccauntUI(player)
	UI = NewUI();
	
	local username = player:getUsername()
	local steamID = getSteamIDFromUsername(username);
	
    UI:addText("", getText("IGUI_ATMIFNO"), "Title", "Center");
	UI:nextLine()
	UI:addImage("image1", "media/ui/atm.png")
	UI:nextLine()
	
	UI:addText(_, getText("IGUI_ATM_YORENUM"))
	UI:addText("_", tostring(steamID))
	UI:nextLine()
	
	UI:addText(_, getText("IGUI_ATMIFNOPIN"))
	UI:addEntry("PININPUT", "", false)
	UI:addButton("button2", getText("IGUI_ATMIFNOUPDATE"), function(button,args) UPDATE(player,UI["PININPUT"]:getValue()) end)
	UI:nextLine()
	
	UI:addButton("button3", getText("IGUI_ATMBALANCE"), function(button,args) BALANCE(player,UI["PININPUT"]:getValue()) end)
	UI:nextLine()
	
	UI:addButton("button1", getText("IGUI_ATM_BACK"), function(button,args) Back(player) end)
	
    UI:setBorderToAllElements(true);                        
    UI:saveLayout();                                    
end


local function InComeUI(player)
  CloseUI( _)
  CreateATMINUI(player)
end

local function OutComeUI(player)
  CloseUI( _)
  CreateATMOUTUI(player)
end

local function AccauntUI(player)
  CloseUI( _)
  CreateATMAccauntUI(player)
end

function CreateATMUI(player)
	CloseUI( _)
	UI = NewUI()
	
    UI:addText("", getText("IGUI_OpenATM"), "Title", "Center");
    UI:nextLine()
	UI:addImage("image1", "media/ui/atm.png")
	UI:nextLine()
	UI:addButton("button1", getText("IGUI_ATM_IN"),function(button,args) InComeUI(player) end)
	UI:addButton("button2", getText("IGUI_ATM_OUT"),function(button,args)  OutComeUI(player)  end)
	UI:nextLine()
	UI:addButton("button4", getText("IGUI_ATMTRANSFER"),function(button,args)  AccauntUI(player)  end)
	UI:nextLine()
	UI:addButton("button3", getText("IGUI_ATMIFNO"),function(button,args)  AccauntUI(player)  end)

    UI:setBorderToAllElements(true);                        -- Add border
    UI:saveLayout();                                    -- Save and create the UI
end

Events.OnPlayerMove.Add(CloseUI)