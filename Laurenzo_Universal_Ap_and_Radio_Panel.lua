--LUAPR
-- Laurenzo's Universal AP and Radio

-- ap buttons first

-- IS_ON are to indicate if corresponding indicator LED is on. 
-- DRAWN is the numerical value to be drawn on the 7seg display.


-- kaikki datarefit OUTPUTtia varten

LUARP_IS_AP1_ON = create_dataref_table("FlyWithLua/LUARP_IS_AP1_ON", "Int") 
LUARP_IS_AP2_ON = create_dataref_table("FlyWithLua/LUARP_IS_AP2_ON", "Int") 

-- Speed and throttle
LUARP_IS_ATHR_ON = create_dataref_table("FlyWithLua/LUARP_IS_ATHR_ON", "Int") 
-- above prolly not needed? as theres no led or anything


LUARP_IS_N1_ON = create_dataref_table("FlyWithLua/LUARP_IS_N1_ON", "Int") 
LUARP_IS_SPD_ON = create_dataref_table("FlyWithLua/LUARP_IS_SPD_ON", "Int")

LUARP_DRAWN_SPEED = create_dataref_table("FlyWithLua/LUARP_DRAWN_SPEED", "Float")
-- separate output and input


-- lateral navigation
LUARP_IS_HDG_ON = create_dataref_table("FlyWithLua/LUARP_IS_HDG_ON", "Int")
LUARP_IS_APP_ON = create_dataref_table("FlyWithLua/LUARP_IS_APP_ON", "Int")
LUARP_IS_VORL_ON = create_dataref_table("FlyWithLua/LUARP_IS_VORL_ON", "Int")
LUARP_IS_LNAV_ON = create_dataref_table("FlyWithLua/LUARP_IS_LNAV_ON", "Int")

LUARP_DRAWN_HDG = create_dataref_table("FlyWithLua/LUARP_DRAWN_HDG", "Float")


-- vertical navigation

LUARP_IS_ALTHLD_ON = create_dataref_table("FlyWithLua/LUARP_IS_ALTHLD_ON", "Int")
LUARP_IS_LVLCHG_ON = create_dataref_table("FlyWithLua/LUARP_IS_LVLCHG_ON", "Int")
LUARP_IS_VNAV_ON = create_dataref_table("FlyWithLua/LUARP_IS_VNAV_ON", "Int")

LUARP_DRAWN_ALT = create_dataref_table("FlyWithLua/LUARP_DRAWN_ALT", "Float")

-- VS
LUARP_IS_VS_ON = create_dataref_table("FlyWithLua/LUARP_IS_VS_ON", "Int")

LUARP_DRAWN_VS = create_dataref_table("FlyWithLua/LUARP_DRAWN_VS", "Float")

-- CRS
LUARP_DRAWN_CRS = create_dataref_table("FlyWithLua/LUARP_DRAWN_CRS", "Float")




-- Start the plane spesific settings and specialities. If no special stuff needed, only name the datarefs.
--NOTE lua hangs if same name dataref gets assigned again. Hence the else for defaults


-- FROM ACF on arvot koneen datarefeista. VAL_arvot on value noille dialeille

-- ZIBO
if PLANE_ICAO == "B738" and XPLMFindDataRef("laminar/B738/autopilot/mcp_hdg_dial")~= nil then 
-- AP buttons
-- zibo doesn't let you write most datarefs
--dataref("AP1_FROM_ACF_LUARP", "laminar/B738/autopilot/cmd_a_status", "readonly")  -- INOP
--dataref("AP2_FROM_ACF_LUARP", "laminar/B738/autopilot/cmd_b_status", "writeable")  -- INOP

-- Throttle and speed
-- Dataref("ATHR_FROM_ACF_LUARP", "laminar/B738/autopilot/autothrottle_arm_pos", "readonly") -- INOP

-- dataref("N1_FROM_ACF_LUARP", "laminar/B738/autopilot/n1_status", "readonly") -- INOP
dataref("SPD_FROM_ACF_LUARP", "laminar/B738/autopilot/speed_status1", "readonly")

dataref("SPEED_VAL_FROM_ACF_LUARP", "laminar/B738/autopilot/mcp_speed_dial_kts_mach", "readonly")

-- Lateral navigation
dataref("HDG_FROM_ACF_LUARP", "laminar/B738/autopilot/hdg_sel_status", "readonly")
dataref("APP_FROM_ACF_LUARP", "laminar/B738/autopilot/app_status", "readonly")
dataref("VORL_FROM_ACF_LUARP", "laminar/B738/autopilot/vorloc_status", "readonly")
dataref("LNAV_FROM_ACF_LUARP", "laminar/B738/autopilot/lnav_status", "readonly")
  
dataref("HDG_VAL_FROM_ACF_LUARP", "laminar/B738/autopilot/mcp_hdg_dial", "readonly")


-- Vertical Navigation
dataref("VNAV_FROM_ACF_LUARP", "laminar/B738/autopilot/vnav_status1", "readonly")
dataref("ALTHLD_FROM_ACF_LUARP", "laminar/B738/autopilot/alt_hld_status", "readonly")
dataref("LVLCHG_FROM_ACF_LUARP", "laminar/B738/autopilot/lvl_chg_status", "readonly")

dataref("ALT_VAL_FROM_ACF_LUARP", "laminar/B738/autopilot/mcp_alt_dial", "readonly")

-- VS
dataref("VS_FROM_ACF_LUARP", "laminar/B738/autopilot/vs_status", "readonly")

dataref("VS_VAL_FROM_ACF_LUARP", "sim/cockpit2/autopilot/vvi_dial_fpm", "writeable")
dataref("luarp_zibo_show_vs", "laminar/B738/autopilot/vvi_dial_show", "readonly")  -- if the vs dial screen is blank or not

-- CRS
dataref ("CRS_VAL_FROM_ACF_LUARP", "laminar/B738/autopilot/course_pilot", "writeable")

-- what happens when actuating the custom commands

function LUARP_COMMAND_SPD_TOGGLE()
	command_once ("laminar/B738/autopilot/speed_press") -- custom zibo commands 
end 

function LUARP_COMMAND_SPEED_UP()
	command_once ("sim/autopilot/airspeed_up")
end 

function LUARP_COMMAND_SPEED_DN()
	command_once ("sim/autopilot/airspeed_down")
end 

