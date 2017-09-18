<?php defined('In33hao') or exit('Access Invalid!');?>

<div class="page">
  <div class="fixed-bar">
    <div class="item-title"><a class="back" href="index.php?act=videos&op=index" title="返回视频列表"><i class="fa fa-arrow-circle-o-left"></i></a>
      <div class="subject">
        <h3>视频管理 - 编辑“<?php echo $output['videos_info']['videos_title'];?>”</h3>
        <h5>视频管理 - 添加，编辑，删除</h5>
      </div>
    </div>
  </div>
  <form id="videos_form" enctype="multipart/form-data" method="post">
    <input type="hidden" name="form_submit" value="ok" />
    <input type="hidden" name="videos_id" value="<?php echo $output['videos_info']['videos_id']; ?>" />
    <div class="ncap-form-default">
      <dl class="row">
        <dt class="tit">
          <label for="vc_id"><em>*</em>所属分类</label>
        </dt>
        <dd class="opt">
          <select name="vc_id_change" id="vc_id_change">
            <option value="0"><?php echo $lang['nc_please_choose'];?></option>
            <?php if(!empty($output['vc_list']) && is_array($output['vc_list'])){ ?>
            <?php foreach($output['vc_list'] as $k => $v){ ?>
            <option <?php if($output['videos_info']['vc_id'] == $v['vc_id']){ ?>selected='selected'<?php } ?> value="<?php echo $v['vc_id'];?>"><?php echo $v['vc_name'];?></option>
            <?php } ?>
            <?php } ?>
          </select>
          <input type="hidden" name="vc_name" value="<?php echo $output['videos_info']['vc_name']; ?>" id="vc_name" />
          <input type="hidden" name="vc_id" value="<?php echo $output['videos_info']['vc_id']; ?>" id="vc_id" />
          <span class="err"></span>
          <p class="notic">视频所属分类</p>
        </dd>
      </dl>
      <dl class="row">
        <dt class="tit">
          <label for="videos_title"><em>*</em>视频标题</label>
        </dt>
        <dd class="opt">
          <input type="text" value="<?php echo $output['videos_info']['videos_title'];?>" name="videos_title" id="videos_title" maxlength="20" class="input-txt">
          <span class="err"></span>
          <p class="notic">视频标题，不超过30个字</p>
        </dd>
      </dl>
      <dl class="row">
        <dt class="tit">视频图片</dt>
        <dd class="opt">
          <div class="ncsc-upload-thumb store-sns-pic">
          <p><img nctype="normal_img" src="<?php echo getVideosImage($output['videos_info']['videos_image']); ?>"/></p>
          <input type="hidden" name="videos_image" id="videos_image" value="<?php echo $output['videos_info']['videos_image'];?>" />
        </div>
        <div class="handle">
          <div class="ncsc-upload-btn"> <a href="javascript:void(0);"><span>
            <input type="file" hidefocus="true" size="1" class="input-file" name="normal_file" id="normal_file">
            </span>
            <p><i class="icon-upload-alt"></i>图片上传</p>
            </a> 
            </div>
        </div>
          <span class="err"></span>
          <p class="notic">
            <span style="color: orange;">建议使用宽180像素-高120像素内的GIF或PNG透明图片；点击下方"提交"按钮后生效。</span></p>
        </dd>
      </dl>
      <dl class="row">
        <dt class="tit">上传视频</dt>
        <dd class="opt">
          <div class="input-file-show"><span class="type-file-box">
            <input class="type-file-file" nctype="file-brand-pic" id="_pic" name="_pic" type="file" size="30" hidefocus="true" title="点击按钮选择文件并提交表单后上传生效">
            <input type="text" name="brand_pic" id="brand_pic" class="type-file-text" />
            <input type="button" name="button" id="button" value="选择上传..." class="type-file-button" />
            </span></div>
          <span class="err"></span>
          <p class="notic">视频大小限制为100MB，MP4格式</p>
        </dd>
      </dl>
      <dl class="row">
        <dt class="tit">
          <label><em>*</em>学习公告</label>
        </dt>
        <dd class="opt">
          <?php showEditor('videos_body',$output['videos_info']['videos_body']);?>
          <span class="err"></span>
          <p class="notic"></p>
        </dd>
      </dl>
      <dl class="row">
        <dt class="tit">
          <label><em>*</em>推广赚钱</label>
        </dt>
        <dd class="opt">
          <?php showEditor('videos_body2',$output['videos_info']['videos_body2']);?>
          <span class="err"></span>
          <p class="notic"></p>
        </dd>
      </dl>
      <dl class="row">
        <dt class="tit">
          <label>视频状态</label>
        </dt>
        <dd class="opt">
          <div class="onoff">
          <label for="vc_state_enabled" class="cb-enable <?php if($output['videos_info']['videos_state']) echo "selected"; ?>" title="上架">上架</label>
          <label for="vc_state_disabled" class="cb-disable <?php if(!$output['videos_info']['videos_state']) echo "selected"; ?>" title="下架">下架</label>
          <input id="vc_state_enabled" name="videos_state" <?php if($output['videos_info']['videos_state']) echo "checked"; ?> value="1" type="radio">
          <input id="vc_state_disabled" name="videos_state" <?php if(!$output['videos_info']['videos_state']) echo "checked"; ?> value="0" type="radio">
          </div>
          <p class="notic"></p>
        </dd>
      </dl>
      <div class="bot"><a href="JavaScript:void(0);" class="ncap-btn-big ncap-btn-green" id="submitBtn"><?php echo $lang['nc_submit'];?></a></div>
    </div>
  </form>
