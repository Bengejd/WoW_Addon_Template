local _, core = ...;
local _G = _G;
local L = core.L;

local WOW_Addon_Template = {}

-- Generic event handler that handles all of the game events & directs them.
-- This is the FIRST function to run on load triggered registered events at bottom of file
function ADDON_OnEvent(self, event, arg1, ...)
    local SIMPLE_EVENT_FUNCS = {
        ['ADDON_LOADED']=function() -- The addon finished loading, most things should be available.
            ADDON_OnInitialize(event, arg1)
            return ADDON_UnregisterEvent(self, event)
        end,
    }
    if SIMPLE_EVENT_FUNCS[event] then SIMPLE_EVENT_FUNCS[event]() end
end

-- event function that happens when the addon is initialized.
function ADDON_OnInitialize(event, name)
    if (name ~= "WoW_Addon_Template") then return end
end


function ADDON_UnregisterEvent(self, event)
    self:UnregisterEvent(event);
end

local events = CreateFrame("Frame", "EventsFrame");

local eventNames = { "ADDON_LOADED"}

for _, eventName in pairs(eventNames) do
    events:RegisterEvent(eventName);
end
events:SetScript("OnEvent", ADDON_OnEvent); -- calls the above OnEvent function to determine what to do with the event
