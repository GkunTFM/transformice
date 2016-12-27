USER = "Jorougumo"; --You dont need to set your name here if you are the only one player in the room
MAPS = [[
Gekkeiju's maps: 87
Gekkeiju - @5694962 - 0 - 100% - P41
Gekkeiju - @5694980 - 0 - 100% - P22
Gekkeiju - @5695410 - 0 - 100% - P41
Gekkeiju - @5695427 - 0 - 100% - P22
Gekkeiju - @5716547 - 0 - 100% - P41
Gekkeiju - @5733084 - 0 - 100% - P22
Gekkeiju - @5829289 - 0 - 100% - P41
Gekkeiju - @6244020 - 0 - 100% - P41
Gekkeiju - @6368567 - 0 - 100% - P22
Gekkeiju - @6913862 - 0 - 100% - P22
Gekkeiju - @6574116 - 47 - 40% - P0
Gekkeiju - @6574667 - 0 - 100% - P22
Gekkeiju - @6581603 - 0 - 100% - P22
Gekkeiju - @6582797 - 0 - 100% - P22
Gekkeiju - @6604651 - 0 - 100% - P22
Gekkeiju - @6605376 - 0 - 100% - P41
Gekkeiju - @6635900 - 0 - 100% - P41
Gekkeiju - @6653555 - 0 - 100% - P22
Gekkeiju - @6653578 - 0 - 100% - P41
Gekkeiju - @6684466 - 0 - 100% - P41
Gekkeiju - @6686402 - 0 - 100% - P41
Gekkeiju - @6686413 - 0 - 100% - P41
Gekkeiju - @6686810 - 0 - 100% - P22
Gekkeiju - @6691121 - 0 - 100% - P22
Gekkeiju - @6693861 - 0 - 100% - P22
Gekkeiju - @6730173 - 0 - 100% - P41
Gekkeiju - @6730701 - 0 - 100% - P41
Gekkeiju - @6730731 - 0 - 100% - P41
Gekkeiju - @6736502 - 0 - 100% - P22
Gekkeiju - @6737461 - 0 - 100% - P22
Gekkeiju - @6737870 - 0 - 100% - P41
Gekkeiju - @6737909 - 0 - 100% - P41
Gekkeiju - @6738000 - 0 - 100% - P41
Gekkeiju - @6771624 - 0 - 100% - P22
Gekkeiju - @6774476 - 0 - 100% - P22
Gekkeiju - @6775910 - 0 - 100% - P22
Gekkeiju - @6776281 - 0 - 100% - P22
Gekkeiju - @6776335 - 0 - 100% - P22
Gekkeiju - @6816487 - 0 - 100% - P22
Gekkeiju - @6841940 - 0 - 100% - P41
Gekkeiju - @6842869 - 0 - 100% - P22
Gekkeiju - @6843217 - 0 - 100% - P41
Gekkeiju - @6843340 - 0 - 100% - P41
Gekkeiju - @6851343 - 0 - 100% - P22
Gekkeiju - @6851415 - 0 - 100% - P22
Gekkeiju - @6852961 - 0 - 100% - P22
Gekkeiju - @6853775 - 0 - 100% - P22
Gekkeiju - @6856678 - 0 - 100% - P22
Gekkeiju - @6961360 - 0 - 100% - P22
Gekkeiju - @6857260 - 0 - 100% - P22
Gekkeiju - @6857328 - 0 - 100% - P22
Gekkeiju - @6858385 - 0 - 100% - P22
Gekkeiju - @6859346 - 0 - 100% - P22
Gekkeiju - @6865557 - 0 - 100% - P22
Gekkeiju - @6869118 - 0 - 100% - P22
Gekkeiju - @6869130 - 0 - 100% - P22
Gekkeiju - @6870029 - 0 - 100% - P22
Gekkeiju - @6870011 - 0 - 100% - P22
Gekkeiju - @6870073 - 0 - 100% - P41
Gekkeiju - @6870236 - 0 - 100% - P22
Gekkeiju - @6876955 - 0 - 100% - P22
Gekkeiju - @6878899 - 0 - 100% - P41
Gekkeiju - @6878917 - 0 - 100% - P22
Gekkeiju - @6885540 - 0 - 100% - P22
Gekkeiju - @6888926 - 0 - 100% - P41
Gekkeiju - @6892496 - 0 - 100% - P41
Gekkeiju - @6892590 - 0 - 100% - P22
Gekkeiju - @6894757 - 0 - 100% - P41
Gekkeiju - @6894763 - 0 - 100% - P41
Gekkeiju - @6894779 - 0 - 100% - P41
Gekkeiju - @6895996 - 0 - 100% - P22
Gekkeiju - @6897589 - 0 - 100% - P22
Gekkeiju - @6908547 - 0 - 100% - P22
Gekkeiju - @6908595 - 0 - 100% - P22
Gekkeiju - @6908598 - 0 - 100% - P22
Gekkeiju - @6912093 - 0 - 100% - P22
Gekkeiju - @6917520 - 0 - 100% - P22
Gekkeiju - @6920141 - 0 - 100% - P22
Gekkeiju - @6920148 - 0 - 100% - P22
Gekkeiju - @6920151 - 0 - 100% - P22
Gekkeiju - @6920160 - 0 - 100% - P22
Gekkeiju - @6928638 - 0 - 100% - P22
Gekkeiju - @6928836 - 0 - 100% - P22
Gekkeiju - @6928849 - 0 - 100% - P22
Gekkeiju - @6943100 - 0 - 100% - P22
Gekkeiju - @6964674 - 0 - 100% - P22
Gekkeiju - @6970905 - 0 - 100% - P22
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
			opportunist = string.match(ptag, [[DIIVNITYOPPORTUNIST%s*=%s*""]]) and "opportunist " or "";
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