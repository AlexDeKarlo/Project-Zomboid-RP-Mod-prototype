require "TimedActions/ISBaseTimedAction"

MixerTimedAction = ISBaseTimedAction:derive("MixerTimedAction");

function MixerTimedAction:isValid() -- Check if the action can be done
	invetory = self.character:getInventory()
	if(invetory:getCapacityWeight() > invetory:getMaxWeight()) then
		return false;
	end
    return true;
end

function MixerTimedAction:update() -- Trigger every game update when the action is perform
    print("Action is update");
end

function MixerTimedAction:waitToStart() -- Wait until return false
    return false;
end

function MixerTimedAction:start() -- Trigger when the action start
	self:setActionAnim("Craft")	
    print("Action start");
end

function MixerTimedAction:stop() -- Trigger if the action is cancel
    print("Action stop");
    ISBaseTimedAction.stop(self);
end

function MixerTimedAction:perform() -- Trigger when the action is complete
    print("Action perform");
	self.character:getInventory():AddItem("ProjectRP.BuildMaterials")
    ISBaseTimedAction.perform(self);
end

function MixerTimedAction:new(character) -- What to call in you code
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o.character = character;
    o.maxTime = 600; -- Time take by the action
    if o.character:isTimedActionInstant() then o.maxTime = 1; end
    return o;
end