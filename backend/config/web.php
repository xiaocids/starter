<?php
$config = [
    'homeUrl'=>Yii::getAlias('@backendUrl'),
    'controllerNamespace' => 'backend\controllers',
    'defaultRoute'=>'timeline-event/index',
    'controllerMap'=>[
        'file-manager-elfinder' => [
            'class' => 'mihaildev\elfinder\Controller',
            'access' => ['manager'],
            'disabledCommands' => ['netmount'],
            'roots' => [
                [
                    'baseUrl' => '@storageUrl',
                    'basePath' => '@storage',
                    'path'   => '/',
                    'access' => ['read' => 'manager', 'write' => 'manager']
                ]
            ]
        ]
    ],
    'components'=>[
    	'view' => [
    		'theme' => [
    			'pathMap' => [
    				'@mdm/admin/views/layouts' => '@backend/views/layouts',
    				'@mdm/admin/views/module' => '@backend/views/module',
    				'@mdm/admin/views/system-information' => '@backend/views/system-information',
    				'@mdm/admin/views/user' => '@backend/views/user',
    			],
    		],
    	],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'request' => [
            'cookieValidationKey' => getenv('BACKEND_COOKIE_VALIDATION_KEY')
        ],
        'user' => [
            'class'=>'yii\web\User',
            'identityClass' => 'common\models\User',
            'loginUrl'=>['sign-in/login'],
            'enableAutoLogin' => true,
            'as afterLogin' => 'common\behaviors\LoginTimestampBehavior'
        ],
    	'authManager' => [
    		'class' => 'yii\rbac\DbManager', // or use 'yii\rbac\DbManager'
    	]
    ],
    'modules'=>[
        'i18n' => [
            'class' => 'backend\modules\i18n\Module',
            'defaultRoute'=>'i18n-message/index'
        ],
    	'admin' => [
    		'class' => 'mdm\admin\Module',
    		'defaultRoute'=>'system-information/index',
    		'mainLayout' => '@backend/views/layouts/main.php',
    		'controllerMap' => [
    			'assignment' => [
    				'class' => 'mdm\admin\controllers\AssignmentController',
    				'userClassName' => 'common\models\User',
    				'idField' => 'id'
    			],
    			'user' => 'backend\controllers\UserController',
    			'module' =>'backend\controllers\ModuleController', // add another controller
    			'system-information' => 'backend\controllers\SystemInformationController'
    		],
    	]
    ],
    'as globalAccess'=>[
        'class'=>'\common\behaviors\GlobalAccessBehavior',
        'rules'=>[
            [
                'controllers'=>['sign-in'],
                'allow' => true,
                'roles' => ['?'],
                'actions'=>['login']
            ],
            [
                'controllers'=>['sign-in'],
                'allow' => true,
                'roles' => ['@'],
                'actions'=>['logout']
            ],
            [
                'controllers'=>['site'],
                'allow' => true,
                'roles' => ['?', '@'],
                'actions'=>['error']
            ],
            [
                'controllers'=>['debug/default'],
                'allow' => true,
                'roles' => ['?'],
            ],
            [
                'controllers'=>['user'],
                'allow' => true,
                'roles' => ['administrator'],
            ],
            [
                'controllers'=>['user'],
                'allow' => false,
            ],
            [
                'allow' => true,
                'roles' => ['manager'],
            ]
        ]
    ]
];

if (YII_ENV_DEV) {
    $config['modules']['gii'] = [
        'class'=>'yii\gii\Module',
        'generators' => [
            'crud' => [
                'class'=>'yii\gii\generators\crud\Generator',
                'templates'=>[
                    'yii2-starter-kit' => Yii::getAlias('@backend/views/_gii/templates')
                ],
                'template' => 'yii2-starter-kit',
                'messageCategory' => 'backend'
            ]
        ]
    ];
}

return $config;
