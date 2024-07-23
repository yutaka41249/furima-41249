document.addEventListener('DOMContentLoaded', () => {
  console.log("OK");  // JavaScriptが正しくロードされたことを確認
  const priceInput = document.getElementById('product_price');
  const profitOutput = document.getElementById('profit');
  const feeOutput = document.getElementById('fee');

  priceInput.addEventListener('input', () => {
    const price = priceInput.value;
    const fee = Math.floor(price * 0.1);
    const profit = price - fee;

    feeOutput.textContent = `販売手数料: ${fee}円`;
    profitOutput.textContent = `販売利益: ${profit}円`;
  });
});
