<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Module */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Module',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Modules'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="module-create">

    <?php echo $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
