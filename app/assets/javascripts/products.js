$(document).ready(function() {
    $(".product_buttons").click(function() {
        var id = this.id;
        var current_stock = parseInt($('#productQuantity_' + id).text());
        if (current_stock == 1) {
            document.getElementById(this.id).disabled = true;
        }
          $('#productQuantity_' + id).text(current_stock - 1)
          var count = parseInt($('#increment-cart').text())
          $('#increment-cart').text(count + 1);
          $.get('/carts/' + id)
    });
});
