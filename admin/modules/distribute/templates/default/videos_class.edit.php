<?php defined('In33hao') or exit('Access Invalid!');?>

<div class="page">
  <div class="fixed-bar">
    <div class="item-title"><a class="back" href="index.php?act=videos_class&op=videos_class&vc_id=<?php echo $output['class_array']['vc_id']?>" title="返回视频分类列表"><i class="fa fa-arrow-circle-o-left"></i></a>
      <div class="subject">
        <h3>视频分类管理 - - <?php echo $lang['nc_edit'];?>“<?php echo $output['class_array']['vc_name'];?>”</h3>
        <h5>视频分类管理 - 添加，编辑，删除</h5>
      </div>
    </div>
  </div>
  <div class="explanation" id="explanation">
    <div class="title" id="checkZoom"><i class="fa fa-lightbulb-o"></i>
      <h4 title="<?php echo $lang['nc_prompts_title'];?>"><?php echo $lang['nc_prompts'];?></h4>
      <span id="explanationZoom" title="<?php echo $lang['nc_prompts_span'];?>"></span> </div>
    <ul>
      <li>编辑视频分类详细信息</li>
    </ul>
  </div>
  <form id="videos_class_form" name="goodsClassForm" enctype="multipart/form-data" method="post">
    <input type="hidden" name="form_submit" value="ok" />
    <input type="hidden" name="vc_id" id="vc_id" value="<?php echo $output['class_array']['vc_id'];?>" />
    <div class="ncap-form-default">
      <dl class="row">
        <dt class="tit">
          <label for="vc_name"><em>*</em>分类名称</label>
        </dt>
        <dd class="opt">
          <input type="text" value="<?php echo $output['class_array']['vc_name'];?>" name="vc_name" id="vc_name" maxlength="20" class="input-txt">
          <span class="err"></span>
          <p class="notic">分类标题，请保持6个字以内</p>
        </dd>
      </dl>
      <dl class="row">
        <dt class="tit">
          <label for="vc_description">分类描述</label>
        </dt>
        <dd class="opt">
          <textarea name="vc_description" rows="6"  class="tarea" id="vc_description"><?php echo $output['class_array']['vc_description'];?></textarea>
          <span class="err"></span>
          <p class="notic"></p>
        </dd>
      </dl>
      <dl class="row">
        <dt class="tit">
          <label><?php echo $lang['nc_sort'];?></label>
        </dt>
        <dd class="opt">
          <input type="text" value="<?php echo $output['class_array']['vc_sort'];?>" name="vc_sort" id="vc_sort" class="input-txt">
          <span class="err"></span>
          <p class="notic">数字范围为0~255，数字越小越靠前</p>
        </dd>
      </dl>
      <dl class="row">
        <dt class="tit">
          <label>分类状态</label>
        </dt>
        <dd class="opt">
          <div class="onoff">
          <label for="vc_state_enabled" class="cb-enable <?php echo $output['class_array']['vc_status'] ? 'selected':'';?> " title="显示">显示</label>
          <label for="vc_state_disabled" class="cb-disable <?php echo !$output['class_array']['vc_status'] ? 'selected':'';?> " title="隐藏">隐藏</label>
          <input id="vc_state_enabled" name="vc_status"  <?php echo $output['class_array']['vc_status'] ? 'checked':'';?>  value="1" type="radio">
          <input id="vc_state_disabled" name="vc_status"  <?php echo !$output['class_array']['vc_status'] ? 'checked':'';?>  value="0" type="radio">
          </div>
          <p class="notic"></p>
        </dd>
      </dl>
      <div class="bot"><a href="JavaScript:void(0);" class="ncap-btn-big ncap-btn-green" id="submitBtn"><?php echo $lang['nc_submit'];?></a></div>
    </div>
  </form>
</div>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/common_select.js" charset="utf-8"></script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.mousewheel.js"></script>
<script type="text/javascript" src="<?php echo ADMIN_RESOURCE_URL;?>/js/jquery.nyroModal.js"></script>

<script>
$(function(){

	//按钮先执行验证再提交表单
	$("#submitBtn").click(function(){
	    if($("#videos_class_form").valid()){
	     $("#videos_class_form").submit();
		}
	});

	$('#videos_class_form').validate({
        errorPlacement: function(error, element){
			var error_td = element.parent('dd').children('span.err');
            error_td.append(error);
        },
        rules : {
            vc_name : {
                required : true,
                remote   : {                
                url :'index.php?act=videos_class&op=ajax&branch=check_class_name',
                type:'get',
                data:{
                    vc_name : function(){
                        return $('#vc_name').val();
                    },
                    vc_id : function(){
                        return $('#vc_id').val();
                    }
                  }
                }
            },
            vc_sort : {
                number   : true
            }
        },
        messages : {
            vc_name : {
                required : '<i class="fa fa-exclamation-circle"></i>分类标题不能为空',
                remote   : '<i class="fa fa-exclamation-circle"></i>分类名称已存在，请重新填写'
            },
            vc_sort  : {
                number   : '<i class="fa fa-exclamation-circle"></i>分类排序必须位数字'
            }
        }
    });

});
</script>
