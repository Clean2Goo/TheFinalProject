$(document).ready(function () {
	let typeItTitle = new TypeIt("#typeItTitle", {
		speed: 100,
		startDelay: 1000,
	})
		.type("", { delay: 4000 })
		.delete(13, { delay: 50 })
		.type("가고 싶은 세차장을 검색하세요!")
		.go();
});
