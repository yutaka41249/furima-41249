document.addEventListener("turbo:load", function(){

  const priceInput = document.getElementById("item-price");
  if (!priceInput) {

    return;
  }
  priceInput.addEventListener("input", () => {
    const inputValue = parseInt(priceInput.value); // 数値に変換
    if (isNaN(inputValue) || inputValue < 0) { // 入力値が数値でない、または負の数値の場合

      document.getElementById("add-tax-price").textContent = "—";
      document.getElementById("profit").textContent = "—";
      return;
    }
    const addTaxPrice = Math.floor(inputValue * 0.1); // 手数料計算
    const profit = inputValue - addTaxPrice; // 利益計算
    document.getElementById("add-tax-price").textContent = addTaxPrice.toLocaleString(); // 手数料表示
    document.getElementById("profit").textContent = profit.toLocaleString(); // 利益表示

  });
});
