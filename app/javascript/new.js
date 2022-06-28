function post (){
  const item_price = document.getElementById('item-price');
  item_price.addEventListener('keyup', function(){
    const add_tax_price = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');
    // 販売手数料と販売利益を計算して表示する
    const add_tax_price_value = item_price.value * 0.1;
    const profit_value = item_price.value - add_tax_price_value;
    add_tax_price.innerHTML = Math.floor(add_tax_price_value);
    profit.innerHTML = Math.floor(profit_value);
  });
};

window.addEventListener('load', post);