<!DOCTYPE html>
<html lang="pl" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<!-- META DATA -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Language" content="pl" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">
	<title>{if isset($meta)}{$meta->title}{else}{$shop->name}{/if}</title>
	{if isset($meta)}<meta name="description" content="{$meta->description}" />{/if}
	{if isset($meta)}<meta name="keywords" content="{$meta->keywords}" />{/if}
	<link rel="shortcut icon" type="image/png" href='{"favicon.png"|asset_url}' />
	<!-- END META DATA -->
	
	{"init.css"|asset_url:stylesheet_tag}
	{"style.css"|asset_url:stylesheet_tag}
	
	<script type="text/javascript">
	/*<![CDATA[*/
	{if !$is_https}
		var ROOT = "{$ROOT}";
	{else}
		var ROOT = "{$ROOT|replace:'http':'https'}";
	{/if}
	var AUTH = "{$token}";
	/*]]>*/
	</script>
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	{"jquery.ui.js"|asset_url:script_tag}
	{"jquery.carousel.js"|asset_url:script_tag}
	{"init.js"|asset_url:script_tag}
	
	<!-- FACEBOOK OG DATA -->
	{if $template == 'home'}
	<meta property="og:title" content="{$shop->name}" />
	<meta property="og:type" content="website" />
	<meta property="og:url" content="{$shop->domain}" />
	<meta property="og:image" content="{"logo.png"|asset_url}" alt="{$shop->name}" />
	<meta property="og:site_name" content="{$shop->name}" />
	{/if}
	{if $template == 'product'}
	<meta property="og:title" content="{$product->name}" />
	<meta property="og:type" content="website" />
	<meta property="og:url" content="{reverse_url name='shop_product' product_name=$product->url}" />
	<meta property="og:image" content="{$product->main_image|product_img_url:th160}" alt="{$product->name}" />
	<meta property="og:description" content="{$product->short_description}" />
	<meta property="og:site_name" content="{$shop->name}" />
		{if isset($category) || isset($collection)}
		<link rel="canonical" href="{reverse_url name=shop_product product_name=$product->url}" />
		{/if}
	{/if}
	{if $template == 'collection'}
	{assign prod $collection->products[0]}
	<meta property="og:title" content="{$collection->title}" />
	<meta property="og:type" content="website" />
	<meta property="og:url" content="{reverse_url name='shop_collection' collection_name=$collection->url}" />
	<meta property="og:image" content="{$collection->products[0]->main_image|product_img_url:th160}" />
	<meta property="og:description" content="{$collection->description}" />
	<meta property="og:site_name" content="{$shop->name}" />
	{/if}
	{if $template == 'category'}
	<meta property="og:title" content="{$category->title}" />
	<meta property="og:type" content="website" />
	<meta property="og:url" content="{reverse_url name='shop_category' category_name=$category->url}" />
	<meta property="og:image" content="{$category->products[0]->main_image|product_img_url:th160}" />
	<meta property="og:description" content="{$category->description}" />
	<meta property="og:site_name" content="{$shop->name}" />
	{/if}
	<!-- END FACEBOOK OG DATA -->
	
	{head_content}
