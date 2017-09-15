<?php
/**
 * 商品分类管理
 *
 *
 *
 *
 * @好商城提供技术支持 授权请购买shopnc授权
 * @license    http://www.33hao.com
 * @link       交流群号：138182377
 */



defined('In33hao') or exit('Access Invalid!');
class videos_classControl extends SystemControl{
    private $links = array(
        array('url'=>'act=videos_class&op=videos_class','text'=>'分类管理')
    );
    public function __construct(){
        parent::__construct();
        Language::read('videos');
    }

    public function indexOp() {
        $this->videos_classOp();
    }

    /**
     * 分类管理
     */
    public function videos_classOp(){
        $model_class = Model('videos_class');

        //列表
        $class_list = $model_class->getVideosClassList(3);
        
        Tpl::output('class_list',$class_list);
        Tpl::output('top_link',$this->sublink($this->links,'videos_class'));
        Tpl::setDirquna('distribute');
        Tpl::showpage('videos_class.index');
    }

    /**
     * 视频分类添加
     */
    public function videos_class_addOp(){
        
        $lang   = Language::getLangContent();
        $model_class = Model('videos_class');
        if (chksubmit()){
            $insert_array = array();
            $insert_array['vc_name']        = $_POST['vc_name'];
            $insert_array['vc_sort']        = intval($_POST['vc_sort']);
            $insert_array['vc_description']     = $_POST['vc_description'];
            $insert_array['vc_status']      = intval($_POST['vc_status']);
            $result = $model_class->addVideosClass($insert_array);
            if ($result){
                $url = array(
                    array(
                        'url'=>'index.php?act=videos_class&op=videos_class_add',
                        'msg'=>$lang['videos_class_add_again'],
                    ),
                    array(
                        'url'=>'index.php?act=videos_class&op=goods_class',
                        'msg'=>$lang['videos_class_add_back_to_list'],
                    )
                );
                $this->log(L('nc_add,videos_class_index_class').'['.$_POST['gc_name'].']',1);
                showMessage($lang['nc_common_save_succ'],$url);
            }else {
                $this->log(L('nc_add,videos_class_index_class').'['.$_POST['gc_name'].']',0);
                showMessage($lang['nc_common_save_fail']);
            }
        }

        Tpl::output('top_link',$this->sublink($this->links,'videos_class_add'));
						
		Tpl::setDirquna('distribute');
        Tpl::showpage('videos_class.add');
    }

    /**
     * 编辑
     */
    public function videos_class_editOp(){
        
        $lang   = Language::getLangContent();
        $model_class = Model('videos_class');

        if (chksubmit()){
            // 更新分类信息
            $where = array('vc_id' => intval($_POST['vc_id']));
            $update_array = array();
            $update_array['vc_name']        = $_POST['vc_name'];
            $update_array['vc_sort']        = intval($_POST['vc_sort']);
            $update_array['vc_description']     = $_POST['vc_description'];
            $update_array['vc_status']      = intval($_POST['vc_status']);

            $result = $model_class->editVideosClass($update_array, $where);
            if (!$result){
                $this->log(L('nc_edit,videos_class_index_class').'['.$_POST['vc_name'].']',0);
                showMessage($lang['videos_class_batch_edit_fail']);
            }

            $url = array(
                array(
                    'url'=>'index.php?act=videos_class&op=videos_class_edit&vc_id='.intval($_POST['vc_id']),
                    'msg'=>$lang['videos_class_batch_edit_again'],
                ),
                array(
                    'url'=>'index.php?act=videos_class&op=videos_class',
                    'msg'=>$lang['videos_class_add_back_to_list'],
                )
            );
            $this->log(L('nc_edit,videos_class_index_class').'['.$_POST['gc_name'].']',1);
            showMessage($lang['videos_class_batch_edit_ok'],$url,'html','succ',1,5000);
        }

        $class_array = $model_class->getVideosClassInfoById(intval($_GET['vc_id']));
        if (empty($class_array)){
            showMessage($lang['videos_class_batch_edit_paramerror']);
        }

        Tpl::output('top_link',$this->sublink($this->links,'videos_class_edit'));

        Tpl::output('class_array', $class_array);        
						
		Tpl::setDirquna('distribute');
        Tpl::showpage('videos_class.edit');
    }

