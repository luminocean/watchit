// var matchingPath = '{{WATCHING_PATH}}';
var modifiedTime = '{{MODIFIED_TIME}}';
// alert('Hi this is from the auto-refresh script!')

var xhr = new XMLHttpRequest();
xhr.addEventListener("load", function(){
	var mtime = JSON.parse(this.responseText).mtime;
	if( mtime !== modifiedTime ){
		location.reload();
	}
});

document.addEventListener("visibilitychange", function handleVisibilityChange() {
	if(document.hidden) return;

	xhr.open("GET", "/mtime");
	xhr.send();
}, false);
