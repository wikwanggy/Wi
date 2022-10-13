/**
 * 
 */


$(document).ready(function() {
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
});