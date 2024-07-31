const pay = () => {
  const publicKey = gon.public_key
  const payjp = Payjp(publicKey)
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  form.addEventListener("submit", (e) => {
    e.preventDefault(); // ここでデフォルトのフォーム送信を防止
    payjp.createToken(numberElement).then((response) => {
      if (response.error) {
        // エラー処理
        console.error(response.error.message);
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();
        document.getElementById("charge-form").submit();
      }
    });
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);
