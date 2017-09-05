<?php defined('In33hao') or exit('Access Invalid!');?>
<style type="text/css">
.d_inline {
	display: inline;
}
</style>

<div class="page">
  <div class="fixed-bar">
    <div class="item-title"><a class="back" href="index.php?act=store&op=store" title="返回<?php echo $lang['manage'];?>列表"><i class="fa fa-arrow-circle-o-left"></i></a>
      <div class="subject">
        <h3><?php echo $lang['nc_store_manage'];?> - 编辑会员“<?php echo $output['joinin_detail']['member_name'];?>”的店铺信息</h3>
        <h5><?php echo $lang['nc_store_manage_subhead'];?></h5>
      </div>
    </div>
  </div>
  <div class="homepage-focus" nctype="editStoreContent">
  <div class="title">
  <h3>编辑店铺信息</h3>
    <ul class="tab-base nc-row">
      <li><a class="current" href="javascript:void(0);">店铺信息</a></li>
      <!-- <li><a href="javascript:void(0);">注册信息</a></li> -->
    </ul>
    </div>
    <form id="store_form" method="post">
      <input type="hidden" name="form_submit" value="ok" />
      <input type="hidden" name="store_id" value="<?php echo $output['store_array']['store_id'];?>" />
      <div class="ncap-form-default">
        <dl class="row">
          <dt class="tit">
            <label for="store_name"><em>*</em>店铺名称</label>
          </dt>
          <dd class="opt">
            <input type="text" value="<?php echo $output['store_array']['store_name'];?>" id="store_name" name="store_name" class="input-txt">
            <span class="err"></span>
            <p class="notic"> </p>
          </dd>
        </dl>
        <dl class="row">
          <dt class="tit">
            <label for="store_name">开店时间</label>
          </dt>
          <dd class="opt"><?php echo ($t = $output['store_array']['store_time'])?@date('Y-m-d',$t):'';?><span class="err"></span>
            <p class="notic"> </p>
          </dd>
        </dl>
        <dl class="row">
          <dt class="tit">
            <label for="store_avatar"><em></em>店铺头像</label>
          </dt>
          <dd class="opt">
            <div class="ncsc-upload-thumb store-sns-pic">
            <p>
              <img nctype="normal_img" src="<?php if(empty($output['store_array']['store_avatar'])) echo SHOP_TEMPLATES_URL.'/images/member/default_image.png'; else echo getStoreLogo($output['store_array']['store_avatar']);?> "/>
            </p>
            <input type="hidden" name="store_avatar" id="store_avatar" value="<?php echo $output['store_array']['store_avatar'] ?>" />
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
            <input type="text" value="<?php echo $output['store_array']['store_address'];?>" id="store_address" name="store_address" class="input-txt" />
            <span class="err"></span>
            <p class="notic"></p>
          </dd>
        </dl>
        <dl class="row">
          <dt class="tit">
            <label for="store_phone"><em>*</em>店铺联系方式</label>
          </dt>
          <dd class="opt">
            <input type="text" value="<?php echo $output['store_array']['store_phone'];?>" id="store_phone" name="store_phone" class="input-txt" />
            <span class="err"></span>
            <p class="notic"></p>
          </dd>
        </dl>
        <dl class="row">
          <dt class="tit">
            <label for="store_content"><em></em>店铺介绍</label>
          </dt>
          <dd class="opt">
           <textarea name="store_content" rows="6" class="tarea" id="store_content"><?php echo $output['store_array']['store_content'];?></textarea>
            <span class="err"></span>
            <p class="notic"></p>
          </dd>
        </dl>
        <dl class="row">
          <dt class="tit">
            <label for="state"><?php echo $lang['state'];?></label>
          </dt>
          <dd class="opt">
            <div class="onoff">
              <label for="store_state1" class="cb-enable <?php if($output['store_array']['store_state'] == '1'){ ?>selected<?php } ?>" ><?php echo $lang['open'];?></label>
              <label for="store_state0" class="cb-disable <?php if($output['store_array']['store_state'] == '0'){ ?>selected<?php } ?>" ><?php echo $lang['close'];?></label>
              <input id="store_state1" name="store_state" <?php if($output['store_array']['store_state'] == '1'){ ?>checked="checked"<?php } ?> onclick="$('#tr_store_close_info').hide();" value="1" type="radio">
              <input id="store_state0" name="store_state" <?php if($output['store_array']['store_state'] == '0'){ ?>checked="checked"<?php } ?> onclick="$('#tr_store_close_info').show();" value="0" type="radio">
            </div>
            <span class="err"></span>
            <p class="notic"></p>
          </dd>
        </dl>
        <dl class="row" id="tr_store_close_info">
          <dt class="tit">
            <label for="store_close_info"><?php echo $lang['close_reason'];?></label>
          </dt>
          <dd class="opt">
            <textarea name="store_close_info" rows="6" class="tarea" id="store_close_info"><?php echo $output['store_array']['store_close_info'];?></textarea>
            <span class="err"></span>
            <p class="notic"> </p>
          </dd>
        </dl>
        <div class="bot"><a href="JavaScript:void(0);" class="ncap-btn-big ncap-btn-green" id="submitBtn"><?php echo $lang['nc_submit'];?></a></div>
      </div>
    </form>