function LUARP_COMMAND_LNAV_TOGGLE()
	command_once ("laminar/B738/autopilot/lnav_press")
end 

function LUARP_COMMAND_HDG_TOGGLE()
	command_once ("laminar/B738/autopilot/hdg_sel_press")
end

function LUARP_COMMAND_APP_TOGGLE()
	command_once ("laminar/B738/autopilot/app_press")
end 

function LUARP_COMMAND_VORL_TOGGLE()
	command_once ("laminar/B738/autopilot/vorloc_press")
end

function LUARP_COMMAND_HDG_UP() 
	command_once ("laminar/B738/autopilot/heading_up")
end 

function LUARP_COMMAND_HDG_DN() 
	command_once ("laminar/B738/autopilot/heading_dn")
end 

function LUARP_COMMAND_LVLCHG_TOGGLE()
	command_once ("laminar/B738/autopilot/lvl_chg_press")
end 

function LUARP_COMMAND_ALTHLD_TOGGLE()
	command_once ("laminar/B738/autopilot/alt_hld_press")
end 

function LUARP_COMMAND_VNAV_TOGGLE()
	command_once ("laminar/B738/autopilot/vnav_press")
end 

function LUARP_COMMAND_ALT_UP() -- trying the alt increment chg. Not a nice way to do it 
	command_once ("laminar/B738/autopilot/altitude_up")

end 


function LUARP_COMMAND_ALT_DN()
	command_once ("laminar/B738/autopilot/altitude_dn")
end 

function LUARP_COMMAND_VS_TOGGLE() 
	command_once ("laminar/B738/autopilot/vs_press")
end

function LUARP_COMMAND_VS_UP()
	VS_VAL_FROM_ACF_LUARP = VS_VAL_FROM_ACF_LUARP + 100
end 

function LUARP_COMMAND_VS_DN()	
	VS_VAL_FROM_ACF_LUARP = VS_VAL_FROM_ACF_LUARP - 100
end 

function LUARP_COMMAND_CRS_UP()
	CRS_VAL_FROM_ACF_LUARP = CRS_VAL_FROM_ACF_LUARP + 1
end 

function LUARP_COMMAND_CRS_DN() 
	CRS_VAL_FROM_ACF_LUARP = CRS_VAL_FROM_ACF_LUARP - 1
end 



-- TOLISS
elseif PLANE_ICAO == "A319" and XPLMFindDataRef == "AirbusFBW/SPDmanaged" ~= nil then 



-- configs per default datarefs. Inputs are writable, outputs (leds).
-- AP buttons
--dataref("AP1_FROM_ACF_LUARP", "sim/cockpit2/autopilot/autopilot_on", "writeable") -- INOP
--dataref("AP2_FROM_ACF_LUARP", "sim/cockpit2/autopilot/autopilot2_on", "writeable") -- INOP

-- Throttle and speed
--dataref("ATHR_FROM_ACF_LUARP", "sim/cockpit2/autopilot/autothrottle_on", "writeable") -- INOP

--dataref("N1_FROM_ACF_LUARP", "sim/cockpit2/autopilot/autothrottle_on", "writable") -- INOP
-- weird default autothrottle stuff
	
dataref("Toliss_Spd_Managed_for_luarp", "AirbusFBW/SPDmanaged", "readonly") --  SPD managed on airbus. (dashed). Push/pull stuff
-- managed speed on would mean that its dashed and controlled my computer


dataref("SPEED_VAL_FROM_ACF_LUARP", "sim/cockpit/autopilot/airspeed", "writeable")

-- Lateral navigation
dataref("HDG_FROM_ACF_LUARP", "AirbusFBW/SPDmanaged", "readonly")
dataref("Toliss_Hdg_Managed_for_luarp", "AirbusFBW/HDGmanaged", "readonly") --  HDG managed on airbus. (dashed). Push/pull stuff

dataref("APP_FROM_ACF_LUARP", "AirbusFBW/APPRilluminated", "readonly")
dataref("VORL_FROM_ACF_LUARP", "AirbusFBW/LOCilluminated", "readonly")


  
dataref("HDG_VAL_FROM_ACF_LUARP", "sim/cockpit/autopilot/heading", "writeable")


-- Vertical Navigation
dataref("Toliss_Alt_Managed_for_luarp", "AirbusFBW/ALTmanaged", "readonly") 

ALTHLD_FROM_ACF_LUARP = 0 -- not really equilevant for airbus so we'll go with althold always off. 


dataref("Toliss_APVerrticalMode", "AirbusFBW/APVerticalMode", "readonly")-- 
-- lets go with level change equilevant to expedite. That's some very weird dataref from toliss side, if exped is pressed the value seems to be 
-- either 112 or 113. Doesnt seem to be above 110 in other cases so lets use that 

dataref("ALT_VAL_FROM_ACF_LUARP", "sim/cockpit/autopilot/altitude", "writeable")

dataref("ALT_1000_INCREMENTS_FROM_ACF_LUARP", "AirbusFBW/ALT100_1000", "writeable") -- toliss own dataref 

-- VS
dataref("Toliss_VSdashed", "AirbusFBW/VSdashed", "readonly")

-- CRS 
dataref("VS_VAL_FROM_ACF_LUARP", "sim/cockpit2/autopilot/vvi_dial_fpm", "writeable")

CRS_VAL_FROM_ACF_LUARP = 0 -- no course change for the bus, its done from the MCDU


--- Commands what happens for this plane


-- function LUARP_COMMAND_N1_TOGGLE() -- INOP
-- end -- INOP
function Toliss_Custom_Refresh() -- needed to sync the toliss custom datarefs other planes dont have
if Toliss_VSdashed == 0 then VS_FROM_ACF_LUARP = 1 else VS_FROM_ACF_LUARP = 0 end  -- vs mode is used when VS is not dashed. 
if Toliss_APVerrticalMode > 110 then LVLCHG_FROM_ACF_LUARP = 1 else LVLCHG_FROM_ACF_LUARP = 0 end 
if Toliss_Alt_Managed_for_luarp == 1 then VNAV_FROM_ACF_LUARP = 1 else VNAV_FROM_ACF_LUARP = 0 end -- managed alt on is equilevant of boeing VNAV on
if Toliss_Hdg_Managed_for_luarp == 1 then LNAV_FROM_ACF_LUARP = 1 else LNAV_FROM_ACF_LUARP = 0 end -- managed hdg on is equilevant to LNAV on
if Toliss_Hdg_Managed_for_luarp == 0 then HDG_FROM_ACF_LUARP = 1 else HDG_FROM_ACF_LUARP = 0 end -- managed hdg off is equilevant of boeing HDG sel mode ON.
if Toliss_Spd_Managed_for_luarp == 0 then SPD_FROM_ACF_LUARP = 1 else SPD_FROM_ACF_LUARP = 0 end -- managed speed off is equilevant of boeing SPD mode ON.
end 
do_every_frame ("Toliss_Custom_Refresh()")

