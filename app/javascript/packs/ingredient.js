$(document).on('ready page:load turbolinks:load', function() {
  $("#recipe_ingredients")
    .on('cocoon:after-insert', function(e, addedItem) {
        console.log('after insert');
        $(addedItem).find('.selectize').selectize({
          sortField: 'text'
        })
    });

  $(".selectize").selectize({
    sortField: 'text'
  });
});
