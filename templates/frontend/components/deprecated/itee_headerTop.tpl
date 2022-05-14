{capture assign="homeUrl"}
	{if $currentContext && $multipleContexts}
		{url page="index" router=$smarty.const.ROUTE_PAGE}
	{else}
		{url context="index" router=$smarty.const.ROUTE_PAGE}
	{/if}
{/capture}

{* Set some vars *}
{$headerTopImage=$currentContext->getLocalizedData('journalThumbnail')}
{$headerTopImagePath="https://dummyimage.com/460x50/5A71A6/cccccc"}
{if isset($headerTopImage.uploadName)}
	{$headerTopImagePath="{$publicFilesDir}/{$headerTopImage.uploadName}"}
{/if}
{$headerTopImageAlt="A placeholder for your top image/logo that is still not set"}
{if $headerTopImage.altText != ''}
	{$headerTopImageAlt=$headerTopImage.altText}
{/if}

<div class="headerTop">
	<div class="pkp_site_name_wrapper">
		{* Owners: ReDi & UAB *}
		<div class="headerTop__item owners">
			<a href="https://revistes.uab.cat" class="is_img">
				<img class="owners_logo" src="{$iteeThemePath}/templates/images/logoReDi-thumb.png" />
			</a>
			<a href="https://www.uab.cat" class="is_img">
				<img class="owners_logo" src="{$iteeThemePath}/templates/images/logoUAB-thumb.png" />
			</a>
		</div>

		{* Top Image (aka. homepageImage) *}
		{$headerTopImagePath="{$publicFilesDir}/{$headerTopImage.uploadName}"}
		<div class="headerTop__item journalLogo">
			<a href="{$homeUrl}" role="img" class="is_img" style="background-image: url('{$headerTopImagePath}');" aria-label="{$headerTopImageAlt|escape}"></a>
		</div>

		{* Nav: menuUser (topRight) *}
		<div class="headerTop__item menuUser">
			<div class="pkp_navigation_user_wrapper" id="navigationUserWrapper">
				{* Minimal searcher (icon+link) *}
				<a href="{url router=$smarty.const.ROUTE_PAGE page="search" op="search"}" class="userMenu__search">
					<span aria-hidden=”true” aria-label='{translate key="common.search"}'></span>
				</a>

				{* Language Toggle menu *}
				{include file="frontend/components/languageSwitcher.tpl" id="languageNav"}

				{* User Profile menu *}
				{load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user" liClass="profile"}
			</div>
		</div>
	</div>
</div>
