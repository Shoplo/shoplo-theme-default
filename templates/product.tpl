{"jquery.ui.css"|asset_url:stylesheet_tag}
{"jquery.ad-gallery.css"|asset_url:stylesheet_tag}
{"jquery.lightbox-0.5.css"|asset_url:stylesheet_tag}

{"jquery.ad-gallery.js"|asset_url:script_tag}
{"jquery.lightbox-0.5.min.js"|asset_url:script_tag}
{"jquery.opacityrollover.js"|asset_url:script_tag}
{"jquery.selectMenu.js"|asset_url:script_tag}
{"product.js"|asset_url:script_tag}

<!-- BREADCRUMB -->
{if isset($collection) || isset($category)}
	{if isset($collection)}
		<div class="path clearFix">
			<ul>
				<li>
					<a href="{reverse_url name=shop_home}">Sklep</a> &raquo;
				</li>
				<li>
					<a href="{reverse_url name=shop_collection collection_name=$collection->url}">{$collection->title|ucfirst}</a> &raquo;
				</li>
				<li>
					<span>{$product->name}</span>
				</li>
			</ul>
		</div>
	{elseif isset($category)}
		<div class="path clearFix">
			<ul>
				<li>
					<a href="{reverse_url name=shop_home}">Home</a> &raquo;
				</li>
				<li>
					<a href="{reverse_url name=shop_category category_name=$category->url}">{$category->title|ucfirst}</a> &raquo;
				</li>
				<li>
					<span>{$product->name}</span>
				</li>
			</ul>
		</div>
	{else}
		<div class="path clearFix">
			<ul>
				<li>
					<a href="{reverse_url name=shop_home}">Home</a> &raquo;
				</li>
				<li>
					<span>{$product->name}</span>
				</li>
			</ul>
		</div>
	{/if}
{/if}
<!-- END BREADCRUMB -->

<div class="productPage">
	<!-- PRODUCT GALLERY -->
	{assign var="photos" value="{$product->getImages()}"}
	{if $photos}
	<div class="ad-gallery">
		<div class="ad-image-wrapper">
		</div>
		<div class="ad-nav">
			<div class="ad-thumbs">
				<ul class="ad-thumb-list">
					{foreach from=$photos item="photo"}
					<li>
						<a href="{$photo->url|product_img_url:th480}">
<img src="{$photo->url|product_img_url:th100}" alt="{$product->name}">
						</a>
					</li>
					{/foreach}
				</ul>
			</div>
		</div>
	</div>
	{/if}
	<!-- END PRODUCT GALLERY -->
	
	<!-- PRODUCT DESCRIPTION -->
	<div class="productDescription">
		<h3>{$product->name}</h3>
		{assign var="variants" value=$product->getVariants()}
		{assign var="properties" value=$product->getProperties()}
		<form action="{reverse_url name='shop_cart_add'}" method="post">
			<input type="hidden" name="return_to" value="" />
		        {if $product->available}
				{if $variants && $properties && count($variants) > 1}
				<select name="id" id="variants">
					{foreach from=$variants key="name" item="variant" name="variant"}
					<option value="{$variant->id}" prc="{$variant->price|money}"{if !$variant->available} disabled="disabled"{/if}>
						{if $variant->property1}{$variant->property1}{/if}
						{if $variant->property2} / {$variant->property2}{/if}
						{if $variant->property3} / {$variant->property3}{/if}
					</option>
					{/foreach}
				</select>
				{else}
				<input type="hidden" name="id" value="{$variants[0]->id}" />
				{/if}
			{/if}
			<div class="price">
				<span><span class="ch">{if $product->price_differ}od {/if}{$product->price_min|money}</span> {$shop->currency}</span>
				{if $product->available}
					<input type="submit" name="addToCard" value="Do koszyka" />
				{else}
					<div class="clear"></div>
					<p class="lack">Produkt chwilowo niedostępny</p>
				 {/if}
			</div>
			
			<div class="desc">
				<p><strong>Informacje o produkcie:</strong></p>
				{$product->description}
			</div>
		</form>
		
		{if $product->previous_product || $product->next_product}
		<div class="space"></div>
		<div class="nextPrev">			
			{if $product->previous_product}
				{if isset($category)}
				<a href="{reverse_url name=shop_product_within_category category_name=$category->url product_name=$product->previous_product->url}">&laquo; poprzedni</a>
				{elseif isset($collection)}
				<a href="{reverse_url name=shop_product_within_collection collection_name=$collection->url product_name=$product->previous_product->url}">&laquo; poprzedni</a>
				{else}
				<a href="{reverse_url name=shop_product product_name=$product->previous_product->url}">&laquo; poprzedni </a>		
				{/if}
			{/if}
			
			{if $product->next_product}
				{if isset($category)}
				<a href="{reverse_url name=shop_product_within_category category_name=$category->url product_name=$product->next_product->url}">następny &raquo;</a>
				{elseif isset($collection)}
				<a href="{reverse_url name=shop_product_within_collection collection_name=$collection->url product_name=$product->next_product->url}">następny &raquo;</a>
				{else}
				<a href="{reverse_url name=shop_product product_name=$product->next_product->url}">następny &raquo;</a>		
				{/if}
			{/if}
		</div>
		{/if}
	</div>
	<!-- END PRODUCT DESCRIPTION -->
	
	<div class="clearFix"></div>
	
	<h2 class="header">
		{if isset($category)}
		<span>Sprawdź całą kategorię {$category->title}</span>
		<a href="{reverse_url name='shop_category' category_name=$category->url}">Cała kategoria &raquo;</a>
		{elseif isset($collection)}
		<span>Sprawdź całą kolekcję {$collection->title}</span>
		<a href="{reverse_url name='shop_collection' collection_name=$collection->url}">Cała kolekcja &raquo;</a>
		{else}
		{*<span>Sprawdź całą kategorię {$categories->kuchnia->title}</span>
		<a href="{reverse_url name='shop_category' category_name=$category->url}">Cała kategoria &raquo;</a>*}
		{/if}
	</h2>
	
	{if isset($category)} {assign var="products" value=$category->getProducts(4)}
	{elseif isset($collection)} {assign var="products" value=$collection->getProducts(4)}
	{else} {*{assign var="products" value=$categories->kuchnia->getProducts(4)}*}
	{/if}
	
	{if isset($products)}
	<ul class="productList">
		{foreach from=$products item="p" name="list"}
		<li{if $smarty.foreach.list.iteration % 4 == 0} class="last"{/if}>
			{if isset($category)}
			<a href="{reverse_url name=shop_product_within_category category_name=$category->url product_name=$p->url}">
			{elseif isset($collection)}
			<a href="{reverse_url name=shop_product_within_collection collection_name=$collection->url product_name=$p->url}">
			{else}
			<a href="{reverse_url name=shop_product_within_category category_name=$categories->kuchnia->url product_name=$p->url}">
			{/if}
				<div>
					<img src='{$p->main_image|product_img_url:th160}' alt="" />
				</div>
				<span><strong>{$p->name|truncate:16}</strong></span>
				<span class="price">{if $p->price_differ}od {/if}{$p->price_min|money} {$shop->currency}</span>
			</a>
		</li>
		{/foreach}
	</ul>
	{/if}
</div>