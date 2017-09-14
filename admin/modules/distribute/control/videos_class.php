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
        Language::read('videos_class');
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
       
        $model_class = Model('videos_class');
        if (chksubmit()){
            $obj_validate = new Validate();
            $obj_validate->validateparam = array(
                array("input"=>$_POST["vc_name"], "require"=>"true", "message"=>$lang['goods_class_add_name_null']),
                array("input"=>$_POST["vc_sort"], "require"=>"true", 'validator'=>'Number', "message"=>$lang['goods_class_add_sort_int']),
            );
            $error = $obj_validate->validate();
            if ($error != ''){
                showMessage($error);
            }else {
                $insert_array = array();
                $insert_array['vc_name']        = $_POST['gc_name'];
                $insert_array['vc_sort']        = intval($_POST['gc_sort']);
                $insert_array['vc_description']     = $_POST['vc_description'];
                $insert_array['vc_status']      = intval($_POST['vc_status']);
                $result = $model_class->addVideosClass($insert_array);
                if ($result){
                    $url = array(
                        array(
                            'url'=>'index.php?act=videos_class&op=goods_class',
                            'msg'=>$lang['goods_class_add_back_to_list'],
                        )
                    );
                    $this->log(L('nc_add,goods_class_index_class').'['.$_POST['gc_name'].']',1);
                    showMessage($lang['nc_common_save_succ'],$url);
                }else {
                    $this->log(L('nc_add,goods_class_index_class').'['.$_POST['gc_name'].']',0);
                    showMessage($lang['nc_common_save_fail']);
                }
            }
        }

        Tpl::output('top_link',$this->sublink($this->links,'goods_class_add'));
						
		Tpl::setDirquna('distribute');
        Tpl::showpage('videos_class.add');
    }

    /**
     * 编辑
     */
    public function goods_class_editOp(){
        Tpl::output('show_type', $this->show_type);
        $lang   = Language::getLangContent();
        $model_class = Model('goods_class');

        if (chksubmit()){
            $obj_validate = new Validate();
            $obj_validate->validateparam = array(
                array("input"=>$_POST["gc_name"], "require"=>"true", "message"=>$lang['goods_class_add_name_null']),
                array("input"=>$_POST["commis_rate"], "require"=>"true", 'validator'=>'range','max'=>100,'min'=>0, "message"=>$lang['goods_class_add_commis_rate_error']),
                array("input"=>$_POST["gc_sort"], "require"=>"true", 'validator'=>'Number', "message"=>$lang['goods_class_add_sort_int']),
            );
            $error = $obj_validate->validate();
            if ($error != ''){
                showMessage($error);
            }

            // 更新分类信息
            $where = array('gc_id' => intval($_POST['gc_id']));
            $update_array = array();
            $update_array['gc_name']        = $_POST['gc_name'];
            $update_array['type_id']        = intval($_POST['t_id']);
            $update_array['type_name']      = trim($_POST['t_name']);
            $update_array['commis_rate']    = intval($_POST['commis_rate']);
            $update_array['gc_sort']        = intval($_POST['gc_sort']);
            $update_array['gc_virtual']     = intval($_POST['gc_virtual']);
            $update_array['show_type']      = intval($_POST['show_type']);

            $result = $model_class->editGoodsClass($update_array, $where);
            if (!$result){
                $this->log(L('nc_edit,goods_class_index_class').'['.$_POST['gc_name'].']',0);
                showMessage($lang['goods_class_batch_edit_fail']);
            }

            // 检测是否需要关联自己操作，统一查询子分类
            if ($_POST['t_commis_rate'] == '1' || $_POST['t_associated'] == '1' || $_POST['t_gc_virtual'] == '1' || $_POST['t_show_type'] == '1') {
                $gc_id_list = $model_class->getChildClass($_POST['gc_id']);
                $gc_ids = array();
                if (is_array($gc_id_list) && !empty($gc_id_list)) {
                    foreach ($gc_id_list as $val){
                        $gc_ids[] = $val['gc_id'];
                    }
                }
                $where = array();
                $where['gc_id'] = array('in', $gc_ids);
                $update = array();
                // 更新该分类下子分类的所有分佣比例
                if ($_POST['t_commis_rate'] == '1') {
                    $update['commis_rate']  = $update_array['commis_rate'];
                }
                // 更新该分类下子分类的所有类型
                if ($_POST['t_associated'] == '1') {
                    $update['type_id']      = $update_array['type_id'];
                    $update['type_name']    = $update_array['type_name'];
                }
                // 虚拟商品
                if ($_POST['t_gc_virtual'] == '1') {
                    $update['gc_virtual']   = $update_array['gc_virtual'];
                }
                // 商品展示方式
                if ($_POST['t_show_type'] == '1') {
                    $update['show_type']    = $update_array['show_type'];
                }
                $model_class->editGoodsClass($update,$where);
            }

            $url = array(
                array(
                    'url'=>'index.php?act=goods_class&op=goods_class_edit&gc_id='.intval($_POST['gc_id']),
                    'msg'=>$lang['goods_class_batch_edit_again'],
                ),
                array(
                    'url'=>'index.php?act=goods_class&op=goods_class',
                    'msg'=>$lang['goods_class_add_back_to_list'],
                )
            );
            $this->log(L('nc_edit,goods_class_index_class').'['.$_POST['gc_name'].']',1);
            showMessage($lang['goods_class_batch_edit_ok'],$url,'html','succ',1,5000);
        }

        $class_array = $model_class->getGoodsClassInfoById(intval($_GET['gc_id']));
        if (empty($class_array)){
            showMessage($lang['goods_class_batch_edit_paramerror']);
        }

        //类型列表
        $model_type = Model('type');
        $type_list  = $model_type->typeList(array('order'=>'type_sort asc'), '', 'type_id,type_name,class_id,class_name');
        $t_list = array();
        if(is_array($type_list) && !empty($type_list)){
            foreach($type_list as $k=>$val){
                $t_list[$val['class_id']]['type'][$k] = $val;
                $t_list[$val['class_id']]['name'] = $val['class_name']==''?L('nc_default'):$val['class_name'];
            }
        }
        ksort($t_list);
        //父类列表，只取到第二级
        $parent_list = $model_class->getTreeClassList(2);
        if (is_array($parent_list)){
            foreach ($parent_list as $k => $v){
                $parent_list[$k]['gc_name'] = str_repeat("&nbsp;",$v['deep']*2).$v['gc_name'];
            }
        }
        Tpl::output('parent_list',$parent_list);
        // 一级分类列表
        $gc_list = Model('goods_class')->getGoodsClassListByParentId(0);
        Tpl::output('gc_list', $gc_list);

        Tpl::output('type_list',$t_list);
        Tpl::output('class_array',$class_array);
        $this->links[] = array('url'=>'act=goods_class&op=goods_class_edit','lang'=>'nc_edit');
        Tpl::output('top_link',$this->sublink($this->links,'goods_class_edit'));
						
		Tpl::setDirquna('distribute');
        Tpl::showpage('videos_class.edit');
    }

    /**
     * 删除分类
     */
    public function goods_class_delOp(){
        if ($_GET['id'] != ''){
            //删除分类
            Model('goods_class')->delGoodsClassByGcIdString($_GET['id']);
            $this->log(L('nc_delete,goods_class_index_class') . '[ID:' . $_GET['id'] . ']',1);
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
