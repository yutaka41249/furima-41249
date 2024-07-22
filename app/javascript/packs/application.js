document.addEventListener("turbolinks:load", function() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", function() {
    const inputValue = priceInput.value;
    const tax = Math.floor(inputValue * 0.1);
    const profit = inputValue - tax;
    document.getElementById("add-tax-price").innerText = tax;
    document.getElementById("profit").innerText = profit;
  });
});
