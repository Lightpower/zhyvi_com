ZH.carusel = {
    step: function() {
        var current_div, next_div,
            current_number, next_number,
            current_image, next_image;

        current_div = $('div.category_selected');
        if(current_div.length == 0) {
            // First time
            next_div = $('div.category[data-index="1"]');
            next_image = $('div.category_image[data-index="1"]');
            next_number = 1;
        }else{
            current_number = current_div.data("index");
            next_number = ZH.carusel.next_number(current_number);
            next_div = $('div.category[data-index="' + next_number + '"]');
            current_image = $('div.category_image[data-index="' + current_number + '"]');
            next_image = $('div.category_image[data-index="' + next_number + '"]');

            current_div.removeClass("category_selected").addClass("category");
            current_image.addClass("hidden");
        }

        next_div.removeClass("category").addClass("category_selected");
        next_image.removeClass("hidden");
    },
    next_number: function(number) {
        var next = number+=1;
        if(next > 7) next = 0;
        return next;
    }
};

$(function() {
  setInterval(ZH.carusel.step(), 15000);
});