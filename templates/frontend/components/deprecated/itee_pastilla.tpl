{**
 * templates/frontend/components/itee_pastilla.tpl
 *
 * Copyright (c) 2022 Marc Bria
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a heading for the current page.
 *
 * @uses $currentTitle string The title to use for the current page.
 * @uses $currentTitleKey string Translation key for title of current page.
 *}

{* Set some vars *}
{$homepageImagePath="https://dummyimage.com/380x460/777777/cccccc&text=380x460+-+Crop:+Bottom-Right"}
{if isset($homepageImage.uploadName)}
	{$homepageImagePath="{$publicFilesDir}/{$homepageImage.uploadName}"}
{/if}
{$homepageImageAlt="A placeholder for your homepage image/logo that is still not set."}
{if $homepageImage.altText != ''}
	{$homepageImageAlt=$homepageImage.altText}
{/if}

{*debug*}

<!-- a href="{$homeUrl}" class="is_img" style="background-image: url('{$homepageImageBackground}');"</a -->

<section class="banner pkp_structure_content" role="banner">

	{* Banner Image (aka. homepageImage) *}
	{$headerTopImagePath="{$publicFilesDir}/{$headerTopImage.uploadName}"}
	<div class="bannerVisual">
		<a href="{$homeUrl}" role="img" class="is_img" style="background-image: url('{$homepageImagePath}');" aria-label="{$homepageImageAlt|escape}"></a>
	</div>

{*	MBR: Keeping this, just in case we need to move back (from background to an image again).
	<!-- div class="bannerVisual">
		<a href="{$homeUrl}" class="is_img">
			{if isset($homepageImage)}
			<img class="bannerVisual__image" src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" {if $homepageImage.altText != ''}alt="{$homepageImage.altText|escape}"{/if}/>
			{else}
			<img class="bannerVisual__image" src="{$dummyImage}" alt="'A journal image that is still not set" />
			{/if}
		</a>
	</div -->
*}

	{* Full-issue galleys *}
	{if $issueGalleys}
	<div class="bannerVisual hover">
		<div class="itee-downlad-icon">
			<section class="galleys">
				<h4 class="sr-only">
					{translate key="issue.tableOfContents"}
				</h4>
				<ul class="galleys_links">
					{foreach from=$issueGalleys item=galley}
						<li>
							{include file="frontend/objects/galley_link.tpl" parent=$issue purchaseFee=$currentJournal->getSetting('purchaseIssueFee') purchaseCurrency=$currentJournal->getSetting('currency')}
						</li>
					{/foreach}
				</ul>
			</section>
		</div>
	</div>
	{/if}
	<div class="bannerIssue">
		{if $issue->getShowVolume() || $issue->getShowNumber() || $issue->getShowYear()}
			{* <a class="issue_summary_title" href="{url op="view" path=$issue->getBestIssueId()}"> *}
			{strip}
			<div class="bannerIssue__volNum">
				{if $issue->getVolume() && $issue->getShowVolume()}
					<span class="currentVolume">{translate key="plugins.themes.itee.vol.abbr"}. {$issue->getVolume()|escape}</span>
				{/if}
				{if $issue->getNumber() && $issue->getShowNumber()}
					<span class="currentNumber">#{$issue->getNumber()|escape}</span>
				{/if}
			</div>
			<div class="bannerIssue__year">
				{if $issue->getYear() && $issue->getShowYear()}
					<span class="currentYear">{$issue->getYear()|escape}</span>
				{/if}
			</div>
			{/strip}
			<!-- /a -->
		{/if}
		<div class="bannerIssue__title">
			{strip}
			{if $issue->getLocalizedTitle() && $issue->getShowTitle()}
				<!-- a class="issue-title" href="{url op="view" path=$issue->getBestIssueId()}" -->
				{$issue->getLocalizedTitle()|escape}
				<!-- /a -->
			{else}
				{translate key="journal.currentIssue"}
			{/if}
			{/strip}
		</div>
	</div>
	<div class="bannerIssue hover">
		{include file="frontend/components/itee_pas_desc.tpl"}
	</div>

</section>
