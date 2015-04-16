$(document).ready(function(){

  $('.bio input[type="text"]').keypress(function(event){
    if (event.which === 13) {
      event.preventDefault();
      var bio = $(this).val();
      var user_id = $('.bio').data('id');
      $.ajax({
	type: 'PATCH',
	url: '/users/'+user_id,
	dataType: 'json',
	data: {
	  user: {
	    bio: bio
	  }			
	},
	success: function(){
	  $('.bio').html('<h4>'+ bio +'</h4>');
	}
      })
    }
  })

  $('.website input[type="text"]').keypress(function(event){
    if (event.which === 13) {
      event.preventDefault();
      var personal_website = $(this).val();
      var user_id = $('.website').data('id');
      $.ajax({
	type: 'PATCH',
	url: '/users/'+user_id,
	dataType: 'json',
	data: {
	  user: {
	    personal_website: personal_website
	  }			
	},
	success: function(){
	  $('.website').html('<h4>'+ personal_website +'</h4>');
	}
      })
    };
  })

  $('.rsvp').click(function(event){
    event.preventDefault();
    var event_id = $(this).attr('data-eventid');
    var rsvp_status = 1;
    $.ajax({
      type: 'POST',
      url: '/rsvps',
      success: 
      dataType: 'json',
      data: {
	event_id: event_id,
	rsvp_status: rsvp_status
      }
    })
  })
});