<?php if(!($output['store_zizhi'])){?>
    <form id="joinin_form" enctype="multipart/form-data" method="post" action="index.php?act=store&op=edit_save_joinin" style="display:none;">
      <input type="hidden" name="form_submit" value="ok" />
      <input type="hidden" name="member_id" value="<?php echo $output['joinin_detail']['member_id'];?>" />
      <table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
        <thead>
          <tr>
            <th colspan="20">公司及联系人信息</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th class="w150">公司名称：</th>
            <td colspan="20"><input type="text" class="input-txt" name="company_name" value="<?php echo $output['joinin_detail']['company_name'];?>"></td>
          </tr>
          <tr>
            <th>公司所在地：</th>
            <td colspan="20"><input type="hidden" name="company_address" id="company_address" value="<?php echo $output['joinin_detail']['company_address'];?>"></td>
          </tr>
          <tr>
            <th>公司详细地址：</th>
            <td colspan="20"><input type="text" class="txt w300" name="company_address_detail" value="<?php echo $output['joinin_detail']['company_address_detail'];?>"></td>
          </tr>
          <tr>
            <th>公司电话：</th>
            <td><input type="text" class="input-txt" name="company_phone" value="<?php echo $output['joinin_detail']['company_phone'];?>"></td>
            <th>员工总数：</th>
            <td><input type="text" class="txt w70" name="company_employee_count" value="<?php echo $output['joinin_detail']['company_employee_count'];?>">
              &nbsp;人</td>
            <th>注册资金：</th>
            <td><input type="text" class="txt w70" name="company_registered_capital" value="<?php echo $output['joinin_detail']['company_registered_capital'];?>">
              &nbsp;万元 </td>
          </tr>
          <tr>
            <th>联系人姓名：</th>
            <td><input type="text" class="input-txt" name="contacts_name" value="<?php echo $output['joinin_detail']['contacts_name'];?>"></td>
            <th>联系人电话：</th>
            <td><input type="text" class="input-txt" name="contacts_phone" value="<?php echo $output['joinin_detail']['contacts_phone'];?>"></td>
            <th>电子邮箱：</th>
            <td><input type="text" class="input-txt" name="contacts_email" value="<?php echo $output['joinin_detail']['contacts_email'];?>"></td>
          </tr>
        </tbody>
      </table>
      <table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
        <thead>
          <tr>
            <th colspan="20">营业执照信息（副本）</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th class="w150">营业执照号：</th>
            <td><input type="text" class="input-txt" name="business_licence_number" value="<?php echo $output['joinin_detail']['business_licence_number'];?>"></td>
          </tr>
          <tr>
            <th>营业执照所在地：</th>
            <td><input type="hidden" name="business_licence_address" id="business_licence_address" value="<?php echo $output['joinin_detail']['business_licence_address'];?>"></td>
          </tr>
          <tr>
            <th>营业执照有效期：</th>
            <td><input type="text" class="input-txt" name="business_licence_start" id="business_licence_start" value="<?php echo $output['joinin_detail']['business_licence_start'];?>">
              -
              <input type="text" class="input-txt" name="business_licence_end" id="business_licence_end" value="<?php echo $output['joinin_detail']['business_licence_end'];?>"></td>
          </tr>
          <tr>
            <th>法定经营范围：</th>
            <td colspan="20"><input type="text" class="txt w300" name="business_sphere" value="<?php echo $output['joinin_detail']['business_sphere'];?>"></td>
          </tr>
          <tr>
            <th>营业执照<br />
              电子版：</th>
            <td colspan="20"><a nctype="nyroModal"  href="<?php echo getStoreJoininImageUrl($output['joinin_detail']['business_licence_number_elc']);?>"> <img src="<?php echo getStoreJoininImageUrl($output['joinin_detail']['business_licence_number_elc']);?>" alt="" /> </a>
              <input class="w200" type="file" name="business_licence_number_elc"></td>
          </tr>
        </tbody>
      </table>
      <table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
        <thead>
          <tr>
            <th colspan="20">组织机构代码证</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th>组织机构代码：</th>
            <td colspan="20"><input type="text" class="txt w300" name="organization_code" value="<?php echo $output['joinin_detail']['organization_code'];?>"></td>
          </tr>
          <tr>
            <th>组织机构代码证<br/>
              电子版：</th>
            <td colspan="20"><a nctype="nyroModal"  href="<?php echo getStoreJoininImageUrl($output['joinin_detail']['organization_code_electronic']);?>"> <img src="<?php echo getStoreJoininImageUrl($output['joinin_detail']['organization_code_electronic']);?>" alt="" /> </a>
              <input type="file" name="organization_code_electronic"></td>
          </tr>
        </tbody>
      </table>
      <table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
        <thead>
          <tr>
            <th colspan="20">一般纳税人证明：</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th>一般纳税人证明：</th>
            <td colspan="20"><a nctype="nyroModal" href="<?php echo getStoreJoininImageUrl($output['joinin_detail']['general_taxpayer']);?>"> <img src="<?php echo getStoreJoininImageUrl($output['joinin_detail']['general_taxpayer']);?>" alt="" /> </a>
              <input type="file" name="general_taxpayer"></td>
          </tr>
        </tbody>
      </table>
      <table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
        <thead>
          <tr>
            <th colspan="20">开户银行信息：</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th class="w150">银行开户名：</th>
            <td><input type="text" class="txt w300" name="bank_account_name" value="<?php echo $output['joinin_detail']['bank_account_name'];?>"></td>
          </tr>
          <tr>
            <th>公司银行账号：</th>
            <td><input type="text" class="txt w300" name="bank_account_number" value="<?php echo $output['joinin_detail']['bank_account_number'];?>"></td>
          </tr>
          <tr>
            <th>开户银行支行名称：</th>
            <td><input type="text" class="txt w300" name="bank_name" value="<?php echo $output['joinin_detail']['bank_name'];?>"></td>
          </tr>
         <!-- <tr>
            <th>支行联行号：</th>
            <td><input type="text" class="txt w300" name="bank_code" value="<?php echo $output['joinin_detail']['bank_code'];?>"></td>
          </tr>-->
          <tr>
            <th>开户银行所在地：</th>
            <td colspan="20"><input type="hidden" name="bank_address" id="bank_address" value="<?php echo $output['joinin_detail']['bank_address'];?>"></td>
          </tr>
          <!--<tr>
            <th>开户银行许可证<br/>
              电子版：</th>
            <td colspan="20"><a nctype="nyroModal"  href="<?php echo getStoreJoininImageUrl($output['joinin_detail']['bank_licence_electronic']);?>"> <img src="<?php echo getStoreJoininImageUrl($output['joinin_detail']['bank_licence_electronic']);?>" alt="" /> </a>
              <input type="file" name="bank_licence_electronic"></td>
          </tr>-->
        </tbody>
      </table>
      <table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
        <thead>
          <tr>
            <th colspan="20">结算账号信息：</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th class="w150">银行开户名：</th>
            <td><input type="text" class="txt w300" name="settlement_bank_account_name" value="<?php echo $output['joinin_detail']['settlement_bank_account_name'];?>"></td>
          </tr>
          <tr>
            <th>公司银行账号：</th>
            <td><input type="text" class="txt w300" name="settlement_bank_account_number" value="<?php echo $output['joinin_detail']['settlement_bank_account_number'];?>"></td>
          </tr>
          <tr>
            <th>开户银行支行名称：</th>
            <td><input type="text" class="txt w300" name="settlement_bank_name" value="<?php echo $output['joinin_detail']['settlement_bank_name'];?>"></td>
          </tr>
          <!--<tr>
            <th>支行联行号：</th>
            <td><input type="text" class="txt w300" name="settlement_bank_code" value="<?php echo $output['joinin_detail']['settlement_bank_code'];?>"></td>
          </tr>-->
          <tr>
            <th>开户银行所在地：</th>
            <td><input type="hidden" name="settlement_bank_address" id="settlement_bank_address" value="<?php echo $output['joinin_detail']['settlement_bank_address'];?>"></td>
          </tr>
        </tbody>
      </table>
      <table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
        <thead>
          <tr>
            <th colspan="20">税务登记证</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th class="w150">税务登记证号：</th>
            <td><input type="text" class="txt w300" name="tax_registration_certificate" value="<?php echo $output['joinin_detail']['tax_registration_certificate'];?>"></td>
          </tr>
          <!--<tr>
            <th>纳税人识别号：</th>
            <td><input type="text" class="txt w300" name="taxpayer_id" value="<?php echo $output['joinin_detail']['taxpayer_id'];?>"></td>
          </tr>-->
          <tr>
            <th>税务登记证号<br />
              电子版：</th>
            <td><a nctype="nyroModal"  href="<?php echo getStoreJoininImageUrl($output['joinin_detail']['tax_registration_certif_elc']);?>"> <img src="<?php echo getStoreJoininImageUrl($output['joinin_detail']['tax_registration_certif_elc']);?>" alt="" /> </a>
              <input type="file" name="tax_registration_certif_elc"></td>
          </tr>
        </tbody>
      </table>
      <div><a id="btn_fail" class="ncap-btn-big ncap-btn-green" href="JavaScript:void(0);"><?php echo $lang['nc_submit'];?></a></div>
    </form>
<?php }else { ?>
  <form id="joinin_form" enctype="multipart/form-data" method="post" action="index.php?act=store&op=edit_save_joinin" style="display:none;">
    <input type="hidden" name="form_submit" value="ok" />
    <input type="hidden" name="member_id" value="<?php echo $output['joinin_detail']['member_id'];?>" />
    <table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
    <thead>
      <tr>
        <th colspan="20">联系人信息</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th class="w150">个人姓名：</th>
        <td colspan="20"><input type="text" class="txt" name="company_name" value="<?php echo $output['joinin_detail']['company_name'];?>"></td>
      </tr>
      <tr>
        <th>家庭所在地：</th>
        <td colspan="20">
          <input type="hidden" name="company_address" id="company_address" value="<?php echo $output['joinin_detail']['company_address'];?>">
        </td>
      </tr>
      <tr>
        <th>家庭详细地址：</th>
        <td colspan="20"><input type="text" class="txt w300" name="company_address_detail" value="<?php echo $output['joinin_detail']['company_address_detail'];?>"></td>
      </tr>
      <tr>
        <th>联系人姓名：</th>
        <td><input type="text" class="txt" name="contacts_name" value="<?php echo $output['joinin_detail']['contacts_name'];?>"></td>
        <th>联系人电话：</th>
        <td><input type="text" class="txt" name="contacts_phone" value="<?php echo $output['joinin_detail']['contacts_phone'];?>"></td>
        <th>电子邮箱：</th>
        <td><input type="text" class="txt" name="contacts_email" value="<?php echo $output['joinin_detail']['contacts_email'];?>"></td>
      </tr>
      </tr>
      <tr>
	  <th>身份证正面<br/>          电子版：</th>
        <td colspan="20">
          <a nctype="nyroModal"  href="<?php echo getStoreJoininImageUrl($output['joinin_detail']['business_licence_number_electronic']);?>"> <img src="<?php echo getStoreJoininImageUrl($output['joinin_detail']['organization_code_electronic']);?>" alt="" /> </a>
          <input class="w200" type="file" name="organization_code_electronic">
        </td>
	 </tr>
      <tr>
        <th>身份证反面<br/>          电子版：</th>
        <td colspan="20">
          <a nctype="nyroModal"  href="<?php echo getStoreJoininImageUrl($output['joinin_detail']['general_taxpayer']);?>"> <img src="<?php echo getStoreJoininImageUrl($output['joinin_detail']['general_taxpayer']);?>" alt="" /> </a>
          <input type="file" name="general_taxpayer">
        </td>
      </tr>
	  <tr>
        <th>手持身份证<br />五官照片：</th>
        <td colspan="20">
          <a nctype="nyroModal"  href="<?php echo getStoreJoininImageUrl($output['joinin_detail']['business_licence_number_elc']);?>"> <img src="<?php echo getStoreJoininImageUrl($output['joinin_detail']['business_licence_number_elc']);?>" alt="" /> </a>
          <input type="file" name="business_licence_number_elc">
        </td>
      </tr>
    </tbody>
  </table>
  </table>
   <table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
    <thead>
      <tr>
        <th colspan="20">结算账号信息：</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th class="w150">支付宝账号信息：</th>
        <td><input type="text" class="txt w300" name="settlement_bank_account_name" value="<?php echo $output['joinin_detail']['settlement_bank_account_name'];?>"></td>
      </tr>
      <tr>
        <th>支付宝认证姓名：</th>
        <td><input type="text" class="txt w300" name="settlement_bank_account_number" value="<?php echo $output['joinin_detail']['settlement_bank_account_number'];?>"></td>
      </tr>
    </tbody>
  </table>
  <div><a id="btn_fail" class="btn" href="JavaScript:void(0);"><span><?php echo $lang['nc_submit'];?></span></a></div>
</form>
<?php }?>
  </div>
