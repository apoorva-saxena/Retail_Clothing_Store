$(document).ready(function() {
    // $("#button40").click(function() {
    //     alert("button 40 was clicked!")
    //
    // });
    $(".product_buttons").click(function() {
        var count = parseInt($('#increment-cart').text())
        $('#increment-cart').text(count + 1);
        var id = this.id;
        console.log(id);
        $.get('/carts/' + id)
    });
});
