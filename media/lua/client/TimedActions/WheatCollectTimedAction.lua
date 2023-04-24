require "TimedActions/ISBaseTimedAction"

WheatPROJECTRPTimedAction = ISBaseTimedAction:derive("WheatPROJECTRPTimedAction");

function WheatPROJECTRPTimedAction:isValid() -- Check if the action can be done
	invetory = self.character:getInventory()
	if(invetory:getCapacityWeight() > invetory:getMaxWeight()) then
		return false;
	end
    return true;
end

function WheatPROJECTRPTimedAction:update() -- Trigger every game update when the action is perform
    print("Action is update");
end

function WheatPROJECTRPTimedAction:waitToStart() -- Wait until return false
    return false;
end

function WheatPROJECTRPTimedAction:start() -- Trigger when the action start
	self:setActionAnim("Craft")	
    print("Action start");
end

function WheatPROJECTRPTimedAction:stop() -- Trigger if the action is cancel
    print("Action stop");
	REMOVETILE = nil
    ISBaseTimedAction.stop(self);
end

function WheatPROJECTRPTimedAction:perform() -- Trigger when the action is complete
    print("Action perform");
	self.character:getInventory():AddItem("ProjectRP.Wheat")
	REMOVETILE:removeFromSquare()
	REMOVETILE = nil
	player:getXp():AddXP(Perks.Farming, 1)
    ISBaseTimedAction.perform(self);
end

function WheatPROJECTRPTimedAction:new(character) -- What to call in you code
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o.character = character;
	o.farmingLvl = character:getPerkLevel(Perks.Farming);
    o.maxTime = 60 - o.farmingLvl*5;
    if o.character:isTimedActionInstant() then o.maxTime = 1; end
    return o;
end