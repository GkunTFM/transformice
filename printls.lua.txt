--[[

This module "printls" is to output a big size text by calling "print()" multiple times. print() can output up to 5000 letters on one call. So this module is useful when you need to print a longer text.

Author: Gekkeiju
Last Update: 2016/12/15

printls.setString(text)
	reserves a text to output. the text is divided into blocks and you can output the blocks by calling outputNextBlock.
	- arguments
		text: the string you want to output

printls.outputNextBlock()
	outputs the next block.
	- return
		true: a block was printed.
		false: no block was waiting to be printed.

the decoder to convert the printed string into the original string is here
https://gkuntfm.github.io/transformice/printls_decoder.js
]]

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