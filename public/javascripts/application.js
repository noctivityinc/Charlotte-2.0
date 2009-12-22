$('document').ready(function(){
  
   $('a#support').click(function(e){
     e.preventDefault();
     $('div#inline-support').slideToggle();
     
   })
  
}); // ready