$(document).on('ready page:load turbolinks:load', function() {
  var selectizeCallback = null;

  $("#recipe_ingredients")
    .on('cocoon:after-insert', function(e, addedItem) {
        console.log('after insert');
        $(addedItem).find('.selectize').selectize({
          create: function(input, callback) {
            selectizeCallback = callback;
            $(".ingredient-modal").modal();
            $("#ingredient_name").val(input);
          }
        });
    });

  $(".ingredient-modal").on("hide.bs.modal", function(e) {
      if (selectizeCallback != null) {
          selectizeCallback();
          selectizeCallback = null;
      }

      $("#new_ingredient").trigger("reset");
      var selectors = [$.rails.linkDisableSelector, $.rails.formEnableSelector].join(', ');
      $(selectors).each(function() {
        $.rails.enableElement(this);
      });
  });

  $("#new_ingredient").on("submit", function(e) {
    e.preventDefault();
    $.ajax({
      method: "POST",
      url: $(this).attr("action"),
      data: $(this).serialize(),
      success: function(response) {
        console.log(response);
        selectizeCallback({value: response.id, text: response.name});
        selectizeCallback = null;

        $(".ingredient-modal").modal('toggle');
      }
    });
  });

  $(".selectize").selectize({
    create: function(input, callback) {
      selectizeCallback = callback;

      $(".ingredient-modal").modal();
      $("#ingredient_name").val(input);
    }
  });
});
