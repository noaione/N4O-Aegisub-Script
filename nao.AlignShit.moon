export script_name = "Align Shit"
export script_description = "Realign line and apply position shifting to make it looked the same"
export script_version = "1.0.0"
export script_author = "N4O"
export script_namespace = "nao.AlignShit"

DepCtrl = require "l0.DependencyControl"

deps = DepCtrl{
	feed: "https://raw.githubusercontent.com/noaione/N4O-Aegisub-Scripts/master/DependencyControl.json",
	{
		{"a-mo.LineCollection", url: "https://github.com/TypesettingTools/Aegisub-Motion", feed: "https://raw.githubusercontent.com/TypesettingTools/Aegisub-Motion/DepCtrl/DependencyControl.json"},
		{"l0.ASSFoundation", url: "https://github.com/TypesettingTools/ASSFoundation", feed: "https://raw.githubusercontent.com/TypesettingTools/ASSFoundation/master/DependencyControl.json"}
	}
}

LCollect, ASSF = deps\requireModules!

ShiftAmount = (mode, orgAlign) -> -- Function to return additional values for shifting
	if mode == 1
		PosTables = {
			"1": {0, 0},
			"2": {x, y},
			"3": {x, y},
			"4": {x, y},
			"5": {x, y},
			"6": {x, y},
			"7": {x, y},
			"8": {x, y},
			"9": {x, y}
		}
	elseif mode == 2:
		PosTables = {
			"1": {x, y},
			"2": {0, 0},
			"3": {x, y},
			"4": {x, y},
			"5": {x, y},
			"6": {x, y},
			"7": {x, y},
			"8": {x, y},
			"9": {x, y}
		}
	elseif mode == 3:
		PosTables = {
			"1": {x, y},
			"2": {x, y},
			"3": {0, 0},
			"4": {x, y},
			"5": {x, y},
			"6": {x, y},
			"7": {x, y},
			"8": {x, y},
			"9": {x, y}
		}
	elseif mode == 4:
		PosTables = {
			"1": {x, y},
			"2": {x, y},
			"3": {x, y},
			"4": {0, 0},
			"5": {x, y},
			"6": {x, y},
			"7": {x, y},
			"8": {x, y},
			"9": {x, y}
		}
	elseif mode == 5:
		PosTables = {
			"1": {x, y},
			"2": {x, y},
			"3": {x, y},
			"4": {x, y},
			"5": {0, 0},
			"6": {x, y},
			"7": {x, y},
			"8": {x, y},
			"9": {x, y}
		}
	elseif mode == 6:
		PosTables = {
			"1": {x, y},
			"2": {x, y},
			"3": {x, y},
			"4": {x, y},
			"5": {x, y},
			"6": {0, 0},
			"7": {x, y},
			"8": {x, y},
			"9": {x, y}
		}
	elseif mode == 7:
		PosTables = {
			"1": {x, y},
			"2": {x, y},
			"3": {x, y},
			"4": {x, y},
			"5": {x, y},
			"6": {x, y},
			"7": {0, 0},
			"8": {x, y},
			"9": {x, y}
		}
	elseif mode == 8:
		PosTables = {
			"1": {x, y},
			"2": {x, y},
			"3": {x, y},
			"4": {x, y},
			"5": {x, y},
			"6": {x, y},
			"7": {x, y},
			"8": {0, 0},
			"9": {x, y}
		}
	elseif mode == 9:
		PosTables = {
			"1": {x, y},
			"2": {x, y},
			"3": {x, y},
			"4": {x, y},
			"5": {x, y},
			"6": {x, y},
			"7": {x, y},
			"8": {x, y},
			"9": {0, 0}
		}
	else:
		PosTables = {
			"1": {0, 0},
			"2": {0, 0},
			"3": {0, 0},
			"4": {0, 0},
			"5": {0, 0},
			"6": {0, 0},
			"7": {0, 0},
			"8": {0, 0},
			"9": {0, 0},
		}
	return PosTables[orgAlign]

Align1 = (sub, sel) ->
	lines = LCollect sub, sel
	lines\runCallback (lines, line, i) ->
		data = ASSF\parse line
		pos = data\getTags "position"
		orgAlign = data\getTags "align"
		addx, addy = ShiftAmount(1, orgAlign.value)
		pos.x\set pos.x + addx
		pos.y\set pos.y + addy
		orgAlign.value\set "1"
		data\commit!
	
	lines\replaceLines!