</div>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/common_select.js" charset="utf-8"></script> 
<script type="text/javascript" src="<?php echo ADMIN_RESOURCE_URL;?>/js/jquery.nyroModal.js"></script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/ajaxfileupload/ajaxfileupload.js"></script> 
<script type="text/javascript">
var SHOP_SITE_URL = '<?php echo SHOP_SITE_URL;?>';
$(function(){
    $("#company_address").nc_region();
    $("#business_licence_address").nc_region();
    $("#bank_address").nc_region();
    $("#settlement_bank_address").nc_region();
    $('#end_time').datepicker();
    $('#business_licence_start').datepicker();
    $('#business_licence_end').datepicker();
    $('a[nctype="nyroModal"]').nyroModal();
    $('input[name=store_state][value=<?php echo $output['store_array']['store_state'];?>]').trigger('click');

    //按钮先执行验证再提交表单
    $("#submitBtn").click(function(){
        if($("#store_form").valid()){
            $("#store_form").submit();
        }
    });

    $("#btn_fail").click(function(){
        $("#joinin_form").submit();
    });

    $('#store_form').validate({
        errorPlacement: function(error, element){
            var error_td = element.parent('dd').children('span.err');
            error_td.append(error);
        },
        rules : {
             store_name: {
                 required : true,
                 remote   : '<?php echo urlAdminShop('store', 'ckeck_store_name', array('store_id' => $output['store_array']['store_id']))?>'
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
                required : '<i class="fa fa-exclamation-circle"></i><?php echo $lang['please_input_store_name'];?>',
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

    $('div[nctype="editStoreContent"] > .title').find('li').click(function(){
        $(this).children().addClass('current').end().siblings().children().removeClass('current');
        var _index = $(this).index();
        var _form = $('div[nctype="editStoreContent"]').find('form');
        _form.hide();
        _form.eq(_index).show();
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