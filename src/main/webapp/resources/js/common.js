let _device = {};

// 즉시실행 IIFE
(function ($) {
	_device = {
		isMobile: false,
		isAndroid: false,
		isiOS: false,
		hasNotch: false,
		isiOSChrome: false,
		isTablet: false,
		isNotPC: false,
		isChrome: false,
		isEdge: false,
		isEdgeChromium: false,
		isFirefox: false,
		isIE: false,
		isOpera: false,
		isSafari: false,
		isMac: false,
		winW: 0,
		winH: 0,
	};
	// platform & browser detection
	const ua = navigator.userAgent.toLowerCase();
	if (
		/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(ua) ||
		/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(
			ua.substr(0, 4)
		)
	) {
		_device.isMobile = true;
		_device.isAndroid = ua.indexOf("android") > -1;
		_device.isiOS = /iPhone/.test(navigator.userAgent) && !window.MSStream;
		const aspect = window.screen.width / window.screen.height;
		_device.hasNotch = _device.isiOS && aspect.toFixed(3) === "0.462";
		_device.isiOSChrome = navigator.userAgent.match("CriOS");
		_device.isTablet = /(ipad|tablet|(android(?!.*mobile))|(windows(?!.*phone)(.*touch))|kindle|playbook|silk|(puffin(?!.*(IP|AP|WP))))/.test(ua);
	} else {
		_device.isChrome = !!window.chrome && (!!window.chrome.webstore || !!window.chrome.runtime);
		_device.isEdge = !_device.isIE && !!window.StyleMedia;
		_device.isEdgeChromium = _device.isChrome && navigator.userAgent.indexOf("Edg") != -1;
		_device.isFirefox = typeof InstallTrigger !== "undefined";
		_device.isIE = /*@cc_on!@*/ false || !!document.documentMode;
		_device.isOpera = (!!window.opr && !!opr.addons) || !!window.opera || navigator.userAgent.indexOf(" OPR/") >= 0;
		_device.isSafari =
			/constructor/i.test(window.HTMLElement) ||
			(function (p) {
				return p.toString() === "[object SafariRemoteNotification]";
			})(!window["safari"] || (typeof safari !== "undefined" && safari.pushNotification));
		_device.isMac = navigator.platform.indexOf("Mac") > -1;
	}

	_device.isNotPC = _device.isMobile || _device.isTablet;

	// custom event triggering
	$(document).on("keyup", function (e) {
		if (e.which == 13) $(e.target).trigger("enter");
	});
})(jQuery);

