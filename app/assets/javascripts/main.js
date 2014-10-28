//  This is the code to toggle the registration form between register/signin


$($( ".js-regbutton" )[0]).on("click", function() {
  $( ".js-registration" ).toggle();
  // console.log("clicked");
});

// console.log("loading?");