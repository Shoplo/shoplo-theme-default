{if isset($preview_content)}
	{include file="string:$preview_content"}
{else}
	<h2>{$page_title}</h2>
	
	<div id="pageContent">
		{include file="string:$page_content"}
	</div>
{/if}