$(document).ready(function() {
    $(".removeitem").click(function() {
        var id = this.id;
        $.get('/delete/' + id)
    });
});
