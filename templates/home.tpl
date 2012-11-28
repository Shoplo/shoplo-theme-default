<!-- BANNER BOX -->
<div id="banner" class="clearFix">
	<a href="" class="buttons prev"></a>
	<div class="viewport"> 
		<ul class="overview images clearFix">
			{foreach from=$banners->home_page->items item="banner" name="banner_list"}
           	<li data-duration="{$banner->duration}"> 
				<div class="img"> 
					<a href="{$banner->url}"><img src="{$banner->image}" alt="{$banner->title}" /></a> 
				</div>		            	
			</li>
           	{/foreach}
		</ul> 
	</div> 
	<div class="pageDiv pager"> 
		<ul class="pager">
			{foreach from=$banners->home_page->items item="banner" name="banner_list"}
				<li><a rel="{$smarty.foreach.banner_list.index}" class="pagenum" href="{$banner->url}"></a></li>
			{/foreach}
		</ul> 
	</div> 
	<a href="" class="buttons next"></a>
</div>
<!-- END BANNER BOX -->

<!-- FRONTPAGE COLLECTION LIST -->
{if $collections->{$settings->frontpage_collection}}
<h2>{$collections->{$settings->frontpage_collection}->title}</h2>
<ul class="productList">
	{assign var="products" value=$collections->{$settings->frontpage_collection}->getProducts()}
	{foreach from=$products item="p" name="list"}
	<li{if $smarty.foreach.list.iteration % 4 == 0} class="last"{/if}>
		<a href="{reverse_url name=shop_product_within_collection collection_name=$collections->{$settings->frontpage_collection}->url product_name=$p->url}">
			<div>
				<img src='{$p->main_image|product_img_url:th160}' alt="" />
			</div>
			<span><strong>{$p->name|truncate:24}</strong></span>
			<span class="price">{$p->price_min|money} {$shop->currency}</span>
		</a>
	</li>
	{/foreach}
</ul>
{/if}
<!-- END FRONTPAGE COLLECTION LIST -->

<div class="clear"></div>

<div class="floatLeft smartBox newsletter">
	<h4>Zapisz się na newsletter:</h4>
	<p>Chcesz otrzymywać nowości? Zostaw swój adres email:</p>
	<form action="{reverse_url name='shop_newsletter'}" method="post">
		<fieldset>
			<input type="text" name="email" def="Adres email" />
			<input type="submit" value="Zapisz się" />
		</fieldset>
	</form>
</div>

<div class="floatLeft smartBox">

	
	<iframe src="//www.facebook.com/plugins/likebox.php?href={$settings->facebook_link}&amp;width=320&amp;height=62&amp;colorscheme=light&amp;show_faces=false&amp;border_color&amp;stream=false&amp;header=true&amp;appId=190000757697766" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:320px; height:62px;" allowTransparency="true"></iframe>
</div>