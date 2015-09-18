<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Module */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => 'Module',
]) . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Modules'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update');
?>
<div class="module-update">

    <?php echo $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
