
<div class="eject_con">
  <div id="warning"></div>
  <form id="category_form" method="post" target="_parent" action="index.php?act=store_album&op=album_edit_save">
    <input type="hidden" name="id" value="<?php echo $output['class_info']['aclass_id'];?>" />
    <input type="hidden" name="sort" id="sort" value="<?php echo $output['class_info']['sort'];?>" />
    <dl>
      <dt><i class="required">*</i>相册所属店铺：</dt>
      <dd>
        <input type="text" name="name" id="name" readonly="true" value="<?php echo $output['class_info']['aclass_name'];?>" />
        <input type="hidden" name="store_id" id="album_class_store_id" value="<?php echo $output['class_info']['store_id'];?>" />
      </dd>
    </dl>
    <dl>
      <dt><?php echo $lang['album_class_add_des'].$lang['nc_colon'];?></dt>
      <dd>
        <textarea rows="3" class="textarea w300" name="description" id="description"><?php echo $output['class_info']['aclass_des'];?></textarea>
      </dd>
    </dl>
    <div class="bottom">
      <label class="submit-border">
        <input type="submit" class="submit" value="<?php echo $lang['album_class_add_submit'];?>" />
      </label>
    </div>
  </form>
</div>
<script type="text/javascript">
$(function(){

    $('#category_form').validate({
        errorLabelContainer: $('#warning'),
        invalidHandler: function(form, validator) {
               $('#warning').show();
        },
        submitHandler:function(form){
            ajaxpost('category_form', '', '', 'onerror') 
        },
        rules : {
        	name : {
                required : true,
                maxlength: 20
            },
            description : {
            	maxlength	: 100
            },
            sort : {
            	digits   : true
            }
        },
        messages : {
        	name : {
                required : '<?php echo $lang['album_class_add_name_null'];?>',
                maxlength	: '<?php echo $lang['album_class_add_name_max'];?>'
            },
            description : {
            	maxlength	: '<?php echo $lang['album_class_add_des_max'];?>'
            },
            sort  : {
            	digits   : '<?php echo $lang['album_class_add_sort_digits'];?>'
            }
        }
    });
});
</script>