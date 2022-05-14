{**
 * templates/frontend/components/languageSwitcher.tpl
 *
 * Copyright (c) 2022 Marc Bria Ramírez
 * Copyright (c) 2014-2016 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief A re-usable template for displaying a language switcher dropdown.
 *
 * @uses $currentLocale string Locale key for the locale being displayed
 * @uses $languageToggleLocales array All supported locales
 * @uses $id string A unique ID for this language toggle
 *}

{if $supportedLocales && $supportedLocales|@count > 1}
	<ul id="{$id|escape}" class="dropdown language-toggle nav pkp_nav_list">
		<li class="languageToggle">
			<a id="languageToggleMenu{$id|escape}" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				{translate key="plugins.themes.itee.language"}{* $currentLocale|escape *}
			</a>

			<ul class="dropdown-menu" aria-labelledby="languageToggleMenu{$id|escape}">
				{foreach from=$supportedLocales item="localeName" key="localeKey"}
					{if $localeKey !== $currentLocale}
					<li class="languageToggleMenu__item">
						<a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}">
							{$localeName|escape}
						</a>
					</li>
					{/if}
				{/foreach}
			</ul>
		</li>
	</ul>
{/if}
