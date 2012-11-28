<div class="container list">
	{foreach from=$categories->all() item="category"}
		<h2 class="header">
			<span>{$category->title} <span>({$category->products_count})</span></span>
			<a href="{reverse_url name='shop_category' category_name=$category->url}">więcej &raquo;</a>
		</h2>
		
		{assign var="products" value=$category->getProducts(4)}
		
		{if !$products}
			<p>Brak produktów w danej kategorii</p>
		{else}
			<ul class="productList clearFix">
				{foreach from=$products item="p" name="list"}
				<li{if $smarty.foreach.list.iteration % 4 == 0} class="last"{/if}>
					<a href="{reverse_url name=shop_product_within_category category_name=$category->url product_name=$p->url}">
						<div>
							<img src='{$p->main_image|product_img_url:th160}' alt="" />
						</div>
						<span><strong>{$p->name|truncate:18}</strong></span>
						<span class="price">{if $p->price_differ}od {$p->price_min|money}{else}{$p->price_min|money}{/if} {$shop->currency}</span>
					</a>
				</li>
				{/foreach}
			</ul>
		{/if}
	{/foreach}
</div>