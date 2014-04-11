local counter = 1
function ESOTimeUpdate()
	ESOTimeCounter:SetText(" " .. GetTimeString())
	counter = counter + 1
end

