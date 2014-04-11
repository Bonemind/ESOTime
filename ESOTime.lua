ZO_CreateStringId("SI_BINDING_NAME_TOGGLE_FPS", "Toggle FPS")
ZO_CreateStringId("SI_BINDING_NAME_TIMER_CONTROL", "Start/Stop/Reset timer")
ZO_CreateStringId("SI_BINDING_NAME_TOGGLE_TIMER_RUNNING", "Pause/Resume timer")
ZO_CreateStringId("SI_BINDING_NAME_RESET_TIMER", "Reset timer")
local showFPS = false
local showTimer = false
local timeRunning = false
local timer = 0

-- Actual update function
function ESOTimeUpdate()
	text = " " .. GetTimeString()
	if showFPS == true then
		text = text  .. "   FPS:" .. tostring(math.floor(GetFramerate()))
	end

	updateTimer()
	if showTimer then
		text = text .. "  Timer: " .. FormatTimeMilliseconds(timer, TIME_FORMAT_STYLE_CHANNEL_TIME, TIME_FORMAT_PRECISION_TENTHS, TIME_FORMAT_DIRECTION_NONE)
	end

	ESOTimeCounter:SetText(text)
end

--Toggles FPS
function ToggleFps()
	showFPS = (not showFPS)
end

--Starts the timer and sets booleans
function startTimer()
	timer = 0
	showTimer = true
	timeRunning = true
end

--Handles timer updating
function updateTimer()
	if showTimer and timeRunning then
		timer = timer + GetFrameDeltaTimeMilliseconds()
	end
end

--Pauses a timer
function pauseTimer() 
	if showTimer then
		timeRunning = (not timeRunning)
	end
end

--Reset a timer to zero
function resetTimer()
	if showTimer then
		timer = 0
	end
end

-- Switches between off, running, paused and off again
function controlTimer()
	if not showTimer then
		startTimer()
	elseif timeRunning then
		timeRunning = false
	elseif (not timeRunning) and showTimer then
		showTimer = false
	end
end
