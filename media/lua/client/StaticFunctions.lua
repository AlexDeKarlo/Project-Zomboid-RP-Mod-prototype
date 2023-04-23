function CheckRange(X1,Y1,Z1,X2,Y2,Z2)
	if(X1+2<X2 or X1-2 >X2)then return false end
	if(Y1+2<Y2 or Y1-2 >Y2)then return false end
	if(Z1~=Z2) then return false end
	return true
end