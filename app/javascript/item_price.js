function calculation() {
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  price.addEventListener('input', () => {
  const priceValue = price.value;
  const taxPrice = Math.trunc( priceValue * 0.1 );
  tax.innerHTML = taxPrice;
  profit.innerHTML = `${priceValue - taxPrice }`;

  });
};
window.addEventListener('load', calculation);