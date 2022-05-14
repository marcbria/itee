// From: https://stackoverflow.com/questions/16442016/jquery-sticky-header-that-shrinks-when-scrolling-down
// More references: https://www.w3schools.com/howto/howto_js_shrink_header_scroll.asp
(function () {
	  $(function () {
		      var $document, didScroll, offset;
		      offset = $('.pkp_structure_head').position().top;
		      $document = $(document);
		      didScroll = false;
		      $(window).on('scroll touchmove', function () {
			            return didScroll = true;
			          });
		      return setInterval(function () {
			            if (didScroll) {
					            $('.pkp_structure_head').toggleClass('reducedHeader', $document.scrollTop() > offset);
								$('.journalLogo .is_img').toggleClass('reducedHeader', $document.scrollTop() > offset);
					            return didScroll = false;
					          }
			          }, 250);
		    });

}).call(this);
