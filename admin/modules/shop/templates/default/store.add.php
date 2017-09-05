<?php defined('In33hao') or exit('Access Invalid!');?>

<div class="page">
  <div class="fixed-bar">
    <div class="item-title"><a class="back" href="index.php?act=store&op=list" title="返回列表"><i class="fa fa-arrow-circle-o-left"></i></a>
      <div class="subject">
        <h3>店铺 - <?php echo $lang['nc_new'];?>"</h3>
        <h5>商城店铺相关设置与管理</h5>
      </div>
    </div>
  </div>
  <!-- 操作说明 -->
  <div class="explanation" id="explanation">
    <div class="title" id="checkZoom"><i class="fa fa-lightbulb-o"></i>
      <h4 title="<?php echo $lang['nc_prompts_title'];?>"><?php echo $lang['nc_prompts'];?></h4>
      <span id="explanationZoom" title="<?php echo $lang['nc_prompts_span'];?>"></span> </div>
    <ul>
      <li>新增的店铺默认为开启状态，新增后，请手动编辑店铺的其它初始信息</li>
      <li>新增店铺默认没有绑定经营类目，请手动绑定其经营类目</li>
      <li>新增店铺将自动创建店主会员账号（用于登录网站会员中心）以及商家账号（用于登录商家中心）</li>
    </ul>
  </div>
  <form id="store_form" method="post">
    <input type="hidden" name="form_submit" value="ok" />
    <input type="hidden" name="store_id" value="<?php echo $output['store_array']['store_id']; ?>" />
    <div class="ncap-form-default">
      <dl class="row">
        <dt class="tit">
          <label for="store_name"><em>*</em>店铺名称</label>
        </dt>
        <dd class="opt">
          <input type="text" value="" id="store_name" name="store_name" class="input-txt" />
          <span class="err"></span>
          <p class="notic"></p>
        </dd>
      </dl>
      <dl class="row">
        <dt class="tit">
          <label for="store_avatar"><em></em>店铺头像</label>
        </dt>
        <dd class="opt">
          <div class="ncsc-upload-thumb store-sns-pic">
          <p><img nctype="normal_img" src="<?php echo SHOP_TEMPLATES_URL?>/images/member/default_image.png"/></p>
          <input type="hidden" name="store_avatar" id="store_avatar" value="" />
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
            此处为店铺方形头像：<br />
            <span style="color: orange;">建议使用宽180像素-高120像素内的GIF或PNG透明图片；点击下方"提交"按钮后生效。</span></p>
        </dd>
      </dl>
      <dl class="row">
        <dt class="tit">
          <label for="store_address"><em>*</em>店铺地址</label>
        </dt>
        <dd class="opt">
          <input type="text" value="" id="store_address" name="store_address" class="input-txt" />
          <span class="err"></span>
          <p class="notic"></p>
        </dd>
      </dl>
      <dl class="row">
        <dt class="tit">
          <label for="store_phone"><em>*</em>店铺联系方式</label>
        </dt>
        <dd class="opt">
          <input type="text" value="" id="store_phone" name="store_phone" class="input-txt" />
          <span class="err"></span>
          <p class="notic"></p>
        </dd>
      </dl>
      <dl class="row">
        <dt class="tit">
          <label for="store_content">店铺介绍</label>
        </dt>
        <dd class="opt">
         <textarea name="store_content" rows="6" class="tarea" id="store_content"></textarea>
          <span class="err"></span>
          <p class="notic"></p>
        </dd>
      </dl>
      <dl class="row">
        <dt class="tit">
          <label><?php echo $lang['state'];?></label>
        </dt>
        <dd class="opt">
          <div class="onoff">
          <label for="store_state_enabled" class="cb-enable selected" title="是">是</label>
          <label for="store_state_disabled" class="cb-disable" title="否">否</label>
          <input id="store_state_enabled" name="store_state" checked="checked" value="1" type="radio">
          <input id="store_state_disabled" name="store_state" value="0" type="radio">
          </div>
          <p class="notic"></p>
        </dd>
      </dl>
      <div class="bot"><a href="JavaScript:void(0);" class="ncap-btn-big ncap-btn-green" id="submitBtn"><?php echo $lang['nc_submit'];?></a></div>
    </div>
  </form>
</div>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/ajaxfileupload/ajaxfileupload.js"></script> 
<script type="text/javascript">
$(function(){

  //按钮先执行验证再提交表单
  $("#submitBtn").click(function(){
      if($("#store_form").valid()){
          $("#store_form").submit();
      }
  });

  $('#store_form').validate({
      errorPlacement: function(error, element){
          var error_td = element.parent('dd').children('span.err');
          error_td.append(error);
      },
      rules : {
          store_name: {
              required : true,
              remote   : '<?php echo urlAdminShop('ownshop', 'ckeck_store_name')?>'
          },
          store_address: {
              required : true
          },
          store_phone: {
              required : true
          },
      },
      messages : {
          store_name: {
              required : '<i class="fa fa-exclamation-circle"></i>请输入店铺名称',
              remote   : '<i class="fa fa-exclamation-circle"></i>店铺名称已存在'
          },
          store_address: {
              required : '<i class="fa fa-exclamation-circle"></i>请输入店铺地址',
          },
          store_phone: {
              required : '<i class="fa fa-exclamation-circle"></i>请输入店铺联系方式',
          }
      }
  });

  // 图片上传js
  $('#normal_file').unbind().live('change', function(){
    
    // $('img[nctype="normal_img"]').attr('src',SHOP_TEMPLATES_URL+"/images/loading.gif");

    $.ajaxFileUpload
    (
      {
        url:'index.php?act=store&op=image_upload&uploadpath=<?php echo ATTACH_STORE;?>',
        secureuri:false,
        fileElementId:'normal_file',
        dataType: 'json',
         success: function (data, status)
        {
          if(typeof(data.error) != 'undefind'){
            $('img[nctype="normal_img"]').attr('src',data.url);
            $('#store_avatar').val(data.name);
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