</head>
<body id="page-{$template}">
	<div id="wrapper">
		<div id="header" class="clearFix">    
	      	<div class="top clearFix">
	      		<!-- LOGO -->
	      		<div id="logo">
				{if $settings->use_logo_image}
					<a href="{$ROOT}/"><img class="logo_img" src="{"{$settings->content_logo}"|asset_url}" /></a>
				{else}
					<a href="{$ROOT}/">{$shop->name|ucfirst}</a>
				{/if}
			</div>
			 {*
			 <div id="logo">
		          	<a href="{$ROOT}/">{$shop->name|ucfirst}</a>
		          	{if $settings->use_logo_image}LOGO{else}<span></span>{/if}	
			 
			 </div>
			 *}
		      	<!-- END LOGO -->
		      	<!-- SEARCH FORM -->
		      	<div id="nav-search">
		      		<form action="{reverse_url name='shop_search'}" method="get">
		      			<input type="text" name="q" {if isset($query)}value="{$query}" {/if}/>
		      			<input type="submit" value="&raquo;" />
		      		</form>
		      	</div>
		      	<!-- END SEARCH FORM -->
	      	</div>
	      	
	      	<!-- NAVIGATION -->
			<div class="nav clearFix">
			<ul>
	      		{foreach from=$menulists->main_menu->links item="menu"}
				<li{if $template == 'category' && $category->title == $menu->title} class="active"{else if $template == 'list_categories' && 'Sklep online' == $menu->title} class="active"{else if isset($page) and $page->url == $menu->url} class="active"{else if isset($product) and $product_url == $menu->url} class="active"{else if $template == 'home'}{if $menu->url == '/'} class="active"{/if}{/if}>
					<a href="{$menu->url}">{$menu->title}</a>
					{foreach from=$categories->all() item="cat"}
						{if $cat->title == $menu->title}
							{if $cat->has_children}
					<img src="{"arrow_down.png"|asset_url}" />
							{assign "childs" $cat->childs}
							<ul class="horizontal clearFix">
								{foreach from=$childs item="child"}
								<li>
									<a href="{reverse_url name='shop_category' category_name=$child->url}">{$child->title}</a>
									{if $child->has_children}
										{assign "childs2" $child->childs}
										<ul>
											{foreach from=$childs2 item="ch"}
											<li>
												<a href="{reverse_url name='shop_category' category_name=$ch->url}">{$ch->title}</a>
											</li>
											{/foreach}
										</ul>
									{/if}
								</li>
								{/foreach}
							</ul>
							{/if}
						{/if}
					{/foreach}
				</li>
	      		{/foreach}
	      		</ul>
	      		<div class="cart">
	      			Twój koszyk: {if $cart->item_count > 0}<a href="{reverse_url name='shop_cart'}"><span id="cartQuantity">{$cart->item_count}</span> {$cart->item_count|pluralize:'produkt':'produkty':'produktów'}</a>{else}pusty{/if}
	      		</div>
	      	</div>
	       	<!-- END NAVIGATION -->
	    </div>
		
		<div class="clear"></div>
		
		{if isset($messages)} 
			<div class="msg">
				{if $messages.success}
				<p class="success">{$messages.success}</p>
				{elseif $messages.error}
				<p class="error">{$messages.error}</p>
				{/if}
			</div>
		{/if}
		
		<!-- PAGE CONTENT -->
	    <div class="content clearFix">
			{$page_content}
	    </div>
	    <!-- END PAGE CONTENT -->
	
		<!-- FOOTER MENU -->
		<div id="footer" class="clearFix">
		  	<ul class="footerMenu">
		    	{foreach from=$menulists->footer_menu->links item="menu"}
		    	<li><a href="{$menu->url}">{$menu->title}</a></li>
		    	{/foreach}
		  	</ul>
		  	<ul class="services">
		  		<li>
		  			<a href="{$settings->facebook_link}" class="seriveFacebook">&nbsp;</a>
		  		</li>
		  		<li>
		  			<a href="" class="seriveRss">&nbsp;</a>
		  		</li>
		  		<li>
		  			<a href="" class="seriveFlaker">&nbsp;</a>
		  		</li>
		  		<li>
		  			<a href="" class="seriveTwitter">&nbsp;</a>
		  		</li>
		  		<li>
		  			<a href="" class="seriveLinkedIn">&nbsp;</a>
		  		</li>
		  	</ul>
		</div>
		<!-- END FOOTER MENU -->
	</div>
	
	<div class="copyrights clearFix">
		<span class="alignLeft">Copyright &copy; 2012 {$shop->name}</span>
		<span class="alignRight">Sklepy internetowe: <a class="logo" href="http://www.shoplo.com"></a></span>
	</div>
</body>
</html>