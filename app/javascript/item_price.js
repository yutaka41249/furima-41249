document.addEventListener("DOMContentLoaded", function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue); // デバッグ用: 入力された値がコンソールに表示される
  });
});
