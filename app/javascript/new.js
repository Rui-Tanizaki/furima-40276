document.addEventListener('turbo:load', function () {
  const itemPriceInput = document.getElementById('item-price');
  const addTaxPriceElement = document.getElementById('add-tax-price');
  const profitElement = document.getElementById('profit');

  let initialLoad = true;

  function updateValues() {
    const itemPrice = parseFloat(itemPriceInput.value);

    if (isNaN(itemPrice)) {
      addTaxPriceElement.textContent = '';
      profitElement.textContent = '';
      return;
    }

    const addTaxPrice = initialLoad ? '' : `¥${Math.floor(itemPrice * 0.1).toLocaleString()}`;
    const profit = initialLoad ? '' : `¥${Math.floor(itemPrice * 0.9).toLocaleString()}`;

    addTaxPriceElement.textContent = addTaxPrice;
    profitElement.textContent = profit;


    initialLoad = false;
  }


  updateValues();


  document.addEventListener('turbo:render', function () {

    const event = new Event('turbo:load');
    document.dispatchEvent(event);
  });

  itemPriceInput.addEventListener('input', updateValues);
});