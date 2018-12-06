-----------------------------------------------------------------------------------------------------------------------
--                                               Desktop widgets config                                              --
-----------------------------------------------------------------------------------------------------------------------

-- Grab environment
local beautiful = require("beautiful")
local awful = require("awful")
local redflat = require("redflat")

-- Initialize tables and vars for module
-----------------------------------------------------------------------------------------------------------------------
local desktop = {}

-- desktop aliases
local wgeometry = redflat.util.desktop.wgeometry
local workarea = screen[mouse.screen].workarea
local system = redflat.system

-- Desktop widgets
-----------------------------------------------------------------------------------------------------------------------
function desktop:init(args)
	if not beautiful.desktop then return end

	local args = args or {}
	local env = args.env

	-- placement
	local grid = beautiful.desktop.grid
	local places = beautiful.desktop.places

	-- Network speed
	--------------------------------------------------------------------------------
	local netspeed = { geometry = wgeometry(grid, places.netspeed, workarea) }

	netspeed.args = {
		interface    = "wlp60s0",
		maxspeed     = { up = 6*1024^2, down = 6*1024^2 },
		crit         = { up = 6*1024^2, down = 6*1024^2 },
		timeout      = 2,
		autoscale    = false
	}

	netspeed.style  = {}

	-- SSD speed
	--------------------------------------------------------------------------------
	local ssdspeed = { geometry = wgeometry(grid, places.ssdspeed, workarea) }

	ssdspeed.args = {
		interface = "sda",
		meter_function = system.disk_speed,
		timeout   = 2,
		label     = "SOLID DRIVE"
	}

	ssdspeed.style = {
		unit   = { { "B", -1 }, { "KB", 2 }, { "MB", 2048 } },
	}

	-- CPU and memory usage
	--------------------------------------------------------------------------------
	local cpu_storage = { cpu_total = {}, cpu_active = {} }
	local cpumem = { geometry = wgeometry(grid, places.cpumem, workarea) }

	cpumem.args = {
		corners = { num = 8, maxm = 100, crit = 90 },
		lines   = { { maxm = 100, crit = 80 }, { maxm = 100, crit = 80 } },
		meter   = { args = cpu_storage },
		timeout = 2
	}

	cpumem.style = {}

	-- Disks
	--------------------------------------------------------------------------------
	local disks = { geometry = wgeometry(grid, places.disks, workarea) }

	disks.args = {
		sensors  = {
			{ meter_function = system.fs_info, maxm = 100, crit = 80, args = "/" },
		},
		names   = {"root"},
		timeout = 300
	}

	disks.style = {
		unit      = { { "KB", 1 }, { "MB", 1024^1 }, { "GB", 1024^2 } },
		show_text = false
	}

	-- Temperature indicator
	--------------------------------------------------------------------------------
	local thermal = { geometry = wgeometry(grid, places.thermal, workarea) }

	thermal.args = {
		sensors = {
			{ meter_function = system.thermal.sensors, args = "'Package id 0'", maxm = 100, crit = 75 },
			{ meter_function = system.thermal.hddtemp, args = { disk = "/dev/sda" }, maxm = 60, crit = 45 },
			{ meter_function = system.thermal.nvoptimus, maxm = 105, crit = 80 }
		},
		names   = { "cpu", "ssd", "gpu" },
		timeout = 5
	}

	thermal.style = {
		unit      = { { "°C", -1 } },
	}

	-- Initialize all desktop widgets
	--------------------------------------------------------------------------------
	netspeed.widget = redflat.desktop.speedgraph(netspeed.args, netspeed.geometry, netspeed.style)
	ssdspeed.widget = redflat.desktop.speedgraph(ssdspeed.args, ssdspeed.geometry, ssdspeed.style)
	cpumem.widget = redflat.desktop.multim(cpumem.args, cpumem.geometry, cpumem.style)
	disks.widget = redflat.desktop.dashpack(disks.args, disks.geometry, disks.style)
	thermal.widget = redflat.desktop.simpleline(thermal.args, thermal.geometry, thermal.style)
end

-- End
-----------------------------------------------------------------------------------------------------------------------
return desktop
