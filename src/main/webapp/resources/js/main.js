/**
 * 
 */
	
$(document).ready(function() {
	// fullpage
	$('#fullpage').fullpage({		      
	  anchors: ['sec1', 'sec2', 'sec3','sec4','sec5','sec6'],
	  menu: '#menu',
	  scrollingSpeed: 1000,
	  // scrollBar: true,
	  onLeave: function(origin, destination, direction) {
	    // 빠른전환으로 이벤트중복시 fullpage와 swiper전환시점 분리막기
	    $('#fullpage').on('scroll touchmove mousewheel', function(event) {   
	      event.preventDefault();
	      event.stopPropagation();
	      return false;
	    });
	    swiper.mousewheel.disable();
	  },
	  afterLoad: function(anchorLink, index) {    
		  contentsEvent(index);
	    // 전환이 끝난후 이벤트풀기                               
	    $('#fullpage').off('scroll mousewheel');      
	    if(!$(".fp-completely .swiper-wrapper").length > 0) $('#fullpage').off('touchmove'); // 모바일분기
	    if(swiper) swiper.mousewheel.enable();
	    // if(index == 4) $.fn.fullpage.setAllowScrolling(false); // 마지막센션에서 올라올때 자동방지
	  }
	});           

	// swiper
	var length = $(".sec2 .swiper-slide").length;
	var swiper = new Swiper('.swiper-container', {
	
	  slidesPerView: 1,
	  spaceBetween: 0,
	  freeMode: false,
	  speed: 700,//
	  mousewheel: true,
	  pagination: {
	    el: '.swiper-pagination',
	    clickable: true,
	  },
	  on: {
	    slideChange: function(){        
	      var idx = this.activeIndex;
	      // 처음과 마지막 슬라이드가 아닐경우 fullpage전환 막기
	      if(this.activeIndex != 0 && idx != length) $.fn.fullpage.setAllowScrolling(false);
	      if(length == 2 && idx == 0) $.fn.fullpage.setAllowScrolling(false) //슬라이드가 2개밖에 없을때
	      // console.log('즉시 : ' + idx);
	    },  
	    slideChangeTransitionEnd: function(){
	      var idx = this.activeIndex;
	      // 처음과 마지막 슬라이드일 경우 fullpage전환 풀기
	      if(idx == 0 || idx >= length-1) $.fn.fullpage.setAllowScrolling(true);
	      // console.log('전환후 : ' + idx);     
	    },
	    touchMove: function(e) {        
	      var startY = e.touches.startY;
	      setTimeout(function(){
	        if(startY > e.touches.currentY) swiper.slideNext();  
	        else swiper.slidePrev();
	      },100);        
	    },
	  }, 
	}); 
	$(function(){
	    var duration = 300;

	    var $sidebar = $('#side_bar');
	    var $sidebarButton = $sidebar.find('button').on('click', function(){
	        $sidebar.toggleClass('open');
	        if($sidebar.hasClass('open')){
	            $sidebar.stop(true).animate({left: '0px'}, duration, 'easeOutBack');
	            $sidebarButton.stop(true).animate({left:'190px',});
	            $sidebarButton.css("background-color","#ffff80");
	            $sidebarButton.css("border-radius","20px 20px 20px 20px");
	            $sidebarButton.css("border","1px solid black");
	            $sidebarButton.find('span').text('CLOSE');
	        }else{
	            $sidebar.stop(true).animate({left: '-270px'}, duration, 'easeInBack');
	            $sidebarButton.stop(true).animate({left:'270px'});
	            $sidebarButton.css("background-color","#ffffff");
	            $sidebarButton.css("border-radius","0px 10px 10px 0px");
	            $sidebarButton.find('span').text('OPEN');
	        };
	    });
	});
	$(function(){
		$(window).resize(function(){
			var width = $(window).width();
			console.log(width);
			if(width>=1024){
				
			}else if(width>=768 && width<1024){
				
			}else if(width<768){
				
			}
		})
	})
	$(document).ready(function(){
		$(".desc").mouseover(function(){
			$(this).css("opacity",1);
			$(this).css("background-color","#333333");
		});
		$(".desc").mouseout(function(){
			$(this).css("opacity",0);
			
		});
	});
	$(document).ready(function(){
		$(".project_desc").mouseover(function(){
			$(this).css("opacity",1);
			$(this).css("background-color","#333333");
		});
		$(".project_desc").mouseout(function(){
			$(this).css("opacity",0);
			$(this).css("background-color","#ffff80");
			
		});
	});
		function contentsEvent(index){
			var $thisContents = $(".contents").eq(index-1);
			$('.contents').not($thisContents).hide();
			$thisContents.stop(false,true).fadeIn(100);
		};

});
