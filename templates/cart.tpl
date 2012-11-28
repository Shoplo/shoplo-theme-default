<script type="text/javascript">
  function remove_item(id) {
      document.getElementById('updates_'+id).value = 0;
      document.getElementById('cartform').submit();
  }
</script>


<div class="cartPage">
	{if $cart->item_count > 0}
	<h2>Twoje zakupy:</h2>
	<form action="" method="post" id="cartform">
	{foreach from=$cart->items item="item"}
	<div class="cartItem clearFix">
		<div class="image col">
			<a href="{reverse_url name='shop_product' product_name=$item->product->url}">
				<img src="{$item->variant->getMainImage('th100')}" alt="" />
			</a>
		</div>
		<div class="description col">
			<p>
				<a href="{reverse_url name='shop_product' product_name=$item->product->url}">{$item->product->name}</a>
			</p>
			<p>{foreach from=$item->variant->properties key="name" item="value" name="variantList"}{$name}: {$value}{if !$smarty.foreach.variantList.last}, {/if}{/foreach}</p>
		</div>
		<div class="quantity col">
<input type="text" name="updates[{$item->id}]" id="updates_{$item->id}" value="{$item->quantity}" onfocus="this.select();" price="{$item->price|money}" />
		</div>
		<div class="remove">
			<a onclick="remove_item({$item->id}); return false;" href="#">x</a>
		</div>
		<div class="price col">
			<span><b class="amount">{$item->price|money}</b> {$shop->currency}</span>
		</div>
	</div>
	{/foreach}
	<div class="summary clearFix">
		<a href="{$return_to}">&laquo; Kontynuuj zakupy</a>
		<div class="floatRight">
			<span class="label">Zakupy razem:</span>
			<span class="price"><b class="amount">{$cart->total_price|money}</b> {$shop->currency}</span>
		</div>
	</div>
	<div class="submit floatRight">
		<input type="submit" value="Zamawiam &raquo" name="order" />
	</div>
	</form>
	{else}
	<p>Twój koszyk jest pusty. <a href="{reverse_url name='shop_name'}">Dokonaj swoich pierwszych zakupów&raquo;</a></p>
	{/if}
</div>

<script type="text/javascript">
  $('#cartform .quantity input').keyup( function() {
	var amount = $(this).val();
	var price = parseFloat($(this).attr('price'));
	var sum = (price * amount).toFixed(2);
	var overall = 0;
	$('#cartQuantity').text(amount);
	$(this).parents('.cartItem').find('.price .amount').text(sum);
	$('#cartform .cartItem .quantity input').each(function() {
		var itemAmount = $(this).val();
		var itemPrice = parseFloat($(this).attr('price'));
		var itemSum = (itemPrice * itemAmount).toFixed(2);
		overall += parseFloat(itemSum);
	});
	$('#cartform .summary .price .amount').text(overall.toFixed(2));
  });
</script>