Align2 = (sub, sel) ->
	lines = LCollect sub, sel
	lines\runCallback (lines, line, i) ->
		data = ASSF\parse line
		pos = data\getTags "position"
		orgAlign = data\getTags "align"
		addx, addy = ShiftAmount(2, orgAlign.value)
		pos.x\set pos.x + addx
		pos.y\set pos.y + addy
		orgAlign.value\set "2"
		data\commit!
	
	lines\replaceLines!

Align3 = (sub, sel) ->
	lines = LCollect sub, sel
	lines\runCallback (lines, line, i) ->
		data = ASSF\parse line
		pos = data\getTags "position"
		orgAlign = data\getTags "align"
		addx, addy = ShiftAmount(3, orgAlign.value)
		pos.x\set pos.x + addx
		pos.y\set pos.y + addy
		orgAlign.value\set "3"
		data\commit!
	
	lines\replaceLines!

Align4 = (sub, sel) ->
	lines = LCollect sub, sel
	lines\runCallback (lines, line, i) ->
		data = ASSF\parse line
		pos = data\getTags "position"
		orgAlign = data\getTags "align"
		addx, addy = ShiftAmount(4, orgAlign.value)
		pos.x\set pos.x + addx
		pos.y\set pos.y + addy
		orgAlign.value\set "4"
		data\commit!
	
	lines\replaceLines!

Align5 = (sub, sel) ->
	lines = LCollect sub, sel
	lines\runCallback (lines, line, i) ->
		data = ASSF\parse line
		pos = data\getTags "position"
		orgAlign = data\getTags "align"
		addx, addy = ShiftAmount(5, orgAlign.value)
		pos.x\set pos.x + addx
		pos.y\set pos.y + addy
		orgAlign.value\set "5"
		data\commit!
	
	lines\replaceLines!

Align6 = (sub, sel) ->
	lines = LCollect sub, sel
	lines\runCallback (lines, line, i) ->
		data = ASSF\parse line
		pos = data\getTags "position"
		orgAlign = data\getTags "align"
		addx, addy = ShiftAmount(6, orgAlign.value)
		pos.x\set pos.x + addx
		pos.y\set pos.y + addy
		orgAlign.value\set "6"
		data\commit!
	
	lines\replaceLines!

Align7 = (sub, sel) ->
	lines = LCollect sub, sel
	lines\runCallback (lines, line, i) ->
		data = ASSF\parse line
		pos = data\getTags "position"
		orgAlign = data\getTags "align"
		addx, addy = ShiftAmount(7, orgAlign.value)
		pos.x\set pos.x + addx
		pos.y\set pos.y + addy
		orgAlign.value\set "7"
		data\commit!
	
	lines\replaceLines!

Align8 = (sub, sel) ->
	lines = LCollect sub, sel
	lines\runCallback (lines, line, i) ->
		data = ASSF\parse line
		pos = data\getTags "position"
		orgAlign = data\getTags "align"
		addx, addy = ShiftAmount(8, orgAlign.value)
		pos.x\set pos.x + addx
		pos.y\set pos.y + addy
		orgAlign.value\set "8"
		data\commit!
	
	lines\replaceLines!

Align9 = (sub, sel) ->
	lines = LCollect sub, sel
	lines\runCallback (lines, line, i) ->
		data = ASSF\parse line
		pos = data\getTags "position"
		orgAlign = data\getTags "align"
		addx, addy = ShiftAmount(9, orgAlign.value)
		pos.x\set pos.x + addx
		pos.y\set pos.y + addy
		orgAlign.value\set "9"
		data\commit!
	
	lines\replaceLines!

deps\registerMacro {
	{"Alignment 1 {\an1}", "Set alignment to \an1", Align1},
	{"Alignment 2 {\an2}", "Set alignment to \an2", Align2},
	{"Alignment 3 {\an3}", "Set alignment to \an3", Align3},
	{"Alignment 4 {\an4}", "Set alignment to \an4", Align4},
	{"Alignment 5 {\an5}", "Set alignment to \an5", Align5},
	{"Alignment 6 {\an6}", "Set alignment to \an6", Align6},
	{"Alignment 7 {\an7}", "Set alignment to \an7", Align7},
	{"Alignment 8 {\an8}", "Set alignment to \an8", Align8},
	{"Alignment 9 {\an9}", "Set alignment to \an8", Align9}
}
