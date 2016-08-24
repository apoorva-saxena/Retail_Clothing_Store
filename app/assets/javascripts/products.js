$(document).ready(function() {
    $(".product_buttons").click(function() {
        var count = parseInt($('#increment-cart').text())
        $('#increment-cart').text(count + 1);
        var id = this.id;
        $.get('/carts/' + id)
    });
});
