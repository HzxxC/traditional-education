<?php defined('In33hao') or exit('Access Invalid!');?>
<style type="text/css">
.flexigrid .bDiv tr:nth-last-child(2) span.btn ul { bottom: 0; top: auto}
</style>


<div class="page">
  <div class="fixed-bar">
    <div class="item-title">
      <div class="subject">
        <h3>视频分类管理</h3>
        <h5>视频分类的管理，添加，编辑，删除</h5>
      </div>
      <?php echo $output['top_link'];?> </div>
  </div>
  <div class="explanation" id="explanation">
    <div class="title" id="checkZoom"><i class="fa fa-lightbulb-o"></i>
      <h4 title="<?php echo $lang['nc_prompts_title'];?>"><?php echo $lang['nc_prompts'];?></h4>
      <span id="explanationZoom" title="<?php echo $lang['nc_prompts_span'];?>"></span>
    </div>
    <ul>
      <li>视频分类均为一级分类，无子分类</li>
    </ul>
  </div>
  <form method='post'>
    <input type="hidden" name="form_submit" value="ok" />
    <input type="hidden" name="submit_type" id="submit_type" value="" />
    <table class="flex-table">
      <thead>
        <tr>
          <th width="24" align="center" class="sign"><i class="ico-check"></i></th>
          <th width="150" class="handle" align="center"><?php echo $lang['nc_handle'];?></th>
          <th width="60" align="center"><?php echo $lang['nc_sort'];?></th>
          <th width="300" align="left">分类名称</th>
          <th width="80" align="center">分类状态</th>
          <th width="300" align="left">分类描述</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <?php if(!empty($output['class_list']) && is_array($output['class_list'])){ ?>
        <?php foreach($output['class_list'] as $k => $v){ ?>
        <tr data-id="<?php echo $v['vc_id'];?>">
          <td class="sign"><i class="ico-check"></i></td>
          <td class="handle">
            <a class="btn red" href="javascript:void(0);" onclick="fv_del(<?php echo $v['vc_id'];?>);"><i class="fa fa-trash-o"></i><?php echo $lang['nc_del'];?></a>
            <a class="btn blue" href="index.php?act=videos_class&op=videos_class_edit&vc_id=<?php echo $v['vc_id'];?>"><i class="fa fa-pencil-square-o"></i>编辑</a>
          </td>
          <td class="sort"><span title="<?php echo $lang['nc_editable'];?>" column_id="<?php echo $v['vc_id'];?>" fieldname="vc_sort" nc_type="inline_edit" class="editable "><?php echo $v['vc_sort'];?></span></td>
          <td class="name"><span title="<?php echo $lang['nc_editable'];?>"  column_id="<?php echo $v['vc_id'];?>" fieldname="vc_name" nc_type="inline_edit" class="editable "><?php echo $v['vc_name'];?></span></td>
          <td><?php if ($v['vc_status'] == 1) {?><span class="yes"><i class="fa fa-check-circle"></i>允许</span><?php } else {?><span class="no"><i class="fa fa-ban"></i>禁止</span><?php }?></td>
          <td><?php echo $v['vc_description']; ?></td>
          <td></td>
        </tr>
        <?php } ?>
        <?php }else { ?>
        <tr>
          <td class="no-data" colspan="100"><i class="fa fa-exclamation-circle"></i><?php echo $lang['nc_no_record'];?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
  </form>
</div>
<script type="text/javascript" src="<?php echo ADMIN_RESOURCE_URL;?>/js/jquery.edit.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
    $('.flex-table').flexigrid({
        height:'auto',// 高度自动
        usepager: false,// 不翻页
        striped:false,// 不使用斑马线
        resizable: false,// 不调节大小
        title: '视频分类列表',// 表格标题
        reload: false,// 不使用刷新
        columnControl: false,// 不使用列控制
        buttons : [
                   {display: '<i class="fa fa-plus"></i>新增数据', name : 'add', bclass : 'add', onpress : fg_operation },
                   {display: '<i class="fa fa-trash"></i>批量删除', name : 'del', bclass : 'del', title : '将选定行数据批量删除', onpress : fg_operation }
               ]
    });

    $('span[nc_type="inline_edit"]').inline_edit({act: 'videos_class',op: 'ajax'});
});

function fg_operation(name, bDiv) {
    if (name == 'add') {
        window.location.href = 'index.php?act=videos_class&op=videos_class_add';
    } else if (name == 'del') {
        if ($('.trSelected', bDiv).length == 0) {
            showError('请选择要操作的数据项！');
        }
        var itemids = new Array();
        $('.trSelected', bDiv).each(function(i){
            itemids[i] = $(this).attr('data-id');
        });
        fv_del(itemids);
    }
}
function fv_del(ids) {
    if (typeof ids == 'number') {
        var ids = new Array(ids.toString());
    };
    id = ids.join(',');
    if(confirm('删除后将不能恢复，确认删除这项吗？')){
        $.getJSON('index.php?act=videos_class&op=videos_class_del', {id:id}, function(data){
            if (data.state) {
                location.reload();
            } else {
                showError(data.msg)
            }
        });
    }
}
</script>