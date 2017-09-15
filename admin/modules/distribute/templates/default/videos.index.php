<?php defined('In33hao') or exit('Access Invalid!');?>

<div class="page">
  <div class="fixed-bar">
    <div class="item-title">
      <div class="subject">
        <h3>视频管理</h3>
        <h5>分销商城所有视频索引及管理</h5>
      </div>
      <?php echo $output['top_link'];?> </div>
  </div>
  <div class="explanation" id="explanation">
    <div class="title" id="checkZoom"><i class="fa fa-lightbulb-o"></i>
      <h4 title="<?php echo $lang['nc_prompts_title'];?>"><?php echo $lang['nc_prompts'];?></h4>
      <span id="explanationZoom" title="<?php echo $lang['nc_prompts_span'];?>"></span> </div>
    <ul>
      <li>上架，当视频处于非上架状态时，前台页面将不能显示，浏览该视频，管理员可控制视频上架状态</li>
      <li>下架，当视频处于下架状态时，前台将不能显示，浏览，购买该商品，管理员可控制视频下架状态</li>
      <li>设置项中可以查看视频详细，编辑视频详情。</li>
    </ul>
  </div>
  <div id="flexigrid"></div>
  <?php if ($output['type'] == '') {?>
  <div class="ncap-search-ban-s" id="searchBarOpen"><i class="fa fa-search-plus"></i>高级搜索</div>
  <div class="ncap-search-bar">
    <div class="handle-btn" id="searchBarClose"><i class="fa fa-search-minus"></i>收起边栏</div>
    <div class="title">
      <h3>高级搜索</h3>
    </div>
    <form method="get" name="formSearch" id="formSearch">
      <div id="searchCon" class="content">
        <div class="layout-box">
          <dl>
            <dt>视频标题</dt>
            <dd>
              <label>
                <input type="text" value="" name="vidoes_title" id="vidoes_title" class="s-input-txt" placeholder="输入视频标题全称或关键字">
              </label>
            </dd>
          </dl>
          <dl>
          <dl>
            <dt>视频分类</dt>
            <dd id="gcategory">
              <input type="hidden" id="cate_id" name="cate_id" value="" class="mls_id" />
              <select class="class-select">
                <option value="0"><?php echo $lang['nc_please_choose'];?></option>
                <?php if(!empty($output['vc_list'])){ ?>
                <?php foreach($output['vc_list'] as $k => $v){ ?>
                <option value="<?php echo $v['vc_id'];?>"><?php echo $v['vc_name'];?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </dd>
          </dl>
          <dl>
            <dt>视频状态</dt>
            <dd>
              <label>
                <select name="videos_state" class="s-select">
                  <option value=""><?php echo $lang['nc_please_choose'];?></option>
                  <option value="1">上架</option>
                  <option value="0">下架</option>
                </select>
              </label>
            </dd>
          </dl>
        </div>
      </div>
      <div class="bottom"><a href="javascript:void(0);" id="ncsubmit" class="ncap-btn ncap-btn-green mr5">提交查询</a><a href="javascript:void(0);" id="ncreset" class="ncap-btn ncap-btn-orange" title="撤销查询结果，还原列表项所有内容"><i class="fa fa-retweet"></i><?php echo $lang['nc_cancel_search'];?></a></div>
    </form>
  </div>
  <script src="<?php echo RESOURCE_SITE_URL;?>/js/common_select.js" charset="utf-8"></script> 
  <script type="text/javascript">
    gcategoryInit('gcategory');
    </script>
  <?php }?>
</div>
<script type="text/javascript">
$(function(){
    $("#flexigrid").flexigrid({
        url: 'index.php?act=videos&op=get_xml&type=<?php echo $output['type'];?>',
        colModel : [
            {display: '操作', name : 'operation', width : 180, sortable : false, align: 'center', className: 'handle'},
            {display: '视频标题', name : 'videos_title', width : 300, sortable : false, align: 'left'},
            {display: '视频图片', name : 'videos_image', width : 60, sortable : true, align: 'center'},
            {display: '分类ID', name : 'vc_id', width : 60, sortable : true, align: 'center'},
            {display: '分类名称', name : 'vc_name', width : 180, sortable : true, align: 'center'},
            {display: '视频状态', name : 'videos_state', width : 120, sortable : true, align: 'center'},
            {display: '发布时间', name : 'videos_addtime', width : 100, sortable : true, align: 'center'}
            ],
        buttons : [
             {display: '<i class="fa fa-plus"></i>新增数据', name : 'add_videos', bclass : 'add', title : '添加一条新数据到列表', onpress : fg_operations }      
            ],
        searchitems : [
            {display: '视频标题', name : 'videos_title'},
            {display: '分类ID', name : 'vc_id'},
            {display: '分类名称', name : 'vc_name'}
            ],
        sortname: "videos_id",
        sortorder: "desc",
        title: '视频列表'
    });


    // 高级搜索提交
    $('#ncsubmit').click(function(){
        $("#flexigrid").flexOptions({url: 'index.php?act=videos&op=get_xml&'+$("#formSearch").serialize(),query:'',qtype:''}).flexReload();
    });

    // 高级搜索重置
    $('#ncreset').click(function(){
        $("#flexigrid").flexOptions({url: 'index.php?act=videos&op=get_xml'}).flexReload();
        $("#formSearch")[0].reset();
    });
});

function fg_operations(name, bDiv) {
    if (name == 'add_videos') {
        window.location.href = 'index.php?act=videos&op=videos_add';
    }
}

//视频下架
function fg_lonkup(ids) {
    _uri = "index.php?act=videos&op=videos_lockup&id=" + ids;
    CUR_DIALOG = ajax_form('videos_lockup', '违规下架理由', _uri, 640);
}

// 删除
function fg_del(id) {
    if(confirm('删除后将不能恢复，确认删除这项吗？')){
        $.getJSON('index.php?act=videos&op=videos_del', {id:id}, function(data){
            if (data.state) {
                $("#flexigrid").flexReload();
            } else {
                showError(data.msg)
            }
        });
    }
}

</script> 
