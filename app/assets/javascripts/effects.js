jQuery(document).ready(function() {

/* Banner class */
	jQuery('.squarebanner ul li:nth-child(even)').addClass('rbanner');

 
/* Navigation */
	jQuery('#submenu ul.sfmenu').superfish({ 
		delay:       500,								// 0.1 second delay on mouseout 
		animation:   {opacity:'show',height:'show'},	// fade-in and slide-down animation 
		dropShadows: true								// disable drop shadows 
	});	

/* Homepage goodness */

	jQuery('.postim').mouseenter(function(e) {
        jQuery(this).children('a').children('img').animate({  left:'0', top:'0', width:'15'}, 300);
 
    }).mouseleave(function(e) {
        jQuery(this).children('a').children('img').animate({ left: '0', top: '0', width:'150'}, 300);
       
    });

/* Fancy that	 */
	jQuery(".bookshot").fancybox({
		'titleShow' : false,
		'transitionIn' : 'elastic',
		'transitionOut' : 'elastic',
		'easingIn' : 'easeOutBack',
		'easingOut' : 'easeInBack'
	}); 
	
});

