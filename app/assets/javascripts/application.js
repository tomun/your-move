
$(document).ready(function(){
  /* Remove the href attribute to prevent browser from adding #, and style so it still looks like a link */
  $('#access-trigger').removeAttr("href").css("cursor","pointer");
  
  /* Implement the slide-down login form functionality */
  $('#access-trigger').click(function(){
    $(this).next('#access-content').slideToggle();
    $(this).toggleClass('active');
    return false;
  })
  
});
