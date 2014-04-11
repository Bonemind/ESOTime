ZO_CreateStringId("SI_BINDING_NAME_TOGGLE_FPS", "Toggle FPS")
local showFPS = false
function ESOTimeUpdate()
	text = " " .. GetTimeString()
	if showFPS == true then
		text = text  .. "   FPS:" .. tostring(math.floor(GetFramerate()))
	end
	ESOTimeCounter:SetText(text)
	counter = counter + 1
end

function ToggleFps()
	showFPS = (not showFPS)
end