function LUARP_COMMAND_SPD_TOGGLE()
	if SPD_FROM_ACF_LUARP == 0 then -- if SPD isn't on, its controlled by ap. Pull the knob to be able to manage the speed uself
		command_once ("AirbusFBW/PullSPDSel") -- pull the speed knob
	else 
		command_once ("AirbusFBW/PushSPDSel") -- vice versa, is spd mode not on, push the knob to enter managed mode (dashed anc controller by mcdu)
	end 
end 

function LUARP_COMMAND_SPEED_UP()
	SPEED_VAL_FROM_ACF_LUARP = SPEED_VAL_FROM_ACF_LUARP + 1 -- for rotary encoders, two settings for both increase and decrease. 
end 

function LUARP_COMMAND_SPEED_DN()
	SPEED_VAL_FROM_ACF_LUARP = SPEED_VAL_FROM_ACF_LUARP - 1
end 

function LUARP_COMMAND_LNAV_TOGGLE()
		command_once ("AirbusFBW/PushHDGSel") -- push to enter lnac like mode 

end 

function LUARP_COMMAND_HDG_TOGGLE()
		command_once ("AirbusFBW/PullHDGSel") -- pull to enter the hdg sel like mode, exiting lnav like mode
end

function LUARP_COMMAND_APP_TOGGLE()
	command_once("AirbusFBW/APPRbutton")
end 

function LUARP_COMMAND_VORL_TOGGLE()
	command_once("AirbusFBW/LOCbutton")
end

function LUARP_COMMAND_HDG_UP() 
	HDG_VAL_FROM_ACF_LUARP = HDG_VAL_FROM_ACF_LUARP + 1
end 

function LUARP_COMMAND_HDG_DN() 
	HDG_VAL_FROM_ACF_LUARP = HDG_VAL_FROM_ACF_LUARP - 1
end 

function LUARP_COMMAND_LVLCHG_TOGGLE()
	command_once ("AirbusFBW/EXPEDbutton")
end 

function LUARP_COMMAND_ALTHLD_TOGGLE()
	command_once("AirbusFBW/PullAltitude") -- can't really think of anything else, pulling to exit the managed mode. ALso exits exped mode.
end 

function LUARP_COMMAND_VNAV_TOGGLE()
		command_once ("AirbusFBW/PushAltitude") -- push to enter the VNAV-like mode ( alt managed or whatever)
end 

function LUARP_COMMAND_ALT_UP()
	if ALT_1000_INCREMENTS_FROM_ACF_LUARP == 1 then 
		ALT_VAL_FROM_ACF_LUARP = ALT_VAL_FROM_ACF_LUARP + 1000
	else
		ALT_VAL_FROM_ACF_LUARP = ALT_VAL_FROM_ACF_LUARP + 100
	end 
end 

function LUARP_COMMAND_ALT_DN()
	if ALT_1000_INCREMENTS_FROM_ACF_LUARP == 1 then 
		ALT_VAL_FROM_ACF_LUARP = ALT_VAL_FROM_ACF_LUARP - 1000
	else
		ALT_VAL_FROM_ACF_LUARP = ALT_VAL_FROM_ACF_LUARP - 100
	end 
end 

function LUARP_COMMAND_VS_TOGGLE() 
		command_once ("AirbusFBW/PushVSSel") -- just enter the vs mode. If already on, pushing it will set it to 0 
end

function LUARP_COMMAND_VS_UP()
	VS_VAL_FROM_ACF_LUARP = VS_VAL_FROM_ACF_LUARP + 100
end 

function LUARP_COMMAND_VS_DN()	
VS_VAL_FROM_ACF_LUARP = VS_VAL_FROM_ACF_LUARP - 100
end 

function LUARP_COMMAND_CRS_UP()
	CRS_VAL_FROM_ACF_LUARP = CRS_VAL_FROM_ACF_LUARP + 1
end 

function LUARP_COMMAND_CRS_DN() 
	CRS_VAL_FROM_ACF_LUARP = CRS_VAL_FROM_ACF_LUARP - 1
end 


local cooldown_for_incrmnt = os.clock()
--  temporary solution. In my setup when pressing the button to change it it register usually 2 presses so nothing actually happens. 

function LUARP_ALT_INCREMENT_CHG()

	if ALT_1000_INCREMENTS_FROM_ACF_LUARP == 0 and os.clock() > cooldown_for_incrmnt + 1 then 
		ALT_1000_INCREMENTS_FROM_ACF_LUARP = 1 
		cooldown_for_incrmnt = os.clock()--reset clock

	elseif ALT_1000_INCREMENTS_FROM_ACF_LUARP == 1 and os.clock() > cooldown_for_incrmnt + 1 then 
		ALT_1000_INCREMENTS_FROM_ACF_LUARP = 0 
		cooldown_for_incrmnt = os.clock()--reset clock

	end 
end 





-- INI

elseif PLANE_ICAO == "A306" and XPLMFindDataRef("A300/MCDU/ap1_on")~= nil then 
-- AP buttons
--dataref("AP1_FROM_ACF_LUARP", "laminar/B738/autopilot/cmd_a_status", "readonly")  -- INOP
--dataref("AP2_FROM_ACF_LUARP", "laminar/B738/autopilot/cmd_b_status", "writeable")  -- INOP

-- Throttle and speed
-- Dataref("ATHR_FROM_ACF_LUARP", "laminar/B738/autopilot/autothrottle_arm_pos", "readonly") -- INOP

-- dataref("N1_FROM_ACF_LUARP", "laminar/B738/autopilot/n1_status", "readonly") -- INOP
SPD_FROM_ACF_LUARP = 0  -- No separate speed mode. Speed can only be controlled when not in profile mode

dataref("SPEED_VAL_FROM_ACF_LUARP", "sim/cockpit2/autopilot/airspeed_dial_kts_mach", "readonly") -- not working, havent found the correct dataref

