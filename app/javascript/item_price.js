const price = () => {
  const priceInput = document.getElementById("item-price");

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = parseInt(priceInput.value, 10); // 数値に変換、基数を指定
      if (isNaN(inputValue) || inputValue < 0) { // 入力値が数値でない、または負の数値の場合
        document.getElementById("add-tax-price").textContent = "—";
        document.getElementById("profit").textContent = "—";
        return;
      }
      const addTaxPrice = Math.floor(inputValue * 0.1); // 手数料計算
      const profit = Math.floor(inputValue - addTaxPrice); // 利益計算
      document.getElementById("add-tax-price").textContent = addTaxPrice.toLocaleString(); // 手数料表示
      document.getElementById("profit").textContent = profit.toLocaleString(); // 利益表示
    });
  }
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);