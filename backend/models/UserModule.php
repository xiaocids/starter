<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "user_module".
 *
 * @property integer $id
 * @property integer $user_id
 * @property string $username
 * @property integer $module_id
 */
class UserModule extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'user_module';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'username', 'module_id'], 'required'],
            [['user_id', 'module_id'], 'integer'],
            [['username'], 'string', 'max' => 60]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('backend', 'ID'),
            'user_id' => Yii::t('backend', 'User ID'),
            'username' => Yii::t('backend', 'Username'),
            'module_id' => Yii::t('backend', 'Module ID'),
        ];
    }
}
