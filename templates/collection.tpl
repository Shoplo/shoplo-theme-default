<div class="leftSidebar">
	<ul>
	{foreach from=$collections->all() item="c"}
		<li>
			<a href="{reverse_url name=shop_collection collection_name=$c->url}">{$c->title}</a>
		</li>
	{/foreach}
	</ul>
</div>
<div class="container">
	<div class="path clearFix">
		<ul>
			<li>
				<a href="{reverse_url name='shop_home'}">Kolekcje</a> <span class="sep">&raquo;</span>
			</li>
			<li>
				<span>{$collection->title}</span>
			</li>
		</ul>
	</div>

	{paginate set=$collection items=$collection->getProducts() per_page=12}
		{assign var="products" value=$items}	
		{if !$products}
		<p>Brak produktów w danej kolekcji</p>
		{else}
		<ul class="productList">
			{foreach from=$products item="p" name="list"}
			<li{if $smarty.foreach.list.iteration % 3 == 0} class="last"{/if}>
				<a href="{reverse_url name=shop_product_within_collection collection_name=$collection->url product_name=$p->url}">
					<div>
						<img src='{$p->main_image|product_img_url:th160}' alt="" />
					</div>
					<span><strong>{$p->name|truncate:24}</strong></span>
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
	
	{if $collection->description}
	<div class="space"></div>
	<div class="light">
		{$collection->description}
	</div>
	{/if}
</div>