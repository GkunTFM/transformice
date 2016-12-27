function yaru(){
	var text = ta.value;
	text = text.replace(/(Y=")(.+?)(")/g, convertY);
	text = text.replace(/( P="[^"]*?,[^"]*?,[^"]*?,[^"]*?,)([^"]*?)([",])/g, convertAngle);
	text = text.replace(/(<O [^>]*? P=")(.*?)([",])/g, repOAngle);
	text = text.replace(/(P[1234]=".*?,)(.*?)(")/g, convertJointP);
	text = text.replace(/(MV=".*?,)(.*?)(")/g, convertJointMV);
	ta.value = text;
}

function convertY(all, g1, g2, g3){
	var num = Number(g2);
	return g1 + (400 - num + 20).toString() + g3;
}

function convertAngle(all, g1, g2, g3){
	var num = Number(g2);
	console.log(all);
	return g1 + (-num).toString() + g3;
}

function convertJointP(all, g1, g2, g3){
	var num = Number(g2);
	console.log(all,g2,num);
	return g1 + (400 - num + 20).toString() + g3;
}

function convertJointMV(all, g1, g2, g3){
	var num = Number(g2);
	return g1 + (-num).toString() + g3;
}

function repOAngle(all, g1, g2, g3){
	var num = Number(g2);
	return g1 + (-num).toString() + g3;
}

(function (argument) {
	// body...
	window.ta = document.createElement("textarea");
	ta.style.width = 500;
	ta.style.height = 300;
	document.body.appendChild(ta);
	var bt = document.createElement("input");
	bt.type = "button";
	bt.onclick = yaru;
	bt.value = "do";
	document.body.appendChild(bt);
})();