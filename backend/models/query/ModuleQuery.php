<?php

namespace backend\models\query;

use backend\models\Module;
/**
 * This is the ActiveQuery class for [[\app\models\Module]].
 *
 * @see \app\models\Module
 */
class ModuleQuery extends Module
{
    /*public function active()
    {
        $this->andWhere('[[status]]=1');
        return $this;
    }*/

    /**
     * @inheritdoc
     * @return \app\models\Module[]|array
     */
//     public function all($db = null)
//     {
//         return parent::all($db);
//     }

    /**
     * @inheritdoc
     * @return \app\models\Module|array|null
//      */
//     public function one($db = null)
//     {
//         return parent::one($db);
//     }
    
    public static function items()
    {
    	$_items = [];
    	$models = self::find()->where(['parent_id'=>0])->orderBy('sort')->all();
    	
    	$_items[0] = "(ROOT)";
    	foreach ($models as $model) {
    		//if ($model->childs)
    		$_items[$model->id] = $model->sort . ' - ' . $model->other_name;
    	}
    	return $_items;
    }
    
    public static function getModuleList()
    {
    	$returnarray = [];
    	foreach (\Yii::$app->modules as $key => $module) {
    		$returnarray[$key] = $key;
    	}
    	return $returnarray;
    }
    
    
}