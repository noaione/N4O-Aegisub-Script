script_name         = "Align Shit"
script_description  = "Realign line and apply position shifting to make it looked the same"
script_version      = "1.0.0"
script_author       = "N4O"
script_namespace    = "nao.AlignShit"

local haveDepCtrl,DependencyControl,depRec=pcall(require,"l0.DependencyControl")
if haveDepCtrl then
	script_version="1.0.0"
	depRec=DependencyControl{feed="https://raw.githubusercontent.com/noaione/N4O-Aegisub-Scripts/master/DependencyControl.json"}
end

re = require 'aegisub.re'

function ResizeNumber(resx, resy, posx, posy)
    if resy == 1080 then
      return posx, posy
    elseif resy ~= 1080 then
      posy = posy * (resy / 1080)
      posx = posx * (resx / 1920)
      return posx, posy
    end
end

function UnpackTable(PosTables, orgAlign)
	do
		local obj = PosTables[orgAlign]
		first, second = obj[1], obj[2]
	end
	return first, second
end

function ShiftAmount(mode, orgAlign)
    if mode == 1 then
        PosTables = {
            ["1"] = {0, 0},
            ["2"] = {-108.5, 0},
            ["3"] = {-216.5, 0},
            ["4"] = {0, 75},
            ["5"] = {-108.5, 75},
            ["6"] = {-216.5, 75},
            ["7"] = {0, 150},
            ["8"] = {-108.5, 150},
            ["9"] = {-216.5, 150}
        }
		return UnpackTable(PosTables, orgAlign)
    elseif mode == 2 then
        PosTables = {
            ["1"] = {108.5, 0},
            ["2"] = {0, 0},
            ["3"] = {-108.5, 0},
            ["4"] = {108.5, 75},
            ["5"] = {0, 75},
            ["6"] = {-108.5, 75},
            ["7"] = {108.5, 150},
            ["8"] = {0, 150},
            ["9"] = {-108.5, 150}
        }
        return UnpackTable(PosTables, orgAlign)
    elseif mode == 3 then
        PosTables = {
            ["1"] = {216.5, 0},
            ["2"] = {108.5, 0},
            ["3"] = {0, 0},
            ["4"] = {216.5, 75},
            ["5"] = {108.5, 75},
            ["6"] = {0, 75},
            ["7"] = {216.5, 150},
            ["8"] = {108.5, 150},
            ["9"] = {0, 150}
        }
        return UnpackTable(PosTables, orgAlign)
    else
        PosTables = {
            ["1"] = {0, 0},
            ["2"] = {0, 0},
            ["3"] = {0, 0},
            ["4"] = {0, 0},
            ["5"] = {0, 0},
            ["6"] = {0, 0},
            ["7"] = {0, 0},
            ["8"] = {0, 0},
            ["9"] = {0, 0}
        }
		return UnpackTable(PosTables, orgAlign)
    end
end

function Align1(subs, sel)
    xres, yres, ar, artype = aegisub.video_size()
    if yres == nil then
        aegisub.log('ERROR: Please provide video for calculation later')
        aegisub.cancel()
    end
    for z,i in ipairs(sel) do
        line=subs[i]
        text=line.text
		if text ~= '' then -- Skip empty line
			align = text:match'\\an(%d)'
			shiftx, shifty = ShiftAmount(1, align)
			px, py = ResizeNumber(xres, yres, shiftx, shifty)
			oldx, oldy = text:match("\\pos%(([%d%.%-]+),([%d%.%-]+)")
			newx = oldx + px
			newy = oldy + py
			
			newline = text:gsub("\\pos%(([%d%.%-]+),([%d%.%-]+)", "\\pos(".. newx .. "," .. newy):gsub("\\an(%d)", "\\an1")
			line.text = newline
		end
		subs[i] = line
    end
end

function Align2(subs, sel)
    xres, yres, ar, artype = aegisub.video_size()
    if yres == nil then
        aegisub.log('ERROR: Please provide video for calculation later')
        aegisub.cancel()
    end
    for z,i in ipairs(sel) do
        line=subs[i]
        text=line.text
		if text ~= '' then -- Skip empty line
			align = text:match'\\an(%d)'
			shiftx, shifty = ShiftAmount(2, align)
			px, py = ResizeNumber(xres, yres, shiftx, shifty)
			oldx, oldy = text:match("\\pos%(([%d%.%-]+),([%d%.%-]+)")
			newx = oldx + px
			newy = oldy + py
			
			newline = text:gsub("\\pos%(([%d%.%-]+),([%d%.%-]+)", "\\pos(".. newx .. "," .. newy):gsub("\\an(%d)", "\\an2")
			line.text = newline
		end
		subs[i] = line
    end
end

function Align3(subs, sel)
    xres, yres, ar, artype = aegisub.video_size()
    if yres == nil then
        aegisub.log('ERROR: Please provide video for calculation later')
        aegisub.cancel()
    end
    for z,i in ipairs(sel) do
        line=subs[i]
        text=line.text
		if text ~= '' then -- Skip empty line
			align = text:match'\\an(%d)'
			shiftx, shifty = ShiftAmount(3, align)
			px, py = ResizeNumber(xres, yres, shiftx, shifty)
			oldx, oldy = text:match("\\pos%(([%d%.%-]+),([%d%.%-]+)")
			newx = oldx + px
			newy = oldy + py
			
			newline = text:gsub("\\pos%(([%d%.%-]+),([%d%.%-]+)", "\\pos(".. newx .. "," .. newy):gsub("\\an(%d)", "\\an3")
			line.text = newline
		end
		subs[i] = line
    end
end

if haveDepCtrl then
    depRec:registerMacros({
    {"Align Shit/Alignment 1 {\\an1}", "Set alignment to \\an1", Align1},
    {"Align Shit/Alignment 2 {\\an2}", "Set alignment to \\an2", Align2},
    {"Align Shit/Alignment 3 {\\an3}", "Set alignment to \\an3", Align3}},
    false)
else
    aegisub.register_macro("Align Shit/Alignment 1 {\\an1}", "Set alignment to \\an1", Align1)
    aegisub.register_macro("Align Shit/Alignment 2 {\\an2}", "Set alignment to \\an2", Align2)
    aegisub.register_macro("Align Shit/Alignment 3 {\\an3}", "Set alignment to \\an3", Align3)
end