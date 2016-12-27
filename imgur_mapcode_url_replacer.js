//http://imgur.com/a/PI3vT
//excute this script on the album page
(function showUI(){
	var ta = document.createElement("textarea");
	ta.style.height = '400px';
	ta.style.width = '600px';
	document.body.insertBefore(ta, document.body.firstChild);
	var button = document.createElement("input");
	button.type = "button";
	button.value = "excute";
	button.onclick = function(){
		var imgs = _widgetFactory._.config.gallery.image.album_images.images;
		var data = [];
		var str = ta.value;
		var img;
		for(var i = 0; i < imgs.length; i++){
			img = imgs[i];
			str = str.replace(img.name, "http://i.imgur.com/" + img.hash + img.ext);
		}
		ta.value = str;
		console.log("done");
	};
	document.body.insertBefore(button, document.body.firstChild);
})();