-- Lateral navigation (outputs for lights)
dataref("HDG_FROM_ACF_LUARP", "A300/MCDU/animations/lights/heading_sel", "readonly")
dataref("APP_FROM_ACF_LUARP", "A300/MCDU/animations/lights/approach", "readonly")
dataref("VORL_FROM_ACF_LUARP", "A300/MCDU/animations/lights/localizer", "readonly")
dataref("LNAV_FROM_ACF_LUARP", "A300/MCDU/animations/lights/nav", "readonly")
  
dataref("HDG_VAL_FROM_ACF_LUARP", "sim/cockpit2/autopilot/heading_dial_deg_mag_pilot", "writeable") -- not working


-- Vertical Navigation
dataref("VNAV_FROM_ACF_LUARP", "A300/MCDU/animations/lights/profile_mode", "readonly")
dataref("ALTHLD_FROM_ACF_LUARP", "A300/MCDU/animations/lights/altitude_hold", "readonly")
dataref("LVLCHG_FROM_ACF_LUARP", "A300/MCDU/animations/lights/level_change", "readonly")

dataref("ALT_VAL_FROM_ACF_LUARP", "sim/cockpit2/autopilot/altitude_dial_ft", "readonly")


-- CRS 

-- VS
VS_FROM_ACF_LUARP = 0 -- no light for VS 

dataref("VS_VAL_FROM_ACF_LUARP", "sim/cockpit2/autopilot/vvi_dial_fpm", "writeable") 

-- CRS
dataref ("CRS_VAL_FROM_ACF_LUARP", "sim/cockpit2/radios/actuators/nav1_course_deg_mag_pilot", "writeable")

-- what happens when actuating the custom commands
-- bit awkward, dunno why works with other planes without the clock. But anyway, gonna have to make a timer for all the buttons 


function LUARP_COMMAND_SPD_TOGGLE()
	-- not a thing in a300
end 

function LUARP_COMMAND_SPEED_UP()
	command_once ("A300/MCDU/airspeed_up")
end 

function LUARP_COMMAND_SPEED_DN()
	command_once ("A300/MCDU/airspeed_down")
end 

local cooldown_for_LNAV = os.clock()
function LUARP_COMMAND_LNAV_TOGGLE()
	if os.clock() > cooldown_for_LNAV + 0.1 then 
		command_once ("A300/MCDU/nav_mode")
		cooldown_for_LNAV = os.clock()
	end 
end 

local cooldown_for_HDG = os.clock()
function LUARP_COMMAND_HDG_TOGGLE()
	if os.clock() > cooldown_for_HDG + 0.1 then 
		command_once ("A300/MCDU/heading_select")
		cooldown_for_HDG = os.clock()
	end 
end

local cooldown_for_APP
function LUARP_COMMAND_APP_TOGGLE()
	if os.clock() > cooldown_for_APP + 0.1 then 
		command_once ("A300/MCDU/approach_mode")
		cooldown_for_APP = os.clock()
	end 
end 

local cooldown_for_VORL = os.clock()
function LUARP_COMMAND_VORL_TOGGLE()
	if os.clock() > cooldown_for_VORL + 0.1 then 
		command_once ("A300/MCDU/loc_toggle")
		cooldown_for_VORL = os.clock()
	end 
end

function LUARP_COMMAND_HDG_UP() 
	command_once ("A300/MCDU/heading_up")
end 

function LUARP_COMMAND_HDG_DN() 
	command_once ("A300/MCDU/heading_down")
end 

local cooldown_for_LVLVHG = os.clock()
function LUARP_COMMAND_LVLCHG_TOGGLE()
	if os.clock() > cooldown_for_LVLCHG + 0.1 then 
		command_once ("A300/MCDU/level_change")
		cooldown_for_LVLVHG = os.clock()
	end 
end 

local cooldown_for_ALTHLD = os.clock()
function LUARP_COMMAND_ALTHLD_TOGGLE()
	if os.clock() > cooldown_for_ALTHLD + 0.1 then 
		command_once ("A300/MCDU/altitude_hold_engage")
		cooldown_for_ALTHLD = os.clock()
	end 
end 

local cooldown_for_VNAV = os.clock()
function LUARP_COMMAND_VNAV_TOGGLE()
	if os.clock() > cooldown_for_VNAV + 0.1 then 
		command_once ("A300/MCDU/profile_mode")
		cooldown_for_VNAV = os.clock()
	end 
end 

function LUARP_COMMAND_ALT_UP() -- trying the alt increment chg. Not a nice way to do it 
	command_once ("A300/MCDU/altitude_up")

end 


function LUARP_COMMAND_ALT_DN()
	command_once ("A300/MCDU/altitude_down")
end 

local cooldown_for_VS = os.clock()
function LUARP_COMMAND_VS_TOGGLE() 
	if os.clock() > cooldown_for_VS + 0.1 then 
		command_once ("A300/MCDU/vvi_engage")
		cooldown_for_VS = os.clock()
	end 
end

function LUARP_COMMAND_VS_UP()
	command_once("A300/MCDU/vvi_up")
end 

function LUARP_COMMAND_VS_DN()	
	command_once("A300/MCDU/vvi_down")
end 

function LUARP_COMMAND_CRS_UP()
	CRS_VAL_FROM_ACF_LUARP = CRS_VAL_FROM_ACF_LUARP + 1
end 

function LUARP_COMMAND_CRS_DN() 
	CRS_VAL_FROM_ACF_LUARP = CRS_VAL_FROM_ACF_LUARP - 1
end 

local cooldown_for_incrmnt = os.clock()
function LUARP_ALT_INCREMENT_CHG()

	if os.clock() > cooldown_for_incrmnt + 1 then 
			command_once("A300/MCDU/change_alt_setting")
			cooldown_for_incrmnt = os.clock() -- reset timer 
	end 
end 






else -- Defaults if no custom plane detected

-- configs per default datarefs. Inputs are writable, outputs (leds).
-- AP buttons
--dataref("AP1_FROM_ACF_LUARP", "sim/cockpit2/autopilot/autopilot_on", "writeable") -- INOP
--dataref("AP2_FROM_ACF_LUARP", "sim/cockpit2/autopilot/autopilot2_on", "writeable") -- INOP

-- Throttle and speed
--dataref("ATHR_FROM_ACF_LUARP", "sim/cockpit2/autopilot/autothrottle_on", "writeable") -- INOP

