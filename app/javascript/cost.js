function cost  (){
  const price = document.getElementById("item-price");
  price.addEventListener("input", () => {
    const AddTaxPrice = document.getElementById("add-tax-price");
    AddTaxPrice.innerHTML = Math.round(price.value * 0.1);
    const profit = document.getElementById("profit");
    const tax = Math.round(price.value * 0.1);
       profit.innerHTML = (price.value - tax )
  });
}
window.addEventListener('', cost);
