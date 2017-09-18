<?php
/**
 * 网站设置
 *
 *
 *
 *
 * @好商城提供技术支持 授权请购买shopnc授权
 * @license    http://www.33hao.com
 * @link       交流群号：138182377
 */



defined('In33hao') or exit('Access Invalid!');
class videosControl extends SystemControl{
    private $links = array(
        array('url'=>'act=videos&op=index','text'=>'所有视频'),
        array('url'=>'act=videos&op=lockup_list','text'=>'下架视频')
    );
    public function __construct(){
        parent::__construct();
        Language::read('videos');
    }

    public function indexOp() {

        Tpl::output('top_link',$this->sublink($this->links,'index'));
                        
        Tpl::setDirquna('distribute');
        Tpl::showpage('videos.index');
    }

    public function lockup_listOp(){
         
        Tpl::output('type', 'lockup');
        Tpl::output('top_link',$this->sublink($this->links,'lockup_list'));
                        
       
		Tpl::setDirquna('distribute');
        Tpl::showpage('videos.index');
    }

     /**
     * 视频分类添加
     */
    public function videos_addOp(){
        
        $lang   = Language::getLangContent();
        $model_class = Model('videos');
        if (chksubmit()){
            $insert_array = array();
            $insert_array['vc_id']        = intval($_POST['vc_id']);
            $insert_array['vc_name']     = $_POST['vc_name'];
            $insert_array['videos_title'] = trim($_POST['videos_title']);
            $insert_array['videos_body']= trim($_POST['videos_body']);
            $insert_array['videos_body2']= trim($_POST['videos_body2']);
            $insert_array['videos_state']= trim($_POST['videos_state']);
            $insert_array['videos_addtime']  = time();

            if (!empty($_POST['videos_image'])){
                $insert_array['videos_image'] = $_POST['videos_image'];
            }

            $result = $model_class->addVideos($insert_array);
            if ($result){
                $url = array(
                    array(
                        'url'=>'index.php?act=videos&op=videos_add',
                        'msg'=>$lang['videos_add_again'],
                    ),
                    array(
                        'url'=>'index.php?act=videos&op=index',
                        'msg'=>$lang['videos_add_back_to_list'],
                    )
                );
                $this->log(L('nc_add,videos_index_class').'['.$_POST['gc_name'].']',1);
                showMessage($lang['nc_common_save_succ'],$url);
            }else {
                $this->log(L('nc_add,videos_index_class').'['.$_POST['gc_name'].']',0);
                showMessage($lang['nc_common_save_fail']);
            }
        }

        $vc_list = Model('videos_class') -> getVideosClassList(array());

        Tpl::output('top_link',$this->sublink($this->links,'videos_class_add'));
        Tpl::output('vc_list', $vc_list);

        Tpl::setDirquna('distribute');
        Tpl::showpage('videos.add');
    }

    /**
     * 编辑
     */
    public function videos_editOp(){
        
        $lang   = Language::getLangContent();
        $model_videos = Model('videos');

        if (chksubmit()){
            // 更新分类信息
            $where = array('videos_id' => intval($_POST['videos_id']));
            $update_array = array();
            $update_array['vc_id']        = intval($_POST['vc_id']);
            $update_array['vc_name']     = $_POST['vc_name'];
            $update_array['videos_title'] = trim($_POST['videos_title']);
            $update_array['videos_body'] = trim($_POST['videos_body']);
            $update_array['videos_body2'] = trim($_POST['videos_body2']);
            $update_array['videos_state'] = intval($_POST['videos_state']);

            if (!empty($_POST['videos_image'])){
                $update_array['videos_image'] = $_POST['videos_image'];
            }

            $result = $model_videos->editVideos($update_array, $where);
            if (!$result){
                $this->log(L('nc_edit,videos_index_class').'['.$_POST['videos_title'].']',0);
                showMessage($lang['videos_batch_edit_fail']);
            }

            $url = array(
                array(
                    'url'=>'index.php?act=videos&op=videos_edit&videos_id='.intval($_POST['videos_id']),
                    'msg'=>$lang['videos_batch_edit_again'],
                ),
                array(
                    'url'=>'index.php?act=videos&op=index',
                    'msg'=>$lang['videos_add_back_to_list'],
                )
            );
            $this->log(L('nc_edit,videos_index_class').'['.$_POST['videos_title'].']',1);
            showMessage($lang['videos_batch_edit_ok'],$url,'html','succ',1,5000);
        }

        $vc_list = Model('videos_class')->getVideosClassList(array());
        $videos_info = $model_videos -> getVideosInfo($where); 
        Tpl::output('top_link',$this->sublink($this->links,'videos_class_edit'));

        Tpl::output('vc_list', $vc_list);        
        Tpl::output('videos_info', $videos_info);        
                        
        Tpl::setDirquna('distribute');
        Tpl::showpage('videos.edit');
    }

    /**
     * 违规下架
     */
    public function videos_lockupOp() {
        if (chksubmit()) {
            $videos_id = intval($_POST['videos_id']);
            if ($videos_id <= 0) {
                showDialog(L('nc_common_op_fail'), 'reload');
            }
            $update = array();
            $update['videos_stateremark'] = trim($_POST['close_reason']);

            $where = array();
            $where['videos_id'] = $videos_id;

            Model('videos')->editProducesLockUp($update, $where);
            showDialog(L('nc_common_op_succ'), '', 'succ', '$("#flexigrid").flexReload();CUR_DIALOG.close()');
        }
        $videos_info = Model('videos')->getVideosInfoByID($_GET['id']);
        Tpl::output('videos_info', $videos_info);
                        
        Tpl::setDirquna('distribute');
        Tpl::showpage('videos.close_remark', 'null_layout');
    }

