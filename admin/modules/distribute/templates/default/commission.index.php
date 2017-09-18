<?php defined('In33hao') or exit('Access Invalid!');?>

<div class="page">
  <div class="fixed-bar">
    <div class="item-title">
      <div class="subject">
        <h3>会员佣金明细</h3>
        <h5>会员分销佣金明细列表</h5>
      </div>
    </div>
  </div>
  <!-- 操作说明 -->
  <div class="explanation" id="explanation">
    <div class="title" id="checkZoom"><i class="fa fa-lightbulb-o"></i>
      <h4 title="<?php echo $lang['nc_prompts_title'];?>"><?php echo $lang['nc_prompts'];?></h4>
      <span id="explanationZoom" title="<?php echo $lang['nc_prompts_span'];?>"></span> </div>
    <ul>
      <li>通过佣金明细，你可以查看，查找会员佣金明细</li>
      <li>你可以根据条件搜索佣金明细</li>
    </ul>
  </div>
  <div id="flexigrid"></div>
</div>
<script type="text/javascript">
$(function(){
    $("#flexigrid").flexigrid({
        url: 'index.php?act=commission&op=get_xml',
        colModel : [
            {display: 'ID', name : 'c_id', width : 40, sortable : true, align: 'center'},
            {display: '佣金获得者', name : 'member_name', width : 150, sortable : true, align: 'left'},
            {display: '佣金提供者', name : 'member_fromid_name', width : 150, sortable : true, align: 'center'},
            {display: '佣金(元)', name : 'c_money', width : 100, sortable : true, align: 'center', className: 'abnormal'},
            {display: '分销比例(%)', name : 'c_ratio', width : 100, sortable : true, align: 'center', className: 'abnormal'},
            {display: '分销等级', name : 'c_level', width : 100, sortable : true, align: 'center', className: 'normal'},
            {display: '添加时间', name : 'c_time', width : 100, sortable : true, align: 'center', className: 'normal'},
            {display: 'NOTE', name : 'c_note', width : 100, sortable : true, align: 'lfet', className: 'normal'},
            ],
        buttons : [
            ],
        searchitems : [
            {display: '会员ID', name : 'member_id'},
            ],
        sortname: "member_id",
        sortorder: "desc",
        title: '佣金明细列表'
    });
	
});

</script> 

