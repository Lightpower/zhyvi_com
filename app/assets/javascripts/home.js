ZH.carusel = {
    step: function(number) {
        var current_div, current_number, next_number;

        if(number != 0) {
            next_number = number;
        }else{
            current_div = $('div.category.selected');
            if(current_div.length == 0) {
                // First time
                next_number = 1;
            }else{
                current_number = current_div.data("index");
                next_number = ZH.carusel.next_number(current_number);
            }
        }

        // Hide all category div's and category images
        $('div.category').removeClass("selected");
        $('div.category_image').addClass("hidden");
        // Select next div and show next picture
        $('div.category[data-index="' + next_number + '"]').addClass("selected");
        $('div.category_image[data-index="' + next_number + '"]').removeClass("hidden");
    },
    next_number: function(number) {
        var next = number+1;
        if(next > 7) next = 0;
        return next;
    },
    step_by_div: function(div) {
      ZH.carusel.step($(div).data("index"));
    }
};

$(function() {
  setInterval(ZH.carusel.step(0), 15000);
});