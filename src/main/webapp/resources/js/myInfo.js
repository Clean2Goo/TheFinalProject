function fn_passChange() {
	
	var w = window.screen.width/2 - 200;
	var h = window.screen.height/2 - 150;
	var url = contextPath + "/myPage/modPwd.do";

	window.open(url, "modPwd", "width=400, height=300, left="+w+", top="+h);
}