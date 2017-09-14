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
    }

    public function indexOp() {
         //父类列表，只取到第二级
        // $gc_list = Model('goods_class')->getGoodsClassList(array('gc_parent_id' => 0));
        // Tpl::output('gc_list', $gc_list);

        Tpl::output('top_link',$this->sublink($this->links,'index'));
                        
        Tpl::setDirquna('distribute');
        Tpl::showpage('videos.index');
    }

    public function lockup_listOp(){
         //父类列表，只取到第二级
        // $gc_list = Model('goods_class')->getGoodsClassList(array('gc_parent_id' => 0));
        // Tpl::output('gc_list', $gc_list);

        Tpl::output('top_link',$this->sublink($this->links,'lockup_list'));
                        
       
		Tpl::setDirquna('distribute');
        Tpl::showpage('videos.index');
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
                $videos_list = $model_videos->getGoodsCommonLockUpList($condition, '*', $page, $order);
                break;
                // 全部商品
            default:
                $videos_list = $model_videos->getGoodsCommonList($condition, '*', $page, $order);
                break;
        }

        // 视频状态
        $goods_state = $this->getGoodsState();

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
                    $operation .= "<a class='btn red' href='javascript:void(0);' onclick=\"fg_del('" . $value['videos_id'] . "')\"><i class='fa fa-trash-o'></i>上架</a>";
                    break;
                default:
                    $operation .= "<a class='btn red' href='javascript:void(0);' onclick=\"fg_lonkup('" . $value['videos_id'] . "')\"><i class='fa fa-ban'></i>下架</a>";
                    break;
            }
            $operation .= "<span class='btn'><em><i class='fa fa-cog'></i>设置 <i class='arrow'></i></em><ul>";
            $operation .= "<li><a href='" . urlShop('goods', 'edit', array('videos_id' => $value['videos_id'])) . "' target=\"_blank\">编辑视频</a></li>";
            $operation .= "<li><a href='" . urlShop('goods', 'index', array('videos_id' => $value['videos_id'])) . "' target=\"_blank\">查看视频详细</a></li>";
            $operation .= "<li><a href='javascript:void(0)' onclick=\"fv_del('" . $value['videos_id'] . "')\">删除视频</a></li>";
            $operation .= "</ul>";
            $param['operation'] = $operation;
            $param['videos_id'] = $value['videos_id'];
            $param['videos_title'] = $value['videos_title'];
            $param['videos_state'] = $value['videos_state'];
            $param['videos_image'] = "<a href='javascript:void(0);' class='pic-thumb-tip' onMouseOut='toolTip()' onMouseOver='toolTip(\"<img src=".thumb($value,'60').">\")'><i class='fa fa-picture-o'></i></a>";
            $param['vc_id'] = $value['vc_id'];
            $param['vc_name'] = $value['vc_name'];
            $param['goods_addtime'] = date('Y-m-d', $value['goods_addtime']);
            $data['list'][$value['videos_id']] = $param;
        }
        echo Tpl::flexigridXML($data);exit();
    }



}
