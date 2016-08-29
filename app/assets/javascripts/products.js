function setClickHandlers() {
    $(".product_buttons").click(function() {
        var id = this.id;
        var current_stock = parseInt($('#productQuantity_' + id).text(), 10);
        if (current_stock == 1) {
            $(id).disabled = true;
        }
          $('#productQuantity_' + id).text(current_stock - 1);
          var count = parseInt($('#increment-cart').text(), 10);
          $('#increment-cart').text(count + 1);
          $.post('/carts/', {'id': id});
    });
}
$(document).ready(setClickHandlers);
