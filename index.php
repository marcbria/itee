<?php

/**
 * @defgroup plugins_themes_itee ITEE plugin
 */

/**
 * @file plugins/themes/itee/index.php
 *
 * Copyright (c) 2022 Marc Bria Ramírez
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @ingroup plugins_themes_default-child
 * @brief Wrapper for itee (default child) theme plugin.
 *
 */

require_once('iteeThemePlugin.inc.php');

return new iteeThemePlugin();

?>
