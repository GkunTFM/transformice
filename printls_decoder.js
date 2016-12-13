function decodePrintls(input){
	input = input.replace(/[\s\S]*(!s1;)/, "$1");
	var output = "";
	var i;
	var mt;
	var reg;
	console.log(input);
	for(i = 1; ; i++){
		reg = new RegExp("!s" + i + ";([\\S\\s]*?)!e" + i + ";");
		mt = input.match(reg);
		if(mt) {
			output += mt[1];
		} else {
			break;
		}
	}
	if(i == 1) output = input;
	return output;
}

function showUI(){
	var ta = document.createElement("textarea");
	ta.style.height = 200;
	ta.style.width = 300;
	document.body.appendChild(ta);
	var button = document.createElement("input");
	button.type = "button";
	button.value = "decode printls string";
	button.onclick = function(){ta.value = decodePrintls(ta.value);};
	document.body.appendChild(button);
}