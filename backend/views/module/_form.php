<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use backend\models\Module;
use backend\models\query\ModuleQuery;

/* @var $this yii\web\View */
/* @var $model backend\models\Module */
/* @var $form yii\bootstrap\ActiveForm */
?>

<div class="module-form">

    <?php $form = ActiveForm::begin(); ?>
    
    <div class="row">
    	<div class="col-md-12">
    	<?php echo $form->errorSummary($model); ?>
    	</div>    	
    </div>
	<div class="row">		
    	<div class="col-md-6">
    	 <?php echo $form->field($model, 'parent_id')->dropDownList(ModuleQuery::items())?>
	
	    <?php echo $form->field($model, 'sort')->input('number') ?>
	
	    <?php echo $form->field($model, 'name')->dropDownList(ModuleQuery::getModuleList()) ?>
	
	    <?php echo $form->field($model, 'other_name')->textInput(['maxlength' => true]) ?>
    	</div>
    	<div class="col-md-6">
    	<?php echo $form->field($model, 'description')->textarea(['rows'=>4]) ?>

	    <?php echo $form->field($model, 'link')->textInput(['maxlength' => true]) ?>
	
	    <?php echo $form->field($model, 'icon')->textInput(['maxlength' => true]) ?>
    	</div>
	</div>
 	<div class="row">
 		<div class="col-md-12">
	 		<div class="form-group">
		        <?php echo Html::submitButton($model->isNewRecord ? Yii::t('backend', 'Create') : Yii::t('backend', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
		    </div>
 		</div>
 	</div>

    <?php ActiveForm::end(); ?>

</div>
