require "TimedActions/ISBaseTimedAction"

WheatPlaceTimedAction = ISBaseTimedAction:derive("WheatPlaceTimedAction");

function WheatPlaceTimedAction:isValid() -- Check if the action can be done
	invetory = self.character:getInventory()
	item = invetory:FindAndReturn("ProjectRP.Wheat")
	if(item == nil) then
		return false;
	end
    return true;
end

function WheatPlaceTimedAction:update() -- Trigger every game update when the action is perform
    print("Action is update");
end

function WheatPlaceTimedAction:waitToStart() -- Wait until return false
    return false;
end

function WheatPlaceTimedAction:start() -- Trigger when the action start
	self:setActionAnim("Craft")	
    print("Action start");
end

function WheatPlaceTimedAction:stop() -- Trigger if the action is cancel
    print("Action stop");
    ISBaseTimedAction.stop(self);
end

function WheatPlaceTimedAction:perform() -- Trigger when the action is complete
    print("Action perform");
	
	invetory = self.character:getInventory()
	item = invetory:FindAndReturn("ProjectRP.Wheat")
	itemcount = invetory:getCountType("ProjectRP.Wheat")
	
	for i = 1, itemcount, 1 do -- цикл от 1 до 10 с шагом 1
		invetory:Remove(item)
		item = invetory:FindAndReturn("ProjectRP.Wheat")
	end
	
	self.character:getInventory():Remove(item)
	SendToFarmer(self.character,itemcount)
    ISBaseTimedAction.perform(self);
end

function WheatPlaceTimedAction:new(character) -- What to call in you code
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o.character = character;
    o.maxTime = 60; -- Time take by the action
    if o.character:isTimedActionInstant() then o.maxTime = 1; end
    return o;
end