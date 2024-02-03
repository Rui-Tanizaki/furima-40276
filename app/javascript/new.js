document.addEventListener('turbo:load', function () {
  const itemPriceInput = document.getElementById('item-price');
  const addTaxPriceElement = document.getElementById('add-tax-price');
  const profitElement = document.getElementById('profit');

  function updateValues() {
    // 入力された金額を取得
    const itemPrice = parseFloat(itemPriceInput.value);

    if (isNaN(itemPrice)) {
      // クリア時の処理
      addTaxPriceElement.textContent = '';
      profitElement.textContent = '';
      return;
    }

    const addTaxPrice = Math.floor(itemPrice * 0.1);
    const profit = Math.floor(itemPrice * 0.9);

    // 金額を3桁ごとにカンマ区切りにフォーマット
    const formattedAddTaxPrice = addTaxPrice.toLocaleString();
    const formattedProfit = profit.toLocaleString();

    addTaxPriceElement.textContent = `¥${formattedAddTaxPrice}`;
    profitElement.textContent = `¥${formattedProfit}`;
  }

  // ページロード時と再表示時の処理
  updateValues();

  // フォームが表示された場合の処理
  document.addEventListener('turbo:render', function () {
    // レンダリング後に再度DOMContentLoadedイベントを発火
    const event = new Event('turbo:load');
    document.dispatchEvent(event);
  });

  // item_priceの入力イベントを監視
  itemPriceInput.addEventListener('input', updateValues);
});