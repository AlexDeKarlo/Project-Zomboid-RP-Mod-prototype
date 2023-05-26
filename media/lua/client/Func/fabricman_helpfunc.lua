
local function getpoint(player,name,point)
	local points = 0
	invetory = player:getInventory()
	
	item = invetory:FindAndReturn(name)
	itemcount = invetory:getCountType(name)	
	for i = 1, itemcount, 1 do -- цикл от 1 до 10 с шагом 1
		invetory:Remove(item)
		item = invetory:FindAndReturn(name)
		points = points + point
	end
	return points
end

function fabricGiveItems(player)
	local points = 0
	
	points = points + getpoint(player,"Base.UnusableWood",1) 
	points = points + getpoint(player,"Base.Twigs",3)
	points = points + getpoint(player,"Base.TreeBranch",5)
	points = points + getpoint(player,"Base.WoodenStick",7)
	points = points + getpoint(player,"Base.PercedWood",10)
	points = points + getpoint(player,"Base.Log",15)
	points = points + getpoint(player,"Base.Plank",18)
	points = points + getpoint(player,"Base.Doorknob",20)
	
	points = points + getpoint(player,"Base.UnusableMetal",1)
	points = points + getpoint(player,"Base.ScrapMetal",3)
	points = points + getpoint(player,"Base.Paperclip",5)
	points = points + getpoint(player,"Base.Nails",2)
	points = points + getpoint(player,"Base.Screws",3)
	points = points + getpoint(player,"Base.Aluminum",16)
	points = points + getpoint(player,"Base.WeldingRods",17)
	points = points + getpoint(player,"Base.Wire",20)
	points = points + getpoint(player,"Base.SmallSheetMeta",22)
	points = points + getpoint(player,"Base.SheetMetal",24)
	points = points + getpoint(player,"Base.Hinge",28)
	
	points = points + getpoint(player,"Base.ElectronicsScrap",1)
	points = points + getpoint(player,"Radio.ElectricWire",3)
	points = points + getpoint(player,"Base.Amplifier",5)
	points = points + getpoint(player,"Base.Receiver",9)
	points = points + getpoint(player,"Radio.RadioTransmitter",11)
	points = points + getpoint(player,"Radio.RadioReceiver",14)
	points = points + getpoint(player,"Base.MotionSensor",16)
	points = points + getpoint(player,"Base.Battery",20)
	return points
end
	
	--IGUI_NPCS_FACTORYMANPRICE = "Ниже приведена стоимость каждого материала <LINE>Непригодная древесина - 1$  <LINE> Мелкие ветви - 3$ <LINE> Древесная ветвь - 5$ <LINE> Прочная палка - 7$ <LINE> Доска для розжига - 10$ <LINE> Бревно - 15$ <LINE> Доска - 18$ <LINE> Дверная ручка - 20$",
	--IGUI_NPCS_FACTORYMANPRICE = "<LINE> Непригодный металл - 1$  <LINE> Металалом - 3$ <LINE> Скрепка - 5$ <LINE> Гвозь - 2$ <LINE> Болты - 3$ <LINE> Алюминий - 16$ <LINE> Присадочные прутки - 17$ <LINE> Проволока - 20$ <LINE> Маленький лист металла - 22$ <LINE> Лист металла - 24$ <LINE> Дверная петля - 28$",
	--IGUI_NPCS_FACTORYMANPRICE = "<LINE> Электронные запчасти - 1$  <LINE> Электронный провод - 3$ <LINE> Усилитель - 5$ <LINE> Приемник - 9$ <LINE> Радио передатчик - 11$ <LINE> Радио приемник - 14$ <LINE> Сенсор движения - 16$ <LINE> Батарейка - 20$",
	
	--IGUI_NPCS_FACTORYMANPRICE = "Ниже приведена стоимость каждого материала <LINE>Непригодная древесина - 1$  <LINE> Мелкие ветви - 3$ <LINE> Древесная ветвь - 5$ <LINE> Прочная палка - 7$ <LINE> Доска для розжига - 10$ <LINE> Бревно - 15$ <LINE> Доска - 18$ <LINE> Дверная ручка - 20$ <LINE> Непригодный металл - 1$  <LINE> Металалом - 3$ <LINE> Скрепка - 5$ <LINE> Гвозь - 2$ <LINE> Болты - 3$ <LINE> Алюминий - 16$ <LINE> Присадочные прутки - 17$ <LINE> Проволока - 20$ <LINE> Маленький лист металла - 22$ <LINE> Лист металла - 24$ <LINE> Дверная петля - 28$ <LINE> Электронные запчасти - 1$  <LINE> Электронный провод - 3$ <LINE> Усилитель - 5$ <LINE> Приемник - 9$ <LINE> Радио передатчик - 11$ <LINE> Радио приемник - 14$ <LINE> сенсор движения - 16$ <LINE> Батарейка - 20$",