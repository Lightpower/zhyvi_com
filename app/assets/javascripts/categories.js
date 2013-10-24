$(function() {
    $("div.category").bind("click", function(e) {

        ZH.carusel.step_by_div(this);

        e.preventDefault();
    });
});