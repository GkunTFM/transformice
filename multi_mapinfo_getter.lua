USER = "Jorougumo"; --You dont need to set your name here if you are the only one player in the room
MAPS = [[
@3599383
@3600555
@3600733
@3614164
@3617459
@3636374
@3637352
@3643600
@3674887
@3675618
@3681317
@3687060
@3688472
@3699061
@3703628
@3710589
@3719719
@3720804
@3728061
@3731755
@3755513
@3760738
@3776347
@3784796
@3799806
@3804339
@3820670
@3862824
@3866466
@3883654
@3902671
@3917927
@3932849
@3950493
@3996892
@3997083
@3997117
@3999440
@4007168
@4011152
@4051197
@4087743
@4101389
@4119238
@4127339
@4137538
@4140146
@4141157
@4240091
@4276657
@4299790
@4367103
@4372661
@4386389
@4530334
@4607919
@4623148
@4679741
@4696193
@4697945
@4767239
@4806524
@4867835
@4872938
@4903937
@4961414
@5002429
@5186430
@5202179
@5313515
@5641135
@5694962
@5695410
@5716547
@5806780
@5829289
@5959104
@6041390
@6244020
@6331030
@6486258
@6498877
@6550895
@6605376
@6622959
@6635900
@6643104
@6653578
@6670454
@6679785
@6684466
@6686402
@6686413
@6687837
@6693861
@6721429
@6724625
@6724642
@6730173
@6730701
@6730731
@6737870
@6737909
@6738000
@6784209
@6785167
@6802803
@6819779
@6828975
@6834168
@6841940
@6843217
@6843340
@6853775
@6858385
@6860151
@6860365
@6860881
@6863885
@6870073
@6870236
@6878899
@6888926
@6892496
@6894757
@6894763
@6894779
@6907209
]];


---------------------------------------------------------------
printls = {
	BLOCKSIZE = 15,

	strings = {},
	index = 1,

	outputBlocks =
		function ()
			if printls.index <= #(printls.strings) then
				local min = printls.index;
				local max = math.min(min + printls.BLOCKSIZE - 1, #(printls.strings));
				for i = min, max do
					print(("!s%s;%s!e%s;"):format(i, printls.strings[i], i));
				end
				printls.index = max + 1;
			else
				print("nothing to print");
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
	print("here");
	if name == USER and code == ("N"):byte() then
		printls.outputBlocks();
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