<h3>Wyniki wyszukiwania dla: {$query}</h3>

{paginate set=$search per_page=16}
	{assign var="products" value=$items}
	{if !$products}
		<p>Brak produktów w danych kryteriach</p>
	{else}
		<ul class="productList">
			{foreach from=$products item="p" name="list"}
			<li{if $smarty.foreach.list.iteration % 4 == 0} class="last"{/if}>
				<a href="{reverse_url name=shop_product  product_name=$p->url}">
					<div>
						<img src='{$p->main_image|product_img_url:th160}' alt="" />
					</div>
					<span><strong>{$p->name|truncate:16}</strong></span>
					<span class="price">{if $p->price_differ}od {$p->price_min|money}{else}{$p->price_min|money}{/if} {$shop->currency}</span>
				</a>
			</li>
			{/foreach}
		</ul>
	{/if}
	<div class="clearFix"></div>
	{if $pager->is_pagination_need}
		{$pager|default_pagination}
	{/if}
{/paginate}
<div class="clearFix"></div>