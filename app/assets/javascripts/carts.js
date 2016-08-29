// $(document).ready(function() {
//
//     $(".voucherCheckbox").change(function() {
//         if (this.checked) {
//             apply_voucher_discount(this.id);
//         } else {
//             remove_voucher_discount(this.id);
//         }
//     });
// });
//
// function apply_voucher_discount(id) {
//     amount = parseInt($("#finalbillwithvoucher").text())
//     var discount = 0;
//     if (id == 'voucher_1') {
//         discount = 5;
//     } else if (id == 'voucher_2' && amount >= 50) {
//         discount = 10;
//     } else if (id == 'voucher_3' && amount >= 75 && ($("#productCategory").text() == "Women's Footwear" || $("#productCategory").text() == "Men's Footwear")) {
//         discount = 15;
//     } else {
//         alert("Wrong voucher");
//     }
//     console.log('final amount =', amount - discount)
//     $("#finalbillwithvoucher").text(amount - discount);
// }
//
// function remove_voucher_discount(id) {
//     amount = parseInt($("#finalbillwithvoucher").text())
//     var add_back = 0;
//     if (id == 'voucher_1') {
//         add_back = 5;
//     } else if (id == 'voucher_2') {
//         add_back = 10;
//     } else if (id == 'voucher_3') {
//         add_back = 15;
//     }
//     console.log('final amount =', amount + add_back)
//     $("#finalbillwithvoucher").text(amount + add_back);
// }