--dataref("N1_FROM_ACF_LUARP", "sim/cockpit2/autopilot/autothrottle_on", "writable") -- INOP
-- weird default autothrottle stuff
dataref("for_luarp_default_autothrottle_status", "sim/cockpit2/autopilot/autothrottle_enabled", "writeable")
	
	if for_luarp_default_autothrottle_status == 1 then -- 1 == airspeed hold, 2 == N1
		N1_FROM_ACF_LUARP = 0 -- set that to 0 if the setting is set to 1. 
		SPD_FROM_ACF_LUARP = 1-- and speed mode to 1 
		
	elseif for_luarp_default_autothrottle_status == 2 then
		N1_FROM_ACF_LUARP = 1 
		SPD_FROM_ACF_LUARP = 0 
	else -- otherwise both off
		N1_FROM_ACF_LUARP = 0
		SPD_FROM_ACF_LUARP = 0
	end 


dataref("SPEED_VAL_FROM_ACF_LUARP", "sim/cockpit2/autopilot/airspeed_dial_kts_mach", "writeable")

-- Lateral navigation
dataref("HDG_FROM_ACF_LUARP", "sim/cockpit2/autopilot/heading_mode", "writeable")
dataref("APP_FROM_ACF_LUARP", "sim/cockpit2/autopilot/glideslope_armed", "writeable")
dataref("VORL_FROM_ACF_LUARP", "sim/cockpit2/autopilot/hnav_armed", "writeable")
dataref("LNAV_FROM_ACF_LUARP", "sim/cockpit2/autopilot/backcourse_on", "writeable")
  
dataref("HDG_VAL_FROM_ACF_LUARP", "sim/cockpit2/autopilot/heading_dial_deg_mag_pilot", "writeable")


-- Vertical Navigation
dataref("VNAV_FROM_ACF_LUARP", "sim/cockpit2/autopilot/vnav_armed", "writeable")
dataref("ALTHLD_FROM_ACF_LUARP", "sim/cockpit2/autopilot/altitude_hold_armed", "writeable")
dataref("LVLCHG_FROM_ACF_LUARP", "sim/cockpit2/autopilot/airspeed_is_mach", "writeable")-- just random shit I wanna assign to avoid errors

dataref("ALT_VAL_FROM_ACF_LUARP", "sim/cockpit2/autopilot/altitude_dial_ft", "writeable")

-- VS

dataref("VS_FROM_ACF_LUARP", "sim/cockpit2/autopilot/alt_vvi_is_showing_vvi", "writeable")-- just random shit I wanna assign to avoid errors

dataref("VS_VAL_FROM_ACF_LUARP", "sim/cockpit2/autopilot/vvi_dial_fpm", "writeable")

-- CRS 
dataref ("CRS_VAL_FROM_ACF_LUARP", "sim/cockpit/radios/nav1_obs_degm", "writeable")


--- Commands what happens for this plane


-- function LUARP_COMMAND_N1_TOGGLE() -- INOP
-- end -- INOP


-- set what happens for when each custom command is actuated. Can be modifying a dataref, could be calling a plane's custom command etc. (depends on the plane, not all datarefs are writeable.)
function LUARP_COMMAND_SPD_TOGGLE()
	if SPD_FROM_ACF_LUARP == 0 then SPD_FROM_ACF_LUARP = 1 else SPD_FROM_ACF_LUARP = 0 end -- if off, turn on, if already on, turn off
end 

function LUARP_COMMAND_SPEED_UP()
	SPEED_VAL_FROM_ACF_LUARP = SPEED_VAL_FROM_ACF_LUARP + 1 -- for rotary encoders, two settings for both increase and decrease. 
end 

function LUARP_COMMAND_SPEED_DN()
	SPEED_VAL_FROM_ACF_LUARP = SPEED_VAL_FROM_ACF_LUARP - 1
end 

function LUARP_COMMAND_LNAV_TOGGLE()
	if LNAV_FROM_ACF_LUARP == 0 then LNAV_FROM_ACF_LUARP = 1 else LNAV_FROM_ACF_LUARP = 0 end
end 

function LUARP_COMMAND_HDG_TOGGLE()
	if HDG_FROM_ACF_LUARP == 0 then HDG_FROM_ACF_LUARP = 1 else HDG_FROM_ACF_LUARP = 0 end
end

function LUARP_COMMAND_APP_TOGGLE()
	if APP_FROM_ACF_LUARP == 0 then APP_FROM_ACF_LUARP = 1 else APP_FROM_ACF_LUARP = 0 end
end 

function LUARP_COMMAND_VORL_TOGGLE()
	if VORL_FROM_ACF_LUARP == 0 then VORL_FROM_ACF_LUARP = 1 else VORL_FROM_ACF_LUARP = 0 end
end

function LUARP_COMMAND_HDG_UP() 
	HDG_VAL_FROM_ACF_LUARP = HDG_VAL_FROM_ACF_LUARP + 1
end 

function LUARP_COMMAND_HDG_DN() 
	HDG_VAL_FROM_ACF_LUARP = HDG_VAL_FROM_ACF_LUARP - 1
end 

function LUARP_COMMAND_LVLCHG_TOGGLE()
	if LVLCHG_FROM_ACF_LUARP == 0 then LVLCHG_FROM_ACF_LUARP = 1 else LVLCHG_FROM_ACF_LUARP = 0 end
end 

function LUARP_COMMAND_ALTHLD_TOGGLE()
	if ALTHLD_FROM_ACF_LUARP == 0 then ALTHLD_FROM_ACF_LUARP = 1 else ALTHLD_FROM_ACF_LUARP = 0 end
end 

function LUARP_COMMAND_VNAV_TOGGLE()
	if LNAV_FROM_ACF_LUARP == 0 then LNAV_FROM_ACF_LUARP = 1 else LNAV_FROM_ACF_LUARP = 0 end
end 

function LUARP_COMMAND_ALT_UP()
	ALT_VAL_FROM_ACF_LUARP = ALT_VAL_FROM_ACF_LUARP + 100 -- could add some if clauses to check the 1000 increment status. Wont implement for default, but can be done for buses
end 

function LUARP_COMMAND_ALT_DN()
	ALT_VAL_FROM_ACF_LUARP = ALT_VAL_FROM_ACF_LUARP - 100
end 

