<?php defined('In33hao') or exit('Access Invalid!');?>

<div class="page">
  <div class="fixed-bar">
    <div class="item-title">
      <div class="subject">
        <h3><?php echo $lang['member_index_manage']?></h3>
        <h5><?php echo $lang['member_shop_manage_subhead']?></h5>
      </div>
    </div>
  </div>
  <!-- 操作说明 -->
  <div class="explanation" id="explanation">
    <div class="title" id="checkZoom"><i class="fa fa-lightbulb-o"></i>
      <h4 title="<?php echo $lang['nc_prompts_title'];?>"><?php echo $lang['nc_prompts'];?></h4>
      <span id="explanationZoom" title="<?php echo $lang['nc_prompts_span'];?>"></span> </div>
    <ul>
      <li><?php echo $lang['member_index_help1'];?></li>
      <li><?php echo $lang['member_index_help2'];?></li>
    </ul>
  </div>
  <div id="flexigrid"></div>
</div>
<script type="text/javascript">
$(function(){
    $("#flexigrid").flexigrid({
        url: 'index.php?act=member&op=get_xml',
        colModel : [
            {display: '会员ID', name : 'member_id', width : 40, sortable : true, align: 'center'},
            {display: '会员名称', name : 'member_name', width : 150, sortable : true, align: 'left'},
            {display: '会员手机', name : 'member_mobile', width : 80, sortable : true, align: 'center'},
            {display: '累计佣金(元)', name : 'commission_money', width : 100, sortable : true, align: 'center', className: 'abnormal'},
            {display: '可提现(元)', name : 'no_withdraw_money', width : 100, sortable : true, align: 'center', className: 'abnormal'},
            {display: '已提现(元)', name : 'have_withdraw_money', width : 100, sortable : true, align: 'center', className: 'normal'},
            {display: '会员状态', name : 'member_state', width : 100, sortable : true, align: 'center', className: 'normal'},
            ],
        buttons : [
            ],
        searchitems : [
            {display: '会员ID', name : 'member_id'},
            {display: '会员名称', name : 'member_name'}
            ],
        sortname: "member_id",
        sortorder: "desc",
        title: '商城会员列表'
    });
	
});

</script> 

