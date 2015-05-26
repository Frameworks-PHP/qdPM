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

<div id="attachmentsList"></div>
<div id="attachmentsLoading"></div>

<div> <input type="file" name="uploadify_file_upload" id="uploadify_file_upload" /> </div>

<script>
var is_file_uploading = null;
$(function() {
        
    $("#uploadify_file_upload").uploadify({
        debug         : false,
        buttonText    : '+ <?php echo __("Add Attachments")?>',
        removeTimeout : 0,                        
        height: '34',    
        width: '220',
        cancelImg: '<?php echo public_path("js/uploadify/uploadify-cancel.png",true) ?>',
        onUploadStart : function(file) { is_file_uploading = true; $("#attachmentsLoading").html(I18NText('Loading...')); },
        onQueueComplete : function(queueData) {is_file_uploading = null },        
        fileSizeLimit : '<?php echo ((int)ini_get("post_max_size")<(int)ini_get("upload_max_filesize") ? (int)ini_get("post_max_size") : (int)ini_get("upload_max_filesize"))?>MB',            
        swf           : '<?php echo public_path("js/uploadify/uploadify.swf",true) ?>',
        uploader      : '<?php echo url_for("attachments/upload?bind_type=" . $bind_type . "&bind_id=" . $bind_id . "&uploadify=onUpload&" . session_name() . "=" . session_id(), true)?>',            
        onUploadComplete : function(file) {
        
          $.ajax({
            type: 'POST',
            url: "<?php echo  url_for('attachments/saveInfo') ?>",
            data: $('.attachments_textarea').serializeArray(),
            success: function(data) {              
              $("#attachmentsList").load("<?php echo  url_for('attachments/preview?bind_type=' . $bind_type . '&bind_id=' . $bind_id ) ?>",function(){
                $("#attachmentsLoading").html('');
              });
            }
          });
              
        }            
    });
    
    $("#attachmentsList").load("<?php echo  url_for('attachments/preview?bind_type=' . $bind_type . '&bind_id=' . $bind_id ) ?>");
    
    $('button[type=submit]').bind('click',function(){ 
                  
      if(is_file_uploading)
      {
        alert('<?php echo __("Please wait. Files are loading.") ?>'); return false;
      }         
            
    });            
});

</script>

