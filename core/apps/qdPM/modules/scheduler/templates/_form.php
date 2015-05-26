<?php
/**
*qdPM
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@qdPM.net so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade qdPM to newer
* versions in the future. If you wish to customize qdPM for your
* needs please refer to http://www.qdPM.net for more information.
*
* @copyright  Copyright (c) 2009  Sergey Kharchishin and Kym Romanets (http://www.qdpm.net)
* @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
*/
?>
<?php if($form->getObject()->isNew()) $form->setDefault('start_date', $sf_request->getParameter('day')) ?>
<?php if($form->getObject()->isNew()) $form->setDefault('end_date', $sf_request->getParameter('day')) ?>
<?php if($form->getObject()->isNew() and $sf_request->getParameter('users_id')>0) $form->setDefault('users_id', $sf_request->getParameter('users_id')) ?>
    
<form class="form-horizontal" role="form" id="scheduler" action="<?php echo url_for('scheduler/'.($form->getObject()->isNew() ? 'create' : 'update').(!$form->getObject()->isNew() ? '?id='.$form->getObject()->getEventId() : '')) ?>" method="post" <?php print 'enctype="multipart/form-data" ' ?>>
<div class="modal-body">
  <div class="form-body">

<?php if (!$form->getObject()->isNew()): ?>
<input type="hidden" name="sf_method" value="put" />
<?php endif; ?>

<?php echo $form->renderHiddenFields(false) ?>
<?php echo input_hidden_tag('users_id', $sf_request->getParameter('users_id')) ?>

<?php echo $form->renderGlobalErrors() ?>


<ul class="nav nav-tabs">
	<li class="active">
    <a href="#tab_general" data-toggle="tab"><?php echo __('General') ?></a>
  </li>	        	
  <li>
    <a href="#tab_attachments" data-toggle="tab"><?php echo __('Attachments') ?></a>
  </li>
</ul>


<div class="tab-content" >
  <div class="tab-pane fade active in" id="tab_general">         
                            
    <div class="form-group">
    	<label class="col-md-3 control-label"><span class="required">*</span> <?php echo $form['event_name']->renderLabel() ?></label>
    	<div class="col-md-9">
    		<?php echo $form['event_name'] ?>
    	</div>
    </div> 
                
    <?php echo ExtraFieldsList::renderFormFileds('events',$form->getObject(),$sf_user)?>
    
    <div class="form-group">
    	<label class="col-md-3 control-label"> <?php echo $form['start_date']->renderLabel() ?></label>
    	<div class="col-md-9">
    		<div class="input-group input-medium date datetimepicker"><?php echo $form['start_date'] ?><span class="input-group-btn"><button class="btn btn-default date-set" type="button"><i class="fa fa-calendar"></i></button></span></div>
    	</div>
    </div>
    
    <div class="form-group">
    	<label class="col-md-3 control-label"> <?php echo $form['end_date']->renderLabel() ?></label>
    	<div class="col-md-9">
    		<div class="input-group input-medium date datetimepicker"><?php echo $form['end_date'] ?><span class="input-group-btn"><button class="btn btn-default date-set" type="button"><i class="fa fa-calendar"></i></button></span></div>        
    	</div>
    </div>
    
    <div class="form-group">
    	<label class="col-md-3 control-label"> <?php echo $form['details']->renderLabel() ?></label>
    	<div class="col-md-9">
    		<?php echo $form['details'] ?>
    	</div>
    </div>
            
  </div>
                      
  <div class="tab-pane fade" id="tab_attachments">    
    <?php include_component('attachments','attachments',array('bind_type'=>'events','bind_id'=>($form->getObject()->isNew()?0:$form->getObject()->getEventId()))) ?>
  </div>
  
</div>

                              
  </div>
</div>

<?php if($form->getObject()->isNew()){ $button_delete = ''; }else{ $button_delete = link_to(__('Delete'),'scheduler/delete?id=' . $form->getObject()->getEventId() . '&users_id=' . $form->getObject()->getUsersId(),array('confirm'=>__('Are you sure?'))) . '&nbsp;&nbsp;';} ?>
        
<?php echo ajax_modal_template_footer(__('Save'),$button_delete) ?>  

</form>

<?php include_partial('global/formValidator',array('form_id'=>'scheduler')); ?>