    /**
     * 删除分类
     */
    public function videos_class_delOp(){
        if ($_GET['id'] != ''){
            //删除分类
            Model('videos_class')->delVideosClassByGcIdString($_GET['id']);
            $this->log(L('nc_delete,videos_class_index_class') . '[ID:' . $_GET['id'] . ']',1);
            exit(json_encode(array('state'=>true,'msg'=>'删除成功')));
        }else {
            exit(json_encode(array('state'=>false,'msg'=>'删除失败')));
        }
    }

    /**
     * 输出XML数据
     */
    public function get_xmlOp() {
        $model_class_tag = Model('goods_class_tag');
        // 设置页码参数名称
        $condition = array();
        if ($_POST['query'] != '') {
            $condition[$_POST['qtype']] = array('like', '%' . $_POST['query'] . '%');
        }
        $order = '';
        $param = array('gc_tag_id', 'gc_tag_name', 'gc_tag_value', 'gc_id_1', 'gc_id_2', 'gc_id_3');
        if (in_array($_POST['sortname'], $param) && in_array($_POST['sortorder'], array('asc', 'desc'))) {
            $order = $_POST['sortname'] . ' ' . $_POST['sortorder'];
        }

        //店铺列表
        $tag_list = $model_class_tag->getTagList($condition, $_POST['rp'], '*', $order);

        $data = array();
        $data['now_page'] = $model_class_tag->shownowpage();
        $data['total_num'] = $model_class_tag->gettotalnum();
        foreach ((array)$tag_list as $value) {
            $param = array();
            $operation = "<a class='btn blue' href='javascript:void(0)' onclick=\"fg_edit(".$value['gc_tag_id'].")\"><i class='fa fa-pencil-square-o'></i>编辑</a>";
            $param['operation'] = $operation;
            $param['gc_tag_id'] = $value['gc_tag_id'];
            $param['gc_tag_name'] = $value['gc_tag_name'];
            $param['gc_tag_value'] = $value['gc_tag_value'];
            $param['gc_id_1'] = $value['gc_id_1'];
            $param['gc_id_2'] = $value['gc_id_2'];
            $param['gc_id_3'] = $value['gc_id_3'];
            $data['list'][$value['gc_tag_id']] = $param;
        }
        echo Tpl::flexigridXML($data);exit();
    }

    /**
     * ajax操作
     */
    public function ajaxOp(){
        switch ($_GET['branch']){
            /**
             * 更新分类
             */
            case 'vc_name':
                $model_class = Model('videos_class');
                $class_array = $model_class->getVideosClassInfoById(intval($_GET['id']));

                $condition['vc_name'] = trim($_GET['value']);
                $condition['vc_id'] = array('neq', intval($_GET['id']));
                $class_list = $model_class->getVideosClassList($condition);
                if (empty($class_list)){
                    $where = array('vc_id' => intval($_GET['id']));
                    $update_array = array();
                    $update_array['vc_name'] = trim($_GET['value']);
                    $model_class->editVideosClass($update_array, $where);
                    $return = true;
                }else {
                    $return = false;
                }
                exit(json_encode(array('result'=>$return)));
                break;
            /**
             * 分类 排序 显示 设置
             */
            case 'vc_sort':
                $model_class = Model('videos_class');
                $where = array('vc_id' => intval($_GET['id']));
                $update_array = array();
                $update_array['vc_sort'] = $_GET['value'];
                $model_class->editVideosClass($update_array, $where);
                $return = 'true';
                exit(json_encode(array('result'=>$return)));
                break;
            /**
             * 添加、修改操作中 检测类别名称是否有重复
             */
            case 'check_class_name':
                $model_class = Model('videos_class');
                $condition['vc_name'] = trim($_GET['vc_name']);
                $condition['vc_id'] = array('neq', intval($_GET['vc_id']));
                $class_list = $model_class->getVideosClassList($condition);
                if (empty($class_list)){
                    echo 'true';exit;
                }else {
                    echo 'false';exit;
                }
                break;
        }
    }
}
