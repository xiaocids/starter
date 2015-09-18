<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "module".
 *
 * @property integer $id
 * @property integer $parent_id
 * @property integer $sort
 * @property string $name
 * @property string $other_name
 * @property string $description
 * @property string $link
 * @property string $icon
 */
class Module extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'module';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['parent_id', 'sort'], 'integer'],
            [['name'], 'required'],
            [['name', 'other_name'], 'string', 'max' => 50],
            [['description', 'link', 'icon'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('backend', 'ID'),
            'parent_id' => Yii::t('backend', 'Parent ID'),
            'sort' => Yii::t('backend', 'Sort'),
            'name' => Yii::t('backend', 'Name'),
            'other_name' => Yii::t('backend', 'Other Name'),
            'description' => Yii::t('backend', 'Description'),
            'link' => Yii::t('backend', 'Link'),
            'icon' => Yii::t('backend', 'Icon'),
        ];
    }

    public function getParent()
    {
    	return $this->hasOne(self::className(), ['id'=>'parent_id']);
    }

}
