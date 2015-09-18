<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Modules');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="module-index">


    <p>
        <?php echo Html::a(Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Module',
]), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
	
	<?php Pjax::begin()?>
    <?php echo GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'parent.name',
            'sort',
            'name',
            'other_name',
            'description',
            'link',
            'icon',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end()?>

</div>
