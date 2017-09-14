$(function() {
	var cart_count = 0;
	cart_count = getCookie('cart_count');
	if (getQueryString('key') != '') {
		var key = getQueryString('key');
		var username = getQueryString('username');
		addCookie('key', key);
		addCookie('username', username);
	} else {
		var key = getCookie('key');
	}
	var html = '<div class="nctouch-footer-wrap posr">'
	if (cart_count > 0) {
		var fnav = '<div id="fx-footnav" class="fx-footnav clearfix"><ul>' + '<li><a href="' + WapSiteUrl + '/tmpl/fx/fx_index.html"><i class="home"></i><p>首页</p></a></li>' + '<li><a href="' + WapSiteUrl + '/tmpl/fx/fx_team.html"><i class="team"></i><p>我的团队</p></a></li>'
			+ '<li><a href="' + WapSiteUrl + '/tmpl/fx/fx_commission.html"><i class="commission"></i></span><p>佣金明细</p></a></li>' + '<li><a href="' + WapSiteUrl + '/tmpl/fx/fx_member.html"><i class="member"></i><p>我的</p></a></li></ul>' + '</div>';
	} else {
		var fnav = '<div id="fx-footnav" class="fx-footnav clearfix"><ul>' + '<li><a href="' + WapSiteUrl + '/tmpl/fx/fx_index.html"><i class="home"></i><p>首页</p></a></li>' + '<li><a href="' + WapSiteUrl + '/tmpl/fx/fx_team.html"><i class="team"></i><p>我的团队</p></a></li>'
			+ '<li><a href="' + WapSiteUrl + '/tmpl/fx/fx_commission.html"><i class="commission"></i><p>佣金明细</p></a></li>' + '<li><a href="' + WapSiteUrl + '/tmpl/fx/fx_member.html"><i class="member"></i><p>我的</p></a></li></ul>' + '</div>';
	}
	$("#footer").html(html + fnav);
	var key = getCookie('key');
	$('#logoutbtn').click(function() {
		var username = getCookie('username');
		var key = getCookie('key');
		var client = 'wap';
		$.ajax({
			type: 'get',
			url: ApiUrl + '/index.php?act=logout',
			data: {
				username: username,
				key: key,
				client: client
			},
			success: function(result) {
				if (result) {
					delCookie('username');
					delCookie('key');
					delCookie('cart_count');
					location.href = WapSiteUrl;
				}
			}
		});
	});
	if (typeof(navigate_id) == 'undefined') {
		navigate_id = "0";
	}
	//当前页面
	if (navigate_id == "1") {
		$(".fx-footnav .home").parent().addClass("current");
		$(".fx-footnav .home").attr('class', 'home2');
	} else if (navigate_id == "2") {
		$(".fx-footnav .team").parent().addClass("current");
		$(".fx-footnav .team").attr('class', 'team2');
	} else if (navigate_id == "3") {
		$(".fx-footnav .commission").parent().addClass("current");
		$(".fx-footnav .commission").attr('class', 'commission2');
	} else if (navigate_id == "4") {
		$(".fx-footnav .member").parent().parent().addClass("current");
		$(".fx-footnav .member").attr('class', 'member2');
	} 
});