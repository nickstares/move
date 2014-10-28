$(document).ready(function(){

	$('#about input[type="text"]').keypress(function(event){
		if (event.which === 13) {
			event.preventDefault();
			var bio = $(this).val();
			var user_id = $('#about').data('id');
			$.ajax({
				type: 'PATCH',
				url: 'users/'+user_id,
				dataType: 'json',
				data: {
					user: {
						bio: bio
					}			
				},
				success: function(){
					$('#about').html('<h4><small>'+ bio +'</small></h4>');
				}
			})
		}
	})

	$('#user-link input[type="text"]').keypress(function(event){
		if (event.which === 13) {
			event.preventDefault();
			var personal_website = $(this).val();
			var user_id = $('#user-link').data('id');
			$.ajax({
				type: 'PATCH',
				url: 'users/'+user_id,
				dataType: 'json',
				data: {
					user: {
						personal_website: personal_website
					}			
				},
				success: function(){
					$('#user-link').html('<h4><small>'+ personal_website +'</small></h4>');
				}
			})
		};
	})
});