<div class="leftSidebar">
	{$categories->createListView($category->url, 'categories', 'active')}
</div>
<div class="container">
	<div class="path clearFix">
		{assign parents $category->getParents()}
		<ul>
			<li>
				<a href="{reverse_url name='shop_category_list'}">Sklep</a> <span class="sep">&raquo;</span>
			</li>
			{if $parents}
			{foreach from=$parents item="p"}
			<li>
				<a href="{reverse_url name='shop_category' category_name=$p->url}">{$p->title}</a> <span class="sep">&raquo;</span>
			</li>
			{/foreach}
			{/if}
			<li>
				<span>{$category->title}</span>
			</li>
		</ul>
	</div>

	{paginate set=$category items=$category->getProducts() per_page=9}
		{assign var="products" value=$items}	
		{if !$products}
		<p>Brak produktów w danej kategorii</p>
		{else}
		<ul class="productList">
			{foreach from=$products item="p" name="list"}
			<li{if $smarty.foreach.list.iteration % 3 == 0} class="last"{/if}>
				<a href="{reverse_url name=shop_product_within_category category_name=$category->url product_name=$p->url}">
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
	
	{if $category->description}
	<div class="space"></div>
	<div class="light">
		{$category->description}
	</div>
	{/if}
</div>