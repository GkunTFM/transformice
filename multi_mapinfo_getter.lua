USER = "Jorougumo"; --You dont need to set your name here if you are the only one player in the room
MAPS = [[
paste map codes here

]];


---------------------------------------------------------------

printls = {
	BLOCKSIZE = 30,

	strings = {},
	index = 1,

	outputNextBlock =
		function ()
			if printls.index <= #(printls.strings) then
				local min = printls.index;
				local max = math.min(min + printls.BLOCKSIZE - 1, #(printls.strings));
				for i = min, max do
					print(("!s%s;%s!e%s;"):format(i, printls.strings[i], i));
				end
				printls.index = max + 1;
				return true;
			else
				print("nothing to print");
				return false;
			end
		end,
	setString =
		function (str)
			str = str:gsub("<", "&lt;");
			printls.strings = {};

			local temstr;
			local amp = nil;
			local ind = 1;
			local sublen;
			local len = str:len();
			while ind <= len do
				temstr = str:sub(ind, ind + 4500 - 1);
				for i = 1,3 do
					if temstr:sub(-i,-i) == "&" then
						temstr = temstr:sub(1, -i-1);
						break;
					end
				end
				sublen = temstr:len();
				table.insert(printls.strings, temstr);
				ind = ind + sublen;
			end
			printls.index = 1;
			print(("ready to print %s string blocks in %s steps"):format(#(printls.strings), math.ceil(#(printls.strings) / printls.BLOCKSIZE)));
		end
};

function init(s)
	maps = {};
	for a in string.gmatch(s, "@(%d+)") do
		if tonumber(a) then
			table.insert(maps, tonumber(a))
		end
	end
	mindex = 1;
	last = os.time();
	print(#maps * 3.5);
end

function eventNewGame()
	if maps then
		last = os.time();
		local info = tfm.get.room.xmlMapInfo;
		local wind, gravity, noBalloon, opportunist;
		local xml = info.xml;
		local ptag = string.match(xml, "(<P .-/>)");
		if ptag then
			wind, gravity = string.match(ptag, "G%s*=%s*\"(.-),%s*(.-)\"");
			noBalloon = string.match(ptag, [[DIVINITYNOBALLOON%s*=%s*""]]) and "no_balloon " or "";
			opportunist = string.match(ptag, [[DIVINITYOPPORTUNIST%s*=%s*""]]) and "opportunist " or "";
		end
		info.wind, info.gravity = wind or 0, gravity or 10;
		info.divconf = noBalloon .. opportunist;
		local a = {"mapCode", "author", "permCode", "gravity", "wind", "divconf", "xml"};
		str = str or "";
		for i, v in ipairs(a) do
			str = str .. info[v] .. "	";
		end
		str = str .. "\n";
		print("loaded:"..info.mapCode);
		if info.mapCode == maps[#maps] then
			printls.setString(str);
			maps = nil;
		end
	end
end

function eventLoop()
	if last and os.difftime(os.time(), last) >= 3500 and maps and maps[mindex] then
		tfm.exec.newGame(maps[mindex]);
		print("load:"..maps[mindex]);
		mindex = mindex + 1;
		last = nil;
	end
end

function eventKeyboard(name, code)
	if name == USER and code == ("N"):byte() then
		printls.outputNextBlock();
	end
end

if not tfm.get.room.playerList[USER] then
	for n, p in pairs(tfm.get.room.playerList) do
		USER = n;
		break;
	end
end
tfm.exec.disableAutoNewGame()
system.bindKeyboard(USER, ("N"):byte(), true, true);

init(MAPS);

--[[
the decoder to turn the printed string into the original string is here
https://gkuntfm.github.io/transformice/printls_decoder.js
]]