</div>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/ajaxfileupload/ajaxfileupload.js"></script> 
<script>
$(function(){

  $("#vc_id_change").change(function() {
    $("#vc_id").val($(this).val());
    $("#vc_name").val($("#vc_id_change option:selected").text());
  });

  //按钮先执行验证再提交表单    
	$("#submitBtn").click(function(){
		if($("#videos_form").valid()){
			$("#videos_form").submit();
		}
	});

  //表单验证	
	$('#videos_form').validate({
      errorPlacement: function(error, element){
			var error_td = element.parent('dd').children('span.err');
            error_td.append(error);
        },
        rules : {
            vc_id : {
                min : 1
            },
            videos_title : {
                required : true
            },
            videos_body : {
                required   : true
            },
            videos_body2 : {
                required   : true
            }
        },
        messages : {
            vc_id : {
                min : '<i class="fa fa-exclamation-circle"></i>请选择视频分类',
            },
            videos_title : {
                required : '<i class="fa fa-exclamation-circle"></i>视频标题不能为空',
            },
            videos_body : {
                required : '<i class="fa fa-exclamation-circle"></i>学习公告不能为空',
            },
            videos_body2 : {
                required   : '<i class="fa fa-exclamation-circle"></i>推广赚钱内容不能为空'
            }
        }
  });

  // $('input[nctype="file-videos-pic"]').change(function(){
  //   var filepath=$(this).val();
  //   var extStart=filepath.lastIndexOf(".");
  //   var ext=filepath.substring(extStart,filepath.length).toUpperCase();
  //   if(ext!=".PNG"&&ext!=".GIF"&&ext!=".JPG"&&ext!=".JPEG"){
  //     alert("<?php echo $lang['default_img_wrong'];?>");
  //       $(this).attr('value','');
  //     return false;
  //   }
  // });
    
  // 图片上传js
  $('#normal_file').unbind().live('change', function(){
    
    // $('img[nctype="normal_img"]').attr('src',SHOP_TEMPLATES_URL+"/images/loading.gif");

    $.ajaxFileUpload
    (
      {
        url:'index.php?act=videos&op=image_upload&uploadpath=<?php echo ATTACH_DISTRIBUTE;?>',
        secureuri:false,
        fileElementId:'normal_file',
        dataType: 'json',
         success: function (data, status)
        {
          if(typeof(data.error) != 'undefind'){
            $('img[nctype="normal_img"]').attr('src',data.url);
            $('#videos_image').val(data.name);
          }else{
            alert(data.error);
          }
        },
        error: function (data, status, e)
        {
          alert(e);
        }
      }
    )
    return false;
  });

});
</script> 
