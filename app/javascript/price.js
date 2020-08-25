window.addEventListener("load", function() {
  const item_price = document.getElementById("item-price")
  const add_tax_price = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  item_price.addEventListener("keyup", function(){
    let price = item_price.value;
    let tax = price * 0.1
    let profit = price - tax
    $("#add-tax-price").text(tax);
    $("#profit").text(profit);
  }) 
})