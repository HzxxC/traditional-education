<?php defined('In33hao') or exit('Access Invalid!');?>

<div class="page">
  <div class="fixed-bar">
    <div class="item-title">
      <div class="subject">
        <h3>分销设置</h3>
        <h5>分销相关基础设置及功能设置选项</h5>
      </div>
      <?php echo $output['top_link'];?></div>
  </div>
  <form method="post" enctype="multipart/form-data" name="form1">
    <input type="hidden" name="form_submit" value="ok" />
    <div class="ncap-form-default">
      <dl class="row">
        <dt class="tit">
          <label for="site_video_price"><?php echo $lang['fx_video_price'];?></label>
        </dt>
        <dd class="opt">
          <input id="site_video_price" class="w60" type="text" value="<?php echo $output['list_setting']['site_video_price']; ?>" name="site_video_price">
          元<span class="err"></span>
          <p class="notic"><?php echo $lang['fx_video_price_notice'];?></p>
        </dd>
      </dl>
       <dl class="row">
        <dt class="tit">
          <label for="site_first_ratio"><?php echo $lang['fx_first_ratio'];?></label>
        </dt>
        <dd class="opt">
          <input id="site_first_ratio" class="w60" type="text" value="<?php echo $output['list_setting']['site_first_ratio']; ?>" name="site_first_ratio">
          %<span class="err"></span>
          <p class="notic">必须为0-100的整数</p>
        </dd>
      </dl>
       <dl class="row">
        <dt class="tit">
          <label for="site_second_ratio"><?php echo $lang['fx_second_ratio'];?></label>
        </dt>
        <dd class="opt">
          <input id="site_second_ratio" class="w60" type="text" value="<?php echo $output['list_setting']['site_second_ratio']; ?>" name="site_second_ratio">
          %<span class="err"></span>
          <p class="notic">必须为0-100的整数</p>
        </dd>
      </dl>
      <div class="bot"><a href="JavaScript:void(0);" class="ncap-btn-big ncap-btn-green" onclick="document.form1.submit()"><?php echo $lang['nc_submit'];?></a></div>
    </div>
  </form>
</div>
<script type="text/javascript" src="<?php echo ADMIN_RESOURCE_URL;?>/js/jquery.nyroModal.js"></script> 
<script type="text/javascript">

</script> 
