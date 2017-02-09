/*
function eventFileLoaded(i,c)
	printls.setString(c)
	printls.outputNextBlock(c)
end

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
system.loadFile(1)

*/



table64 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+-";
function tonum(str){
	var num = 0;
	for(var i = 0; i < str.length; i++){
		num = num * 64 + table64.indexOf(str.charAt(i));
	}
	return num;
}

function makeGradesArray(strArray){
	var a = [];
	for(var i = 0; i < strArray.length; i++){
		var s = strArray[i].match(/!(.+)/);
		if(s) s = s[1];
		else s = "0000000";
		var code = strArray[i].match(/([^!]+)/);
		if(code) code = code[1];
		else continue;
		var b = [code, tonum(s.slice(0,2))/4096, tonum(s.slice(2,4))/4096, tonum(s.slice(4,6))/4096*0.25, tonum(s.slice(6))];
		a.push(b);
		var w = 1/(1 - Math.pow(0.95, b[4]));
		b[1] *= w * 100;
		b[2] *= w * 100;
		b[3] = Math.sqrt(b[3]) * w * 100;
	}
	return a;
}

function output(a, diff){
	window.ary = a;
	if(!window.b){
		window.b = document.createElement("textarea");
		b.style.height = 600;
		b.style.width = 400;
		document.body.appendChild(b);
	}
	var str = [];
	for (var i = 0; i < a.length; i++){
		str.push("\t" + a[i].join("\t"));
	}
	str = "diff " + diff + str.join("\n") + "\n";
	b.value = b.value + str;
}

if(!window.ta) {
	ta = document.createElement("textarea");
	ta.style.width = 400;
	ta.style.height = 600;
	document.body.appendChild(ta);
}

function decodePrintls(input){
	input = input.replace(/[\s\S]*(!s1;)/, "$1");
	var output = "";
	var i;
	var mt;
	var reg;
	for(i = 1; ; i++){
		reg = new RegExp("!s" + i + ";([\\S\\s]*?)!e" + i + ";");
		mt = input.match(reg);
		if(mt) {
			output += mt[1];
		} else {
			break;
		}
	}
	if(i == 1){
		if(input.match(/!s\d+;/)) output = "Error : The first print block is missing";
		else output = input;
	}
	return output;
}

function yaru(){
	var str = ta.value;
	str = decodePrintls(str);
	var strs = str.split("\n");
	var items = [];
	for(var i = 0; i < strs.length; i++){
		if(strs[i].match("[^ ]+")) items[strs[i].match("[^ ]+")[0]] = strs[i].match("[^ ]+[ ]*(.+)")[1];
	}
	for(var i = 1; i <= 7; i++){
		var lb = "map" + i;
		var a = makeGradesArray(items[lb].split(/ +/));
		output(a, i);
	}
}