<?php
define('UC_AUTH_KEY', ']-%k?8:XOPF}Vis(>3Wf|6rp74!_9{@vT*[yMDnw'); //加密KEY

return array(
	
	
		
	/* 模板相关设置 */
	'TMPL_PARSE_STRING'=>array(
		'__STATIC__'=>__ROOT__.'/Public/static',
		'__IMG__'=>__ROOT__.'/Public/'.MODULE_NAME.'/images',
		'__CSS__'=>__ROOT__.'/Public/'.MODULE_NAME.'/css',
		'__JS__'=>__ROOT__.'/Public/'.MODULE_NAME.'/js',
	),
	/* 	后台错误页面模板 */
	'TMPL_ACTION_ERROR'=>MODULE_PATH.'View/Public/error.html',
	'TMPL_ACTION_SUCCESS'=>MODULE_PATH.'View/Public/success.html',
	'TMPL_EXCEPTION_FILE'=>MODULE_PATH.'View/Public/exception.html',
		
	/* 语言包配置 */
	'LANG_SWITCH_ON' => true,
	'LANG_AUTO_DETECT' => FALSE, // 自动侦测语言 开启多语言功能后有效
	'LANG_LIST'        => 'zh-cn,en-us', // 允许切换的语言列表 用逗号分隔
	'VAR_LANGUAGE'     => 'l', // 默认语言切换变量
		
);