     /**
     * 删除商品
     */
    public function videos_delOp() {
        $videos_id = intval($_GET['id']);
        if ($videos_id <= 0) {
            exit(json_encode(array('state'=>false,'msg'=>'删除失败')));
        }
        Model('videos')->delVideosAll(array('videos_id' => $videos_id));
        $this->log('删除视频[ID:'.$videos_id.']',1);
        exit(json_encode(array('state'=>true,'msg'=>'删除成功')));
    }

     /**
     * 输出XML数据
     */
    public function get_xmlOp() {
        $model_videos = Model('videos');
        $condition = array();
        if ($_GET['videos_title'] != '') {
            $condition['videos_title'] = array('like', '%' . $_GET['videos_title'] . '%');
        }
        if ($_GET['vc_name'] != '') {
            $condition['vc_name'] = array('like', '%' . $_GET['vc_name'] . '%');
        }
        if (intval($_GET['vc_id']) > 0) {
            $condition['vc_id'] = intval($_GET['vc_id']);
        }
        if ($_GET['videos_state'] != '') {
            $condition['videos_state'] = $_GET['videos_state'];
        }
        if ($_POST['query'] != '') {
            $condition[$_POST['qtype']] = array('like', '%' . $_POST['query'] . '%');
        }
        $order = '';
        $param = array('videos_id', 'videos_title', 'videos_state', 'videos_image', 'vc_id'
                , 'vc_name', 'videos_addtime'
        );
        if (in_array($_POST['sortname'], $param) && in_array($_POST['sortorder'], array('asc', 'desc'))) {
            $order = $_POST['sortname'] . ' ' . $_POST['sortorder'];
        }
        $page = $_POST['rp'];

        switch ($_GET['type']) {
            // 下架
            case 'lockup':
                $videos_list = $model_videos->getVideosLockUpList($condition, '*', $page, $order);
                break;
                // 全部商品
            default:
                $videos_list = $model_videos->getVideosCommonList($condition, '*', $page, $order);
                break;
        }


        $data = array();
        $data['now_page'] = $model_videos->shownowpage();
        $data['total_num'] = $model_videos->gettotalnum();
        foreach ($videos_list as $value) {
            $param = array();
            $operation = '';
            switch ($_GET['type']) {
                // 禁售
                case 'lockup':
                    $operation .= "<a class='btn red' href='javascript:void(0);' onclick=\"fg_del('" . $value['videos_id'] . "')\"><i class='fa fa-trash-o'></i>删除</a>";
                    break;
                default:
                    $operation .= "<a class='btn red' href='javascript:void(0);' onclick=\"fg_lonkup('" . $value['videos_id'] . "')\"><i class='fa fa-ban'></i>下架</a>";
                    break;
            }
            $operation .= "<span class='btn'><em><i class='fa fa-cog'></i>设置 <i class='arrow'></i></em><ul>";
            $operation .= "<li><a href='" . urlAdminDistribute('videos', 'videos_edit', array('videos_id' => $value['videos_id'])) . "'>编辑</a></li>";
            $operation .= "<li><a href='" . urlAdminDistribute('videos', 'index', array('videos_id' => $value['videos_id'])) . "' target=\"_blank\">查看视频详细</a></li>";
            $operation .= "</ul>";
            $param['operation'] = $operation;
            $param['videos_title'] = $value['videos_title'];
            $param['videos_image'] = "<a href='javascript:void(0);' class='pic-thumb-tip' onMouseOut='toolTip()' onMouseOver='toolTip(\"<img src=".thumb($value,'60').">\")'><i class='fa fa-picture-o'></i></a>";
            $param['vc_id'] = $value['vc_id'];
            $param['vc_name'] = $value['vc_name'];
            $param['videos_state'] = $value['videos_state'] ==  '1' ? '<span class="yes"><i class="fa fa-check-circle"></i>上架</span>' : '<span class="no"><i class="fa fa-ban"></i>下架</span>';;
            $param['videos_addtime'] = date('Y-m-d', $value['videos_addtime']);
            $data['list'][$value['videos_id']] = $param;
        }
        echo Tpl::flexigridXML($data);exit();
    }

    /**
     * 上传图片
     */
    public function image_uploadOp() {

        //上传图片
        $upload = new UploadFile();
        $upload->set('thumb_width', 500);
        $upload->set('thumb_height',499);
        $upload->set('thumb_ext','_small');
        $upload->set('max_size',C('image_max_filesize')?C('image_max_filesize'):1024);
        $upload->set('ifremove',true);
        $upload->set('default_dir',$_GET['uploadpath']);

        if (!empty($_FILES['normal_file']['tmp_name'])){
            $result = $upload->upfile('normal_file');
            if ($result){
                exit(json_encode(array('status'=>1,'url'=>UPLOAD_SITE_URL.'/'.$_GET['uploadpath'].'/'.$upload->thumb_image, 'name'=>$upload->thumb_image)));
            }else {
                exit(json_encode(array('status'=>0,'msg'=>$upload->error)));
            }
        }
    }

}
