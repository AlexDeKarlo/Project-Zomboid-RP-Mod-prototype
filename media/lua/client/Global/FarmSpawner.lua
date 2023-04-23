local XMIN = 11743
local XMAX = 11747
local YMIN = 6708
local YMAX = 6711


local function EveryTenMinutes()
	for X = XMIN, XMAX, 1 do -- цикл от 1 до 10 с шагом 1
		for Y = YMIN, YMAX, 1 do -- цикл от 1 до 10 с шагом 1
			local sq = getSquare(X, Y, 0);
			objects = sq:getObjects()
			obj = objects:get(objects:size()-1)
			textureName = objects:get(objects:size()-1):getTextureName()
			if(textureName == "vegetation_farm_01_0") then
				obj:removeFromSquare()
			end
		end
	end
	
	for X = XMIN, XMAX, 1 do -- цикл от 1 до 10 с шагом 1
		for Y = YMIN, YMAX, 1 do -- цикл от 1 до 10 с шагом 1
			local rand = ZombRand(1, 4)
			if(rand ==1) then 
			local sq = getSquare(X, Y, 0);
			sq:AddTileObject(IsoObject.getNew(sq, "vegetation_farm_01_0", nil, false));
			end
		end
	end
end

Events.EveryTenMinutes.Add(EveryTenMinutes)
