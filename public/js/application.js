
$(document).ready(function(){
	$('#urlform').submit(function(e){ 
		e.preventDefault();
		$.ajax({
      url: '/urls', //this refers to the route post '/urls'
      method: 'POST',
      data: $(this).serialize(),
      dataType: 'json',
    	}).done(function(data){
        if(data == false) {
          alert("Error: Invalid URL entered.");
        }
        else {
          console.log(data)
          console.log(data.origurl)
          markup = "<tr><th class='urltext'>" + data.origurl + "</th> <th class='greytext'>/" + data.biturl + "</th><th>" + data.clicked + "</th></tr>"
          replacerow(markup)
          $('#urlbox').val('');
        }
      }); // end of function done
	}); // end of function .submit
  $('#testbutton').click(function(){

  });
}); // end of function document.ready


function replacerow(newrow){
  $("table#recenturls tr:nth-child(6)").fadeTo("slow",0, function(){
      this.remove();
    })
    markup = newrow
    $(markup).insertBefore($("table#recenturls tr:nth-child(2)"))
    $("table#recenturls tr:nth-child(2)").hide()
    $("table#recenturls tr:nth-child(2)").fadeIn("slow",'swing');
}