function LUARP_COMMAND_VS_TOGGLE() 
	if VS_FROM_ACF_LUARP == 0 then VS_FROM_ACF_LUARP = 1 else VS_FROM_ACF_LUARP = 0 end
end

function LUARP_COMMAND_VS_UP()
	VS_VAL_FROM_ACF_LUARP = VS_VAL_FROM_ACF_LUARP + 100
end 

function LUARP_COMMAND_VS_DN()	
VS_VAL_FROM_ACF_LUARP = VS_VAL_FROM_ACF_LUARP - 100
end 

function LUARP_COMMAND_CRS_UP()
	CRS_VAL_FROM_ACF_LUARP = CRS_VAL_FROM_ACF_LUARP + 1
end 

function LUARP_COMMAND_CRS_DN() 
	CRS_VAL_FROM_ACF_LUARP = CRS_VAL_FROM_ACF_LUARP - 1
end 
--[[

local cooldown_for_incrmnt = os.clock()
--  temporary solution. In my setup when pressing the button to change it it register usually 2 presses so nothing actually happens. 
function LUARP_ALT_INCREMENT_CHG()
-- check that the variable exists; itll be NULL for planes that doesnt support it 
--check that it has been over 3 seconds since last press
	if ALT_1000_INCREMENTS_FROM_ACF_LUARP ~= nil and ALT_1000_INCREMENTS_FROM_ACF_LUARP == 0 and os.clock() > cooldown_for_incrmnt + 1 then 
		ALT_1000_INCREMENTS_FROM_ACF_LUARP = 1 
		print ("Alt increment changed from 100s to 1000s") -- for debugging
		cooldown_for_incrmnt = os.clock()--reset clock

	elseif ALT_1000_INCREMENTS_FROM_ACF_LUARP ~= nil and  ALT_1000_INCREMENTS_FROM_ACF_LUARP == 1 and os.clock() > cooldown_for_incrmnt + 1 then 
		ALT_1000_INCREMENTS_FROM_ACF_LUARP = 0 
		print ("Alt increment changed from 1000s to 100s") -- for debugging
		cooldown_for_incrmnt = os.clock()--reset clock

	end 
end 

]]
end 


function Refresh_output()-- Outputs, so LEDs aka lights on the buttons and 7 segment displays
-- set the outputs aka led status to whatever the plane's dataref says
-- lateral navigation
	LUARP_IS_HDG_ON[0] = HDG_FROM_ACF_LUARP
	LUARP_IS_APP_ON[0] = APP_FROM_ACF_LUARP 
	LUARP_IS_VORL_ON[0] = VORL_FROM_ACF_LUARP
	LUARP_IS_LNAV_ON[0] = LNAV_FROM_ACF_LUARP
	
	LUARP_DRAWN_HDG[0] = HDG_VAL_FROM_ACF_LUARP 

	
	LUARP_IS_SPD_ON[0] = SPD_FROM_ACF_LUARP
	--LUARP_IS_N1_ON[0] = N1_FROM_ACF_LUARP -- INOP
	
	LUARP_DRAWN_SPEED[0] = SPEED_VAL_FROM_ACF_LUARP 

	
	LUARP_IS_ALTHLD_ON[0] = ALTHLD_FROM_ACF_LUARP
	LUARP_IS_LVLCHG_ON[0] = LVLCHG_FROM_ACF_LUARP
	LUARP_IS_VNAV_ON[0] = VNAV_FROM_ACF_LUARP

	LUARP_DRAWN_ALT[0] = ALT_VAL_FROM_ACF_LUARP

-- VS
	if PLANE_ICAO == "B738" and XPLMFindDataRef ("laminar/B738/autopilot/vvi_dial_show")~= nil then -- check it exists
		if luarp_zibo_show_vs == 1 then LUARP_IS_VS_ON[0] = VS_FROM_ACF_LUARP else LUARP_IS_VS_ON[0] = "" end -- show blank if vs_show is not 1 
	else 
		LUARP_IS_VS_ON[0] = VS_FROM_ACF_LUARP
	end --with zibo, set the vs value to blank if vs mode not on

	LUARP_DRAWN_VS[0] = VS_VAL_FROM_ACF_LUARP 
	
-- CRS
	LUARP_DRAWN_CRS[0] = CRS_VAL_FROM_ACF_LUARP 


end
do_every_frame("Refresh_output()")

-- functions of what happens when the universal commands are called. Plane spesific, for some planes could be calling custom command made by the dev, for some might be
-- modifying a dataref (not all datarefs are writeable so cant use the same method for all.)




-- Create the commands 


