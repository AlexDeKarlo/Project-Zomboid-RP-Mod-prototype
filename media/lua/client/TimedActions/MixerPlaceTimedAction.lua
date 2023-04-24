require "TimedActions/ISBaseTimedAction"

MixerPlaceTimedAction = ISBaseTimedAction:derive("MixerPlaceTimedAction");

function MixerPlaceTimedAction:isValid() -- Check if the action can be done
	invetory = self.character:getInventory()
	item = invetory:FindAndReturn("ProjectRP.BuildMaterials")
	if(item == nil) then
		return false;
	end
    return true;
end

function MixerPlaceTimedAction:update() -- Trigger every game update when the action is perform
    print("Action is update");
end

function MixerPlaceTimedAction:waitToStart() -- Wait until return false
    return false;
end

function MixerPlaceTimedAction:start() -- Trigger when the action start
	self:setActionAnim("Craft")	
    print("Action start");
end

function MixerPlaceTimedAction:stop() -- Trigger if the action is cancel
    print("Action stop");
    ISBaseTimedAction.stop(self);
end

function MixerPlaceTimedAction:perform() -- Trigger when the action is complete
    print("Action perform");
	
	invetory = self.character:getInventory()
	item = invetory:FindAndReturn("ProjectRP.BuildMaterials")
	self.character:getInventory():Remove(item)
	
	SendToForeman(self.character,1)
    ISBaseTimedAction.perform(self);
end

function MixerPlaceTimedAction:new(character) -- What to call in you code
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o.character = character;
    o.maxTime = 600; -- Time take by the action
    if o.character:isTimedActionInstant() then o.maxTime = 1; end
    return o;
end