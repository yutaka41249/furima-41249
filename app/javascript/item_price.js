document.addEventListener("turbo:load", function(){
  console.log("OK");  // JavaScriptが正しくロードされたことを確認
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {

    const inputValue = parseInt(priceInput.value); // 数値に変換
    const addTaxPrice = Math.floor(inputValue * 0.1); // 手数料計算
    const profit = inputValue - addTaxPrice; // 利益計算
    document.getElementById("add-tax-price").textContent = addTaxPrice; // 手数料表示
    document.getElementById("profit").textContent = profit; // 利益表示

  });
});
