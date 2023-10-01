local errorPopupShown = false
local s = false
local setidentity = syn and syn.set_thread_identity or set_thread_identity or setidentity or setthreadidentity or function() end
local getidentity = syn and syn.get_thread_identity or get_thread_identity or getidentity or getthreadidentity or function() return 8 end
local queueonteleport = syn and syn.queue_on_teleport or queue_on_teleport or function() end

loadstring(readfile('sen.lua'))()

local function displayErrorPopup(text, func)
	local oldidentity = getidentity()
	setidentity(8)
	local ErrorPrompt = getrenv().require(game:GetService("CoreGui").RobloxGui.Modules.ErrorPrompt)
	local prompt = ErrorPrompt.new("Default")
	prompt._hideErrorCode = true
	local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
	prompt:setErrorTitle("InstaKill")
	prompt:updateButtons({{
		Text = "Continue",
		Callback = function() 
			prompt:_close() 
			if func then func() end
		end,
		Primary = true
	}}, 'Default')
	prompt:setParent(gui)
	prompt:_open(text)
	setidentity(oldidentity)
end

displayErrorPopup("Successfully Loaded")

local teleportConnection = game.Players.LocalPlayer.OnTeleport:Connect(function(State)
    if (not s) then
		s = true
		queueonteleport("loadstring(readfile('sen.lua'))()")
    end
end)
