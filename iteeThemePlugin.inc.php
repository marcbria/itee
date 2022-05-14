<?php

/**
 * @file plugins/themes/itee/iteeThemePlugin.inc.php
 *
 * Copyright (c) 2022 Marc Bria Ramírez
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class iteeThemePlugin
 * @ingroup plugins_themes_itee
 *
 * @brief ITEE theme
 */
import('lib.pkp.classes.plugins.ThemePlugin');

class iteeThemePlugin extends ThemePlugin {

	/**
	 * Initialize the theme's styles, scripts and hooks. This is only run for
	 * the currently active theme.
	 *
	 * @return null
	 */
	public function init() {
		$this->setParent('defaultthemeplugin');

		// Remove the typography options of the parent theme
		// and also dequeue any parent's fonts.
		// `removeOption` was introduced in OJS 3.0.2
		if (method_exists($this, 'removeOption')) {
			$this->removeOption('typography');

			$this->removeStyle('fontNotoSans');
			$this->removeStyle('fontNotoSerif');
			$this->removeStyle('fontNotoSansNotoSerif');
			$this->removeStyle('fontLato');
			$this->removeStyle('fontLora');
			$this->removeStyle('fontLoraOpenSans');
		}

		$this->addStyle(
			'academicons',
			'https://cdn.rawgit.com/jpswalsh/academicons/master/css/academicons.min.css',
			array('baseUrl' => '')
		);

		$this->addStyle(
			'fontCrimsonPro',
			'//fonts.googleapis.com/css?family=Crimson-Pro:200,700',
			array('baseUrl' => '')
		);

		$this->addStyle(
			'fontFiraSansCond',
			'//fonts.googleapis.com/css?family=Fira+Sans+Condensed:100,200,500',
			array('baseUrl' => '')
		);


/*
		$this->addStyle(
			'fontBarlowSemiCondensed',
			'//fonts.googleapis.com/css?family=Barlow+Semi+Condensed:200,700',
			array('baseUrl' => '')
		);

		$this->addStyle(
			'fontsMerriweather',
			'//fonts.googleapis.com/css?family=Merriweather:400',
			array('baseUrl' => '')
		);

		$this->addStyle(
			'fontsMuli',
			'//fonts.googleapis.com/css?family=Muli:300,400,600,700,800',
			array('baseUrl' => '')
		);
*/

		//DEBUG: print_r($this->parent);

/*
		$this->modifyStyle('stylesheet',
					array('addLess' => array('styles/variables.less',
											'styles/mixins.less',
											'styles/reset.less',
											'styles/layout.less',
											'styles/typography.less',
											'styles/decoration.less',
											'styles/pages/article.less',
											'styles/components/header.less',
											'styles/components/breadcrumbs.less',
											'styles/components/sidebar.less',
											'styles/objects/announcement_summary.less',
											'styles/responsive.less')));
*/

		$this->modifyStyle('stylesheet',
					array('addLess' => array('styles/variables.less',
					'styles/reset.less',
					'styles/mixins.less',
					'styles/decoration.less',
					'styles/typography.less')));


/*
		// JS libraries
		// $this->addScript('bsScrollspy', 'js/lib/bootstrap/scrollspy.js');
		$this->addScript('itee', 'js/headerEffect.js');
*/
		// Additional theme information
		HookRegistry::register ('TemplateManager::display', array($this, 'loadTemplateData'));

		// DEBUG: print_r($this);

		// Change the ID of this stylesheet slug to `itee`.
		// This ensures that it won't clash with the parent's stylesheet.
		// $this->addStyle('itee', 'styles/header.less');
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.itee.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.itee.description');
	}

	/**
	 * Fired when the `TemplateManager::display` hook is called.
	 *
	 * @param string $hookname
	 * @param array $args [$templateMgr, $template, $sendContentType, $charset, $output]
	 */
	public function loadTemplateData($hookName, $args) {
		$request = Application::getRequest();

		// Retrieve the TemplateManager
		$templateMgr = $args[0];

		// Template path:
		$templateMgr->assign('iteeThemePath', $request->getBaseUrl() . '/' . $this->getPluginPath());

		$templateMgr->assign('iteeHeaderLogoPath', $request->getBaseUrl() . '/' . $this->getPluginPath());
	}

}

?>
