document.addEventListener('DOMContentLoaded', function () {
  const itemPriceInput = document.getElementById('item-price');
  const addTaxPriceElement = document.getElementById('add-tax-price');
  const profitElement = document.getElementById('profit');

  function updateValues() {
    const itemPrice = parseFloat(itemPriceInput.value);

    if (isNaN(itemPrice)) {
      addTaxPriceElement.textContent = '';
      profitElement.textContent = '';
      return;
    }

    const addTaxPrice = Math.floor(itemPrice * 0.1);

    const profit = Math.floor(itemPrice * 0.9);

    addTaxPriceElement.textContent = `¥${addTaxPrice.toLocaleString()}`;
    profitElement.textContent = `¥${profit.toLocaleString()}`;
  }


  updateValues();


  itemPriceInput.addEventListener('input', updateValues);
});


document.addEventListener('turbo:render', function () {

  const event = new Event('DOMContentLoaded');
  document.dispatchEvent(event);
});