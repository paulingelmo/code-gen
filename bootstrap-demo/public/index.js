function ready() {
  $('#jsModalButton').click(function() {
    console.log('click!');
    $('#myModal').modal();
  });
  $('#jsDropButton').click(function() {
    console.log('drop!');
    $('.dropdown-menu').toggle('dropdown');
  });
}

$(document).on('ready page:load', ready);
