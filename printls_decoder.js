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

function showUI(){
	var div = document.createElement("div");
	div.innerHTML = '<textarea id="printls_textarea" style="width: 600px;height: 300px"></textarea><br/><input type="button" value="extract the original text" id="printls_button" />';
	document.body.insertBefore(div, document.body.firstChild);
	document.getElementById("printls_button").onclick =
		function(){
			var ta = document.getElementById("printls_textarea");
			ta.value = decodePrintls(ta.value);
		};
}