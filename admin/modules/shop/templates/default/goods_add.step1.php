<?php defined('In33hao') or exit('Access Invalid!');?>
<div class="page">
  <div class="fixed-bar">
    <div class="item-title"><a class="back" href="index.php?act=goods&op=index" title="返回列表"><i class="fa fa-arrow-circle-o-left"></i></a>
      <div class="subject">
        <h3>商品 - <?php echo $lang['nc_new'];?>"</h3>
        <h5>商城店铺商品添加与管理</h5>
      </div>
    </div>
  </div>
  <!-- 操作说明 -->
  <div class="explanation" id="explanation">
    <div class="title" id="checkZoom"><i class="fa fa-lightbulb-o"></i>
      <h4 title="<?php echo $lang['nc_prompts_title'];?>"><?php echo $lang['nc_prompts'];?></h4>
      <span id="explanationZoom" title="<?php echo $lang['nc_prompts_span'];?>"></span> </div>
    <ul>
      <li>需要管理员选择商品所属店铺</li>
      <li>新增的商品默认为未审核状态，新增后，请手动审核商品</li>
    </ul>
  </div>
  <!-- S setp -->
  <ul class="add-goods-step">
    <li class="current"><i class="icon icon-list-alt"></i>
      <h6>STEP.1</h6>
      <h2>选择商品分类</h2>
      <i class="arrow icon-angle-right"></i> </li>
    <li><i class="icon icon-edit"></i>
      <h6>STEP.2</h6>
      <h2>填写商品详情</h2>
      <i class="arrow icon-angle-right"></i> </li>
    <li><i class="icon icon-camera-retro "></i>
      <h6>STEP.3</h6>
      <h2>上传商品图片</h2>
      <i class="arrow icon-angle-right"></i> </li>
    <li><i class="icon icon-ok-circle"></i>
      <h6>STEP.4</h6>
      <h2>商品发布成功</h2>
    </li>
  </ul>
  <!--S 分类选择区域-->
  <div class="wrapper_search">
    <div class="ncap-form-default">
      <dl class="row">
        <dt class="tit">
          <label class="" for="store_id_change"><em>*</em>所属店铺</label>
        </dt>
        <dd class="opt">
          <div id="gcategory">
            <select class="class-select" style="width: 296px;" id="store_id_change">
              <option value="0"><?php echo $lang['nc_please_choose'];?></option>
              <?php if(!empty($output['store_array'])){ ?>
              <?php foreach($output['store_array'] as $k => $v){ ?>
                <option value="<?php echo $v['store_id'];?>"><?php echo $v['store_name'];?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
          <span class="err"></span>
          <p class="notic">请选择新增加商品所属的店铺</p>
        </dd>
      </dl>
      <dl class="row">
        <dt class="tit">
          <label class="" for="class_div"><em>*</em>商品分类</label>
        </dt>
        <dd class="opt">
          <div id="class_div" class="wp_sort_block">
            <div class="sort_list">
              <div class="wp_category_list">
                <div id="class_div_1" class="category_list">
                  <ul>
                    <?php if(isset($output['goods_class']) && !empty($output['goods_class']) ) {?>
                    <?php foreach ($output['goods_class'] as $val) {?>
                    <li class="" nctype="selClass" data-param="{gcid:<?php echo $val['gc_id'];?>,deep:1,tid:<?php echo $val['type_id'];?>}"> <a class="" href="javascript:void(0)"><i class="fa fa-angle-right"></i><?php echo $val['gc_name'];?></a></li>
                    <?php }?>
                    <?php }?>
                  </ul>
                </div>
              </div>
            </div>
            <div class="sort_list none">
              <div class="wp_category_list blank">
                <div id="class_div_2" class="category_list">
                  <ul>
                  </ul>
                </div>
              </div>
            </div>
            <div class="sort_list none sort_list_last">
              <div class="wp_category_list blank">
                <div id="class_div_3" class="category_list">
                  <ul>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <span class="err"></span>
          <p class="notic hover_tips_cont">
              <span id="commoditydt" class="current_sort">您当前选择的商品类别是<?php echo $lang['nc_colon'];?></span>
              <span id="commoditydd"></span>
          </p>
        </dd>
      </dl>
      <div class="wp_confirm">
        <form method="get" id="goods_add_step1_form">
          <input type="hidden" name="act" value="goods" />
          <input type="hidden" name="op" value="add_step_two" />
          <input type="hidden" name="class_id" id="class_id" value="" />
          <input type="hidden" name="store_id" id="store_id" value="" />
          <input type="hidden" name="t_id" id="t_id" value="" />
          <div class="bottom tc" style="padding-top: 12px;"><a href="JavaScript:void(0);" disabled="disabled" class="ncap-btn-big disabled" id="submitBtn">下一步，填写商品信息</a></div>
        </form>
      </div>
    </div>
  </div>
</div>
<script src="<?php echo RESOURCE_SITE_URL;?>/js/common_select.js"></script> 
<script src="<?php echo RESOURCE_SITE_URL;?>/js/jquery.mousewheel.js"></script> 
<script src="<?php echo ADMIN_RESOURCE_URL;?>/js/goods_add.step1.js"></script> 
<script>

  $("#submitBtn").click(function(){
      if (!$(this).hasClass('disabled') && $("#store_form").valid()) {
          $("#goods_add_step1_form").submit();
      }
  });

  $('#store_id_change').change(function() {
      $('#store_id').val($(this).val());
  });

  $('#goods_add_step1_form').validate({
      errorPlacement: function(error, element){
          var error_td = element.parent('dd').children('span.err');
          error_td.append(error);
      },
      rules : {
          store_id: {
              min : 0
          }
      },
      messages : {
          store_id: {
              required : '<i class="fa fa-exclamation-circle"></i>请选择新增加商品所属的店铺',
          }
      }
  });
</script>