-- So creating universal commands. If xx is off, turn it on, in other cases (it's off) turn it off. This modifies the aircraft spesific dataref. When these commands are executed, they change the actual plane's dataref. When plane's dataref 
-- is changed, the Refresh_output function changes the output value that's is shown on the panel. (so if xx button can't be turned on due to ac state, it won't and the light wont illuminate. No forcing here.)

-- Throttle and speed
--create_command ("FlyWithLua/LUARP_COMMAND_N1_TOGGLE", "LUARP N1 TOGGLE", "if N1_FROM_ACF_LUARP == 0 then N1_FROM_ACF_LUARP = 1 else N1_FROM_ACF_LUARP = 0 end", "", "") -- INOP
create_command ("FlyWithLua/LUARP_COMMAND_SPD_TOGGLE", "LUARP SPD TOGGLE", "LUARP_COMMAND_SPD_TOGGLE()", "", "")
-- Two commands for rotary encoder. One for increasing the value, one for subtracting
create_command ("FlyWithLua/LUARP_COMMAND_SPEED_UP", "LUARP SPEED UP", "LUARP_COMMAND_SPEED_UP()", "", "") -- increase by 1 
create_command ("FlyWithLua/LUARP_COMMAND_SPEED_DN", "LUARP SPEED DN", "LUARP_COMMAND_SPEED_DN()", "", "") -- decrease by 1 

-- Lateral Navigation
create_command ("FlyWithLua/LUARP_COMMAND_LNAV_TOGGLE", "LUARP LNAV TOGGLE", "LUARP_COMMAND_LNAV_TOGGLE()", "", "")
create_command ("FlyWithLua/LUARP_COMMAND_HDG_TOGGLE", "LUARP HDG TOGGLE", "LUARP_COMMAND_HDG_TOGGLE()", "", "")
create_command ("FlyWithLua/LUARP_COMMAND_APP_TOGGLE", "LUARP APP TOGGLE", "LUARP_COMMAND_APP_TOGGLE()", "", "")
create_command ("FlyWithLua/LUARP_COMMAND_VORL_TOGGLE", "LUARP VORL TOGGLE", "LUARP_COMMAND_VORL_TOGGLE()", "", "")

create_command ("FlyWithLua/LUARP_COMMAND_HDG_UP", "LUARP HDG UP", "LUARP_COMMAND_HDG_UP()", "", "") 
create_command ("FlyWithLua/LUARP_COMMAND_HDG_DN", "LUARP HDG DN", "LUARP_COMMAND_HDG_DN()", "", "")

-- Vertical Navigation

create_command ("FlyWithLua/LUARP_COMMAND_LVLCHG_TOGGLE", "LUARP LVLCHG TOGGLE", "LUARP_COMMAND_LVLCHG_TOGGLE()", "", "")
create_command ("FlyWithLua/LUARP_COMMAND_ALTHLD_TOGGLE", "LUARP ALTHLD TOGGLE", "LUARP_COMMAND_ALTHLD_TOGGLE()", "", "")
create_command ("FlyWithLua/LUARP_COMMAND_VNAV_TOGGLE", "LUARP VNAV TOGGLE", "LUARP_COMMAND_VNAV_TOGGLE()", "", "")

create_command ("FlyWithLua/LUARP_COMMAND_ALT_UP", "LUARP ALT UP", "LUARP_COMMAND_ALT_UP()", "", "") 
create_command ("FlyWithLua/LUARP_COMMAND_ALT_DN", "LUARP ALT DN", "LUARP_COMMAND_ALT_DN()", "", "") 

create_command ("FlyWithLua/LUARP_COMMAND_ALT_INCREMENT_CHG", "CHANGE THE ALT INCREMENT 100 <-> 1000. Airbus stuff pretty much", "LUARP_ALT_INCREMENT_CHG()", "", "")

-- VS 
create_command ("FlyWithLua/LUARP_COMMAND_VS_TOGGLE", "LUARP VS TOGGLE", "LUARP_COMMAND_VS_TOGGLE()", "", "")

create_command ("FlyWithLua/LUARP_COMMAND_VS_UP", "LUARP VS UP", "LUARP_COMMAND_VS_UP()", "", "") 
create_command ("FlyWithLua/LUARP_COMMAND_VS_DN", "LUARP VS DN", "LUARP_COMMAND_VS_DN()", "", "")

-- CRS
create_command ("FlyWithLua/LUARP_COMMAND_CRS_UP", "LUARP CRS UP", "LUARP_COMMAND_CRS_UP()", "", "") 
create_command ("FlyWithLua/LUARP_COMMAND_CRS_DN", "LUARP CRS DN", "LUARP_COMMAND_CRS_DN()", "", "")



-------------- RADIO STUFF

LUARP_COM_FREQ_ACTIVE_DRAWN = create_dataref_table ("FlyWithLua/LUARP_COM_FREQ_ACTIVE_DRAWN", "Float")
LUARP_COM_FREQ_STBY_DRAWN = create_dataref_table ("FlyWithLua/LUARP_COM_FREQ_STBY_DRAWN", "Float")
LUARP_NAV_FREQ_ACTIVE_DRAWN = create_dataref_table ("FlyWithLua/LUARP_NAV_FREQ_ACTIVE_DRAWN", "Float") 
LUARP_NAV_FREQ_STBY_DRAWN = create_dataref_table ("FlyWithLua/LUARP_NAV_FREQ_STBY_DRAWN", "Float")
-- those datarefs determine, what will acutally be drawn on the 7 segs; no separate for nav 1 and two as only of them will be shown depending on them

LUARP_COM_SWITCH_OFF = create_dataref_table ("FlyWithLua/LUARP_COM_SWITCH_OFF", "Int")
LUARP_COM_SWITCH_COM2 = create_dataref_table ("FlyWithLua/LUARP_COM_SWITCH_COM2", "Int")

LUARP_NAV_SWITCH_OFF = create_dataref_table ("FlyWithLua/LUARP_NAV_SWITCH_OFF", "Int")
LUARP_NAV_SWITCH_NAV2 = create_dataref_table ("FlyWithLua/LUARP_NAV_SWITCH_NAV2", "Int")
-- for switch position. (separate on off value for each; if it's not off and not set to com2, it must be on com1. The switch has on-off-on logic so thats why



dataref("COM1_Active_from_sim", "sim/cockpit2/radios/actuators/com1_frequency_hz_833", "readonly")
dataref("COM1_Stby_from_sim", "sim/cockpit2/radios/actuators/com1_standby_frequency_hz_833", "readonly")
dataref("COM2_Active_from_sim", "sim/cockpit2/radios/actuators/com2_frequency_hz_833", "readonly")
dataref("COM2_Stby_from_sim", "sim/cockpit2/radios/actuators/com2_standby_frequency_hz_833", "readonly")

dataref("NAV1_Active_from_sim", "sim/cockpit2/radios/actuators/com1_frequency_hz_833", "readonly")
dataref("NAV1_Stby_from_sim", "sim/cockpit2/radios/actuators/com1_standby_frequency_hz_833", "readonly")
dataref("NAV2_Active_from_sim", "sim/cockpit2/radios/actuators/com2_frequency_hz_833", "readonly")
dataref("NAV2_Stby_from_sim", "sim/cockpit2/radios/actuators/com2_standby_frequency_hz_833", "readonly")

function sync_radio()
-- if switch off is true, then dont show anything. If neiher com2 or off are true, it must be com1. If only com2 is true, it must be that
if LUARP_COM_SWITCH_OFF[0] == 1 then 
	LUARP_COM_FREQ_ACTIVE_DRAWN[0] = 0
	LUARP_COM_FREQ_STBY_DRAWN[0] = 0
elseif LUARP_COM_SWITCH_OFF[0] == 0 and LUARP_COM_SWITCH_COM2[0] == 0 then -- both off -> has to be com1 on 
	LUARP_COM_FREQ_ACTIVE_DRAWN[0] = COM1_Active_from_sim
	LUARP_COM_FREQ_STBY_DRAWN[0] = COM1_Stby_from_sim
elseif LUARP_COM_SWITCH_COM2[0] == 1 then -- COM2 on -> draw com2 value
	LUARP_COM_FREQ_ACTIVE_DRAWN[0] = COM2_Active_from_sim
	LUARP_COM_FREQ_STBY_DRAWN[0] = COM2_Stby_from_sim
end

if LUARP_NAV_SWITCH_OFF[0] == 1 then 
	LUARP_NAV_FREQ_ACTIVE_DRAWN[0] = 0
	LUARP_NAV_FREQ_STBY_DRAWN[0] = 0
elseif LUARP_NAV_SWITCH_OFF[0] == 0 and LUARP_NAV_SWITCH_NAV2[0] == 0 then -- both off -> has to be com1 on 
	LUARP_NAV_FREQ_ACTIVE_DRAWN[0] = NAV1_Active_from_sim
	LUARP_NAV_FREQ_STBY_DRAWN[0] = NAV1_Stby_from_sim
elseif LUARP_NAV_SWITCH_NAV2[0] == 1 then -- COM2 on -> draw com2 value
	LUARP_NAV_FREQ_ACTIVE_DRAWN[0] = NAV2_Active_from_sim
	LUARP_NAV_FREQ_STBY_DRAWN[0] = NAV2_Stby_from_sim
end

end 
do_every_frame ("sync_radio()")



-- Function which get executed when calling the commands
-- cant straight up use default commands as the action is dependant on wheter COM1 or 2 is selected

function LUARP_COMMAND_COM_MHZ_UP()
	if LUARP_COM_SWITCH_OFF == 0 and LUARP_COM_SWITCH_COM2 == 0 then -- neither are selected -> COM1 is active
		command_once("sim/radios/stby_com1_coarse_up_833")
	elseif LUARP_COM_SWITCH_COM2 == 1 then 
		command_once("sim/radios/stby_com2_coarse_up_833")
	end
end

function LUARP_COMMAND_COM_MHZ_DN()
	if LUARP_COM_SWITCH_OFF == 0 and LUARP_COM_SWITCH_COM2 == 0 then -- neither are selected -> COM1 is active
		command_once("sim/radios/stby_com1_coarse_down_833")
	elseif LUARP_COM_SWITCH_COM2 == 1 then 
		command_once("sim/radios/stby_com2_coarse_down_833")
	end
end

function LUARP_COMMAND_COM_KHZ_UP()
	if LUARP_COM_SWITCH_OFF == 0 and LUARP_COM_SWITCH_COM2 == 0 then -- neither are selected -> COM1 is active
		command_once("sim/radios/stby_com1_fine_up_833")
	elseif LUARP_COM_SWITCH_COM2 == 1 then 
		command_once("sim/radios/stby_com2_fine_up_833")
	end
end

function LUARP_COMMAND_COM_KHZ_DN()
	if LUARP_COM_SWITCH_OFF == 0 and LUARP_COM_SWITCH_COM2 == 0 then -- neither are selected -> COM1 is active
		command_once("sim/radios/stby_com1_fine_down_833")
	elseif LUARP_COM_SWITCH_COM2 == 1 then 
		command_once("sim/radios/stby_com2_fine_down_833")
	end
end




-- for nav

function LUARP_COMMAND_NAV_MHZ_UP()
	if LUARP_NAV_SWITCH_OFF == 0 and LUARP_NAV_SWITCH_NAV2 == 0 then -- neither are selected -> NAV1 is active
		command_once("sim/radios/stby_nav1_coarse_up")
	elseif LUARP_NAV_SWITCH_NAV2 == 1 then 
		command_once("sim/radios/stby_nav2_coarse_up")
	end
end

function LUARP_COMMAND_NAV_MHZ_DN()
	if LUARP_NAV_SWITCH_OFF == 0 and LUARP_NAV_SWITCH_NAV2 == 0 then -- neither are selected -> NAV1 is active
		command_once("sim/radios/stby_nav1_coarse_down")
	elseif LUARP_NAV_SWITCH_NAV2 == 1 then 
		command_once("sim/radios/stby_nav2_coarse_down")
	end
end

function LUARP_COMMAND_NAV_KHZ_UP()
	if LUARP_NAV_SWITCH_OFF == 0 and LUARP_NAV_SWITCH_NAV2 == 0 then -- neither are selected -> NAV1 is active
		command_once("sim/radios/stby_nav1_fine_up")
	elseif LUARP_NAV_SWITCH_NAV2 == 1 then 
		command_once("sim/radios/stby_nav2_fine_up")
	end
end

function LUARP_COMMAND_NAV_KHZ_DN()
	if LUARP_NAV_SWITCH_OFF == 0 and LUARP_NAV_SWITCH_NAV2 == 0 then -- neither are selected -> NAV1 is active
		command_once("sim/radios/stby_nav1_fine_down")
	elseif LUARP_NAV_SWITCH_NAV2 == 1 then 
		command_once("sim/radios/stby_nav2_fine_down")
	end
end

-- COMMANDS for radio
create_command ("FlyWithLua/LUARP_COMMAND_COM_MHZ_UP", "up the selected stby com freq mhz", "LUARP_COMMAND_COM_MHZ_UP()", "", "")
create_command ("FlyWithLua/LUARP_COMMAND_COM_MHZ_DN", "dpwn the selected stby com freq mhz", "LUARP_COMMAND_COM_MHZ_DN()", "", "")

create_command ("FlyWithLua/LUARP_COMMAND_COM_KHZ_UP", "up the selected stby com freq khz", "LUARP_COMMAND_COM_KHZ_UP()", "", "")
create_command ("FlyWithLua/LUARP_COMMAND_COM_KHZ_DN", "dpwn the selected stby com freq khz", "LUARP_COMMAND_COM_KHZ_DN()", "", "")



create_command ("FlyWithLua/LUARP_COMMAND_NAV_MHZ_UP", "up the selected stby nav freq mhz", "LUARP_COMMAND_NAV_MHZ_UP()", "", "")
create_command ("FlyWithLua/LUARP_COMMAND_NAV_MHZ_DN", "dpwn the selected stby nav freq mhz", "LUARP_COMMAND_NAV_MHZ_DN()", "", "")

create_command ("FlyWithLua/LUARP_COMMAND_NAV_KHZ_UP", "up the selected stby nav freq khz", "LUARP_COMMAND_NAV_KHZ_UP()", "", "")
create_command ("FlyWithLua/LUARP_COMMAND_NAV_KHZ_DN", "dpwn the selected stby nav freq khz", "LUARP_COMMAND_NAV_KHZ_DN()", "", "")






