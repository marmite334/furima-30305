function price () {
  const totalPrice = document.getElementById("item-price");
  totalPrice.addEventListener("keyup", () => {
    const totalPriceValue = totalPrice.value;
    const taxPrice =  Math.floor(totalPriceValue / 10) ;
    const addTaxPrice = document.getElementById('add-tax-price');
    const userProfitPrice = totalPriceValue - taxPrice;
    const profitPrice = document.getElementById('profit');
    addTaxPrice.innerHTML = `${taxPrice}`;
    profitPrice.innerHTML = `${userProfitPrice}`;
  });
}

window.addEventListener('load', price);