<?php
$aModule = array(
    'id' => 'shoplocator',
    'title' => 'Shop Locator',
    'description' => 'Shop Locator for Oxid CE/PE 4.8.x with Google Api V3 .',
    'thumbnail' => 'logo.png',
    'version' => '1.0.0 alpha',
    'author' => 'Philipp Hecht',
    'github' => 'philhecht',
    'email' => 'info@devsmarter.de',
    'url' => 'http://www.devsmarter.de',
    'extend' => array(),
    'files' => array(
        'admin_shoplocator' => 'shoplocator/application/controllers/admin/admin_shoplocator.php',
        'admin_shoplocator_main' => 'shoplocator/application/controllers/admin/admin_shoplocator_main.php',
        'admin_shoplocator_list' => 'shoplocator/application/controllers/admin/admin_shoplocator_list.php',
        'admin_shoplocator_configuration' => 'shoplocator/application/controllers/admin/admin_shoplocator_configuration.php',
        'shoplocator_list' => 'shoplocator/application/models/shoplocator_list.php',
        'shoplocator' => 'shoplocator/application/models/shoplocator.php',
        'shoplocator_settings' => 'shoplocator/application/models/shoplocator_settings.php',
        'shoplocator_out' => 'shoplocator/application/controllers/shoplocator_out.php',
    ),
    'templates' => array(
        'admin_shoplocator.tpl' => 'shoplocator/application/views/admin/tpl/admin_shoplocator.tpl',
        'admin_shoplocator_main.tpl' => 'shoplocator/application/views/admin/tpl/admin_shoplocator_main.tpl',
        'admin_shoplocator_list.tpl' => 'shoplocator/application/views/admin/tpl/admin_shoplocator_list.tpl',
        'admin_shoplocator_configuration.tpl' => 'shoplocator/application/views/admin/tpl/admin_shoplocator_configuration.tpl',
        'shoplocator_out.tpl' => 'shoplocator/application/views/shoplocator_out.tpl',
        'shoplocator.tpl' => 'shoplocator/widget/shoplocator/shoplocator.tpl',
    ),
    'blocks' => array(
        array(
            'template' => 'layout/sidebar.tpl',
            'block' => 'sidebar',
            'file' => 'out/blocks/sidebar.tpl'
        ),
    )
);
