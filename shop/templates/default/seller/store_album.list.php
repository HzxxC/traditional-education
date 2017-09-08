<?php defined('In33hao') or exit('Access Invalid!');?>

<div class="tabmenu">
  <?php include template('layout/submenu'); ?>
  <a uri="index.php?act=store_album&op=album_add" nc_type="dialog" dialog_title="<?php echo $lang['album_class_add'];?>" class="ncbtn ncbtn-mint" style="right: 100px;"><i class="icon-folder-open "></i><?php echo $lang['album_class_add'];?></a>
  <?php if(!empty($output['aclass_info'])){?>
  <a id="open_uploader" href="JavaScript:void(0);" class="ncbtn ncbtn-aqua"><i class="icon-cloud-upload"></i><?php echo $lang['album_class_list_img_upload'];?></a>
  <div class="upload-con" id="uploader" style="display: none;">
    <form method="post" action="" id="fileupload" enctype="multipart/form-data">
      <div class="upload-con-div"><?php echo $lang['album_class_list_sel_img_class'].$lang['nc_colon'];?>
        <input type="hidden" name="store_id" id="add_img_store_id" value="<?php echo $output['aclass_info'][0]['store_id'] ?>" />
        <select name="category_id" id="category_id" class="select w80">
          <?php foreach ($output['aclass_info'] as $k => $v){?>
          <option value='<?php echo $v['aclass_id']?>' class="w80" data-id="<?php echo $v['store_id']?>"><?php echo $v['aclass_name']?></option>
          <?php }?>
        </select>
      </div>
      <div class="upload-con-div">选择文件：
        <div class="ncsc-upload-btn"> <a href="javascript:void(0);"><span>
          <input type="file" hidefocus="true" size="1" class="input-file" name="file" multiple="multiple"/>
          </span>
          <p><i class="icon-upload-alt"></i><?php echo $lang['album_class_list_img_upload'];?></p>
          </a> </div>
      </div>
      <div nctype="file_msg"></div>
      <div class="upload-pmgressbar" nctype="file_loading"></div>
      <div class="upload-txt"><span><?php echo $lang['album_batch_upload_description'].$output['setting_config']['image_max_filesize'].'KB'.$lang['album_batch_upload_description_1'];?></span> </div>
    </form>
  </div>
  <?php }?>
</div>
<div id="pictureIndex" class="ncsc-picture-folder">
  <table class="search-form">
    <tbody>
      <tr>
        <td>&nbsp;</td>
        <th>所属店铺</th>
        <td class="w160">
          <form name="select_store" id="select_store" class="sortord">
            <input type="hidden" name="act" value="store_album" />
            <input type="hidden" name="op" value="album_cate" />
            <select name="store_id" class="w150" id="store_id">
              <option value="0"><?php echo $lang['nc_please_choose'];?></option>
              <?php if (is_array($output['store_list'])) {?>
              <?php foreach ($output['store_list'] as $val) {?>
              <option value="<?php echo $val['store_id'];?>" <?php if ($_GET['store_id'] == $val['store_id']) {?>selected<?php }?>><?php echo $val['store_name'];?></option>
              <?php }?>
              <?php }?>
            </select>
          </form>
        </td>
      </tr>
    </tbody>
  </table>
  <?php if(!empty($output['aclass_info'])){?>
  <div class="ncsc-album">
    <ul>
      <?php foreach ($output['aclass_info'] as $v){?>
      <li class="hidden">
        <dl>
          <dt>
            <div class="covers"><a href="index.php?act=store_album&op=album_pic_list&id=<?php echo $v['aclass_id']?>&store_id=<?php echo $v['store_id'] ?>">
              <?php if($v['aclass_cover'] != ''){ ?>
              <img id="aclass_cover" src="<?php echo cthumb($v['aclass_cover'], 240, $v['store_id']);?>">
              <?php }else{?>
              <i class="icon-camera-retro"></i>
              <?php }?>
              </a></div>
            <h3 class="title"><a href="index.php?act=store_album&op=album_pic_list&id=<?php echo $v['aclass_id']?>"><?php echo $v['aclass_name'];?></a></h3>
          </dt>
          <dd class="date"><?php echo $lang['album_class_pic_altogether'];?><?php echo $v['count']?><?php echo $lang['album_class_pic_folio'];?></dd>
          <dd class="buttons"><span nc_type="dialog" dialog_title="<?php echo $lang['album_class_deit'];?>" dialog_id='album_<?php echo $v['aclass_id'];?>' dialog_width="480" uri="index.php?act=store_album&op=album_edit&id=<?php echo $v['aclass_id'];?>&store_id=<?php echo $v['store_id'] ?>"><a href="JavaScript:void(0);"><i class="icon-pencil"></i><?php echo $lang['album_class_edit'];?></a></span>
            <?php if($v['is_default'] != '1'){?>
            <a href="javascript:void(0)" onclick="ajax_get_confirm('<?php echo $lang['album_class_delete_confirm_message'];?>', 'index.php?act=store_album&op=album_del&id=<?php echo $v['aclass_id'];?>');"><i class="icon-remove-sign"></i><?php echo $lang['album_class_delete'];?></a>
            <?php }?>
          </dd>
        </dl>
      </li>
      <?php }?>
    </ul>
  </div>
  <?php }else{?>
  <div class="warning-option"><i class="icon-warning-sign">&nbsp;</i><span><?php echo $lang['no_record'];?></span></div>
  <?php }?>
</div>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/fileupload/jquery.iframe-transport.js" charset="utf-8"></script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/fileupload/jquery.ui.widget.js" charset="utf-8"></script>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/fileupload/jquery.fileupload.js" charset="utf-8"></script>
<script type="text/javascript">

$(function() {
    //鼠标触及区域li改变class
    $(".ncsc-album ul li").hover(function() {
        $(this).addClass("hover");
    }, function() {
        $(this).removeClass("hover");
    });
    //凸显鼠标触及区域、其余区域半透明显示
    $(".ncsc-album > ul > li").jfade({
        start_opacity:"1",
        high_opacity:"1",
        low_opacity:".5",
        timing:"200"
    });

    $('#category_id').change(function() {
      $('#add_img_store_id').val($('#category_id option:selected').data('id'));
    });

    // ajax 上传图片
    var upload_num = 0; // 上传图片成功数量
    $('#fileupload').fileupload({
        dataType: 'json',
        url: '<?php echo SHOP_SITE_URL;?>/index.php?act=store_album&op=image_upload',
        add: function (e,data) {
        	$.each(data.files, function (index, file) {
                $('<div nctype=' + file.name.replace(/\./g, '_') + '><p>'+ file.name +'</p><p class="loading"></p></div>').appendTo('div[nctype="file_loading"]');
            });
        	data.submit();
        },
        done: function (e,data) {
            var param = data.result;
            $this = $('div[nctype="' + param.origin_file_name.replace(/\./g, '_') + '"]');
            $this.fadeOut(3000, function(){
                $(this).remove();
                if ($('div[nctype="file_loading"]').html() == '') {
                    setTimeout("window.location.reload()", 1000);
                }
            });
            if(param.state == 'true'){
                upload_num++;
                $('div[nctype="file_msg"]').html('<i class="icon-ok-sign">'+'</i>'+'<?php echo $lang['album_upload_complete_one'];?>'+upload_num+'<?php echo $lang['album_upload_complete_two'];?>');

            } else {
                $this.find('.loading').html(param.message).removeClass('loading');
            }
        }
    });

});

$(function(){
	$("#store_id").change(function(){
		$('#select_store').submit();
	});
});
</script>