const publish = (function () {
	const common = {
		init: function () {
			common.setSwiperSlide();
			common.setAccordion();
			common.setDropDown();
			common.setSelect();
			//common.setDatepicker();
		},
		setSwiperSlide: function () {
			var recommandSwiper = new Swiper(".recommand-swiper", {
				slidesPerView: 2.7,
				spaceBetween: 40,
				autoplay: {
					// delay: 2000,
					disableOnInteraction: false,
					// loop: true,
				},
			});
			var eventSwiper = new Swiper(".event-swiper", {
				slidesPerView: 2,
				spaceBetween: 40,
			});
		},
		setAccordion: function () {
			$('.ui-accordion:not(".accordion-initiated")').each(function () {
				var $ui = $(this),
					$acc = $(".accordion", $ui);
				function init() {
					for (var i = 0; i < $acc.length; i++) {
						var $this = $acc.eq(i);
						if ($this.hasClass("css-mode")) {
							// css mode
						} else {
							run($this, !$this.hasClass("accordion-expanded"), 0);
						}
						set($this);
						$ui.addClass("accordion-initiated");
					}
				}
				function set(acc) {
					var $get = $(".accordion-get", acc);
					if (!($get.is("a") || $get.is("button"))) {
						$get.attr({
							role: "button",
							tabindex: 0,
						});
					}
					$get.off("click enter").on("click enter", function () {
						var state = acc.hasClass("accordion-expanded"),
							idx = $acc.index(acc);
						run(acc, state, 300);
						if (!state && $ui.hasClass("exclusive")) {
							for (var i = 0; i < $acc.length; i++) {
								if (i != idx) run($acc.eq(i), true, 300);
							}
						}
						return false;
					});
				}
				function run(element, state, duration) {
					var $get = $(".accordion-get", element),
						$set = $(".accordion-set", element),
						title = state ? "내용 펼치기" : "내용 접기";
					if (element.hasClass("css-mode")) {
						// css mode
					} else {
						if (state) {
							$set.slideUp(duration);
						} else {
							$set.slideDown(duration);
						}
						$get.attr({
							title: title,
							"aria-expanded": !state,
						});
						element.toggleClass("accordion-expanded", !state);
					}
				}
				init();
			});
		},
		setDropDown: function () {
			let $ui = $(".dropdown-wrap");
			$(".ux-button.custom-profile").on("click", function () {
				event.stopPropagation();
				$ui.toggleClass("expanded");
			});
			$(document).click(function () {
				if ($ui.hasClass("expanded")) {
					$ui.toggleClass("expanded");
				}
			});
		},
		setSelect: function () {
			$(".selectmenu").each(function () {
				let $select = $(this);
				$select.selectmenu({
					position: {
						my: "left top",
						at: "left bottom",
						collision: "flip",
					},
					create: function (event, ui) {
						getSelect($select);
					},
					select: function (event, ui) {
						getSelect($select);
					},
				});
				if ($select.attr("readonly")) {
					$select.selectmenu("disable");
				}
			});
			function getSelect($select) {
				let $option = $("option", $select);
				let state = false;
				for (let i = 0; i < $option.length; i++) {
					if ($option.eq(i).prop("selected")) {
						if (!$option.eq(i).hasClass("placeholder")) {
							state = true;
						}
					}
				}
				$select.toggleClass("has-selected", state);
			}
		},
		setDatepicker: function () {
			var custom_goToToday = $.datepicker._gotoToday;
			$.datepicker._gotoToday = function (id) {
				custom_goToToday.call(this, id);
				this._selectDate(id);
			};
			$.datepicker.regional["ko"] = {
				closeText: "닫기",
				prevText: "이전달",
				nextText: "다음달",
				currentText: "오늘",
				monthNames: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
				monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
				dayNames: ["일", "월", "화", "수", "목", "금", "토"],
				dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
				dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
				weekHeader: "Wk",
				dateFormat: "yy-mm-dd",
				firstDay: 0,
				isRTL: false,
				showMonthAfterYear: true,
				yearSuffix: "",
			};
			$.datepicker.setDefaults($.datepicker.regional["ko"]);
			$(".datepicker").each(function () {
				var $this = $(this);
				$this.prop("readonly", true);
				var delimiter = $this.hasClass("dash") ? "-" : ".";
				var from = "1900";
				var to = "+5";
				var minDate = null;
				var options = $this.attr("data-options");
				if (options) {
					options = JSON.parse(options);
					if (options.from) from = options.from;
					if (options.to) to = options.to;
					if (options.minDate) {
						minDate = options.minDate.split("-");
						minDate = new Date(minDate[0], minDate[1], minDate[2]);
					}
				}
				$this.datepicker({
					buttonText: "",
					changeYear: true,
					changeMonth: true,
					dateFormat: "yy" + delimiter + "mm" + delimiter + "dd",
					showButtonPanel: false,
					showMonthAfterYear: true,
					showOn: "both",
					buttonImage: "../assets/images/common/icn_calendar.svg",
					buttonImageOnly: true,
					showOtherMonths: true,
					yearRange: from + ":" + to,
					minDate: minDate,
				});
				$(this).parent(".input").addClass("has-datepicker").parent(".inputs").addClass("has-datepicker");
			});
		},
	};
	// Chrome 확장 프로그램의 메시지 리스너
	if (typeof chrome !== "undefined" && chrome.runtime && chrome.runtime.onMessage) {
		chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
			console.log("Message received:", message);
			if (message.type === "ASYNC_REQUEST") {
				common
					.fetchData(message.data.url)
					.then((response) => {
						console.log("Response sent:", { success: true, data: response });
						sendResponse({ success: true, data: response });
					})
					.catch((error) => {
						console.error("Error occurred:", error);
						sendResponse({ success: false, error: error.message });
					});
				return true; // 비동기 응답을 보낼 것임을 명시
			}
		});
	}
	return common;
})();

$(function () {
	publish.init();
});
