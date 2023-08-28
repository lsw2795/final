$(function(){
		$('.page-nav>div').click(function() {
		    var pagenav = $(this).parent();
		    var current = $(pagenav).find('.slideActive');
		    
		    $(current).removeClass('slideActive');
		    $(this).addClass('slideActive');
		    
		    var slider = $(pagenav).parent().find('.col-8');
		    var index = $(this).index();
		    
		    $(slider).find('div.slideActive').removeClass('slideActive');
		    $(slider).find('div').eq(index).addClass('slideActive');
		    
		});

		$('#leftBt').click(function() {
		    var slider = $(this).closest('.img-slider');
		    var current = $(slider).parent().find('.page-nav > div.slideActive');
		    var post = current.prev();
		    
		    if ( post.length == 0 ) {
		        post = $(slider).find('.page-nav > div:last-child');
		    }
		    
		    post.click();
		});

		$('#rightBt').click(function() {
		    var slider = $(this).closest('.img-slider');
		    
		    var current = $(slider).parent().find('.page-nav > div.slideActive');
		    var post = current.next();
		    
		    if ( post.length == 0 ) {
		        post = $(slider).find('.page-nav > div:first-child');
		    }
		    
		    post.click();
		});
		
	});
	
	

	function divEvent(a){
		var pDiv=$(a).parent().parent().parent();
		if(pDiv.find('.slide').length==0){
			pDiv.children('#datgeulWriteDiv').slideDown();
			pDiv.children('#datgeulViewDiv').slideDown();
			pDiv.children('#datgeulViewDiv').addClass('slide');
		}else{
			pDiv.children('#datgeulWriteDiv').slideUp();
			pDiv.children('#datgeulViewDiv').slideUp();
			pDiv.children('#datgeulViewDiv').removeClass('slide');
		}
	}