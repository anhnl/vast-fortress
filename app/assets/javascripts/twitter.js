$(document).ready(function() {

	$('.hover-summary').on('mouseenter', function(e) {
		
		var mentioned = $(this).attr('id');
		var self = this;
		$.ajax({
			url: '/twitter/get_mentioned_info/' + mentioned,
			type: 'GET',
			dataType: 'json',
			success: function(data) {
				$(self).popover({
					trigger: 'hover',
					html: true,
					placement: 'auto',
					content: '<div class="count"><div class="count-type">Tweets</div><div class="count-value">' + formatNumber(data.tweets_count) + '</div></div>'+
								'<div class="count"><div class="count-type">Following</div><div class="count-value">' + formatNumber(data.following_count) + '</div></div>' +
								'<div class="count"><div class="count-type">Followers</div><div class="count-value">' + formatNumber(data.followers_count) + '</div></div>',
					template: '<div class="popover" role="tooltip"><div class="arrow"></div>' +
								'<h3 class="popover-title"></h3>' +
								'<div class="popover-content"></div></div>'
				});
				$(self).popover('show');
			}
		});
		
	});

	function formatNumber(n) {
		if (n > 999 && n < 9999) {
			return n.toString()[0] + ',' + n.toString().slice(1,4);
		}
		else if (n > 9999 && n < 999999) {
			return (n / 1000).toString().slice(0,4).replace('.','') + 'K';
		} else if (n > 999999) {
			return (n / 1000000).toString().slice(0,4).replace('.','') + 'M';
		} else {
			return n;
		}
	}

});