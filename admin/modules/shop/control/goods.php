<?php
/**
 * 商品栏目管理
 *
 *
 *
 *
 * @好商城提供技术支持 授权请购买shopnc授权
 * @license    http://www.33hao.com
 * @link       交流群号：138182377
 */



defined('In33hao') or exit('Access Invalid!');
class goodsControl extends SystemControl{
    private $links = array(
        array('url'=>'act=goods&op=goods','text'=>'所有商品'),
        array('url'=>'act=goods&op=lockup_list','text'=>'违规下架'),
        // array('url'=>'act=goods&op=waitverify_list','text'=>'等待审核'),
        // array('url'=>'act=goods&op=goods_set','text'=>'商品设置'),
    );
    const EXPORT_SIZE = 5000;
    public function __construct() {
        parent::__construct ();
        Language::read('goods');
    }

    public function indexOp() {
        $this->goodsOp();
    }
    /**
     * 商品管理
     */
    public function goodsOp() {
        //父类列表，只取到第二级
        $gc_list = Model('goods_class')->getGoodsClassList(array('gc_parent_id' => 0));
        Tpl::output('gc_list', $gc_list);

        Tpl::output('top_link',$this->sublink($this->links,'goods'));
						
		Tpl::setDirquna('shop');
        Tpl::showpage('goods.index');
    }

    /**
     * 添加商品
     */
    public function add_step_oneOp() {
        // 实例化商品分类模型, 店铺模型
        $model_goodsclass = Model('goods_class');
        $model_store = Model('store');
        // 商品分类
        $goods_class = $model_goodsclass->getGoodsClass(1,0,1,0,1,1);
        //店铺列表
        $condition['store_state'] = 1;
        $oreder = 'is_own_shop asc, id asc';
        $field = 'store_id, store_name';
        // ($condition, $page = null, $order = '', $field = '*', $limit = ''
        $store_list = $model_store->getStoreList($condition, null, $order, $field);

        // 常用商品分类
        $model_staple = Model('goods_class_staple');
        $param_array = array();
        $param_array['member_id'] = $_SESSION['member_id'];
        $staple_array = $model_staple->getStapleList($param_array);

        Tpl::output('staple_array', $staple_array);
        Tpl::output('goods_class', $goods_class);
        Tpl::output('store_array', $store_list);

        Tpl::setDirquna('shop');
        Tpl::showpage('goods_add.step1');
    }

    /**
     * 添加商品
     */
    public function add_step_twoOp() {
        // 实例化商品分类模型
        $model_goodsclass = Model('goods_class');
        // 现暂时改为从匿名“自营店铺专属等级”中判断
        $editor_multimedia = false;
        if ($this->store_grade['sg_function'] == 'editor_multimedia') {
            $editor_multimedia = true;
        }
        Tpl::output('editor_multimedia', $editor_multimedia);

        $gc_id = intval($_GET['class_id']);

        // 验证商品分类是否存在且商品分类是否为最后一级
        $data = Model('goods_class')->getGoodsClassForCacheModel();
        if (!isset($data[$gc_id]) || isset($data[$gc_id]['child']) || isset($data[$gc_id]['childchild'])) {
            showDialog(L('store_goods_index_again_choose_category1'));
        }

        // 如果不是自营店铺或者自营店铺未绑定全部商品类目，读取绑定分类
        if (!checkPlatformStoreBindingAllGoodsClass()) {
            //商品分类  by 33 hao.com 支持批量显示分类
            $model_bind_class = Model('store_bind_class');
            $goods_class = Model('goods_class')->getGoodsClassForCacheModel();
            $where['store_id'] = $_SESSION['store_id'];
            $class_2 = $goods_class[$gc_id]['gc_parent_id'];
            $class_1 = $goods_class[$class_2]['gc_parent_id'];
            $where['class_1'] =  $class_1;
            $where['class_2'] =  $class_2;
            $where['class_3'] =  $gc_id;
            $bind_info = $model_bind_class->getStoreBindClassInfo($where);
            if (empty($bind_info))
            {
                $where['class_3'] =  0;
                $bind_info = $model_bind_class->getStoreBindClassInfo($where);
                if (empty($bind_info))
                {
                    $where['class_2'] =  0;
                    $where['class_3'] =  0;
                    $bind_info = $model_bind_class->getStoreBindClassInfo($where);
                    if (empty($bind_info))
                    {
                        $where['class_1'] =  0;
                        $where['class_2'] =  0;
                        $where['class_3'] =  0;
                        $bind_info = Model('store_bind_class')->getStoreBindClassInfo($where);
                        if (empty($bind_info))
                        {
                            showDialog(L('store_goods_index_again_choose_category2'));
                        }
                    }

                }

            }
        }

        //权限组对应分类权限判断
        if (!$_SESSION['seller_gc_limits']&& $_SESSION['seller_group_id']) {
            $rs = Model('seller_group_bclass')->getSellerGroupBclassInfo(array('group_id'=>$_SESSION['seller_group_id'],'gc_id'=>$gc_id));
            if (!$rs) {
                showMessage('您所在的组无权操作该分类下的商品', '', 'html', 'error');
            }
        }

        // 更新常用分类信息
        $goods_class = $model_goodsclass->getGoodsClassLineForTag($gc_id);
        Tpl::output('goods_class', $goods_class);
        Model('goods_class_staple')->autoIncrementStaple($goods_class, $_SESSION['member_id']);

        // 获取类型相关数据
        $typeinfo = Model('type')->getAttr($goods_class['type_id'], $_SESSION['store_id'], $gc_id);
        list($spec_json, $spec_list, $attr_list, $brand_list) = $typeinfo;
        Tpl::output('sign_i', count($spec_list));
        Tpl::output('spec_list', $spec_list);
        Tpl::output('attr_list', $attr_list);
        Tpl::output('brand_list', $brand_list);
        // 自定义属性
        $custom_list = Model('type_custom')->getTypeCustomList(array('type_id' => $goods_class['type_id']));
        Tpl::output('custom_list', $custom_list);

        // 实例化店铺商品分类模型
        $store_goods_class = Model('store_goods_class')->getClassTree(array('store_id' => $_SESSION ['store_id'], 'stc_state' => '1'));
        Tpl::output('store_goods_class', $store_goods_class);

        // 小时分钟显示
        $hour_array = array('00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23');
        Tpl::output('hour_array', $hour_array);
        $minute_array = array('05', '10', '15', '20', '25', '30', '35', '40', '45', '50', '55');
        Tpl::output('minute_array', $minute_array);

        // 关联版式
        $plate_list = Model('store_plate')->getStorePlateList(array('store_id' => $_SESSION['store_id']), 'plate_id,plate_name,plate_position');
        $plate_list = array_under_reset($plate_list, 'plate_position', 2);
        Tpl::output('plate_list', $plate_list);
        
        // 供货商
        $supplier_list = Model('store_supplier')->getStoreSupplierList(array('sup_store_id' => $_SESSION['store_id']));
        Tpl::output('supplier_list', $supplier_list);

        Tpl::showpage('store_goods_add.step2');
    }

    /**
     * 保存商品（商品发布第二步使用）
     */
    public function save_goodsOp() {
        $logic_goods = Logic('goods');

        $result =  $logic_goods->saveGoods(
            $_POST,
            $_SESSION['store_id'], 
            $_SESSION['store_name'], 
            $this->store_info['store_state'], 
            $_SESSION['seller_id'], 
            $_SESSION['seller_name'],
            $_SESSION['bind_all_gc']
        );

        if(!$result['state']) {
            showMessage(L('error') . $result['msg'], urlShop('seller_center'), 'html', 'error');
        }

        redirect(urlShop('store_goods_add', 'add_step_three', array('commonid' => $result['data'])));
    }

    /**
     * 第三步添加颜色图片
     */
    public function add_step_threeOp() {
        $common_id = intval($_GET['commonid']);
        if ($common_id <= 0) {
            showMessage(L('wrong_argument'), urlShop('seller_center'), 'html', 'error');
        }

        $model_goods = Model('goods');
        $img_array = $model_goods->getGoodsList(array('goods_commonid' => $common_id), 'color_id,min(goods_image) as goods_image', 'color_id');
        // 整理，更具id查询颜色名称
        if (!empty($img_array)) {
            $colorid_array = array();
            $image_array = array();
            foreach ($img_array as $val) {
                $image_array[$val['color_id']][0]['goods_image'] = $val['goods_image'];
                $image_array[$val['color_id']][0]['is_default'] = 1;
                $colorid_array[] = $val['color_id'];
            }
            Tpl::output('img', $image_array);
        }

        $common_list = $model_goods->getGoodsCommonInfoByID($common_id, 'spec_value');
        $spec_value = unserialize($common_list['spec_value']);
        Tpl::output('value', $spec_value['1']);

        $model_spec = Model('spec');
        $value_array = $model_spec->getSpecValueList(array('sp_value_id' => array('in', $colorid_array), 'store_id' => $_SESSION['store_id']), 'sp_value_id,sp_value_name');
        if (empty($value_array)) {
            $value_array[] = array('sp_value_id' => '0', 'sp_value_name' => '无颜色');
        }
        Tpl::output('value_array', $value_array);

        Tpl::output('commonid', $common_id);
        Tpl::showpage('store_goods_add.step3');
    }

    /**
     * 保存商品颜色图片
     */
    public function save_imageOp(){
        if (chksubmit()) {
            $common_id = intval($_POST['commonid']);
            if ($common_id <= 0 || empty($_POST['img'])) {
                showMessage(L('wrong_argument'));
            }
            $model_goods = Model('goods');
            // 保存
            $insert_array = array();
            foreach ($_POST['img'] as $key => $value) {
                $k = 0;
                foreach ($value as $v) {
                    if ($v['name'] == '') {
                        continue;
                    }
                    // 商品默认主图
                    $update_array = array();        // 更新商品主图
                    $update_where = array();
                    $update_array['goods_image']    = $v['name'];
                    $update_where['goods_commonid'] = $common_id;
                    $update_where['color_id']       = $key;
                    if ($k == 0 || $v['default'] == 1) {
                        $k++;
                        $update_array['goods_image']    = $v['name'];
                        $update_where['goods_commonid'] = $common_id;
                        $update_where['color_id']       = $key;
                        // 更新商品主图
                        $model_goods->editGoods($update_array, $update_where);
                    }
                    $tmp_insert = array();
                    $tmp_insert['goods_commonid']   = $common_id;
                    $tmp_insert['store_id']         = $_SESSION['store_id'];
                    $tmp_insert['color_id']         = $key;
                    $tmp_insert['goods_image']      = $v['name'];
                    $tmp_insert['goods_image_sort'] = ($v['default'] == 1) ? 0 : intval($v['sort']);
                    $tmp_insert['is_default']       = $v['default'];
                    $insert_array[] = $tmp_insert;
                }
            }
            $rs = $model_goods->addGoodsImagesAll($insert_array);
            if ($rs) {
                redirect(urlShop('store_goods_add', 'add_step_four', array('commonid' => $common_id)));
            } else {
                showMessage(L('nc_common_save_fail'));
            }
        }
    }

    /**
     * 商品发布第四步
     */
    public function add_step_fourOp() {
        // 单条商品信息
        $goods_info = Model('goods')->getGoodsInfo(array('goods_commonid' => $_GET['commonid']));

        // 自动发布动态
        $data_array = array();
        $data_array['goods_id'] = $goods_info['goods_id'];
        $data_array['store_id'] = $goods_info['store_id'];
        $data_array['goods_name'] = $goods_info['goods_name'];
        $data_array['goods_image'] = $goods_info['goods_image'];
        $data_array['goods_price'] = $goods_info['goods_price'];
        $data_array['goods_transfee_charge'] = $goods_info['goods_freight'] == 0 ? 1 : 0;
        $data_array['goods_freight'] = $goods_info['goods_freight'];
        $this->storeAutoShare($data_array, 'new');

        Tpl::output('allow_gift', Model('goods')->checkGoodsIfAllowGift($goods_info));
        Tpl::output('goods_id', $goods_info['goods_id']);
        Tpl::showpage('store_goods_add.step4');
    }

    /**
     * 上传图片
     */
    public function image_uploadOp() {
        $logic_goods = Logic('goods');

        $result =  $logic_goods->uploadGoodsImage(
            $_POST['name'],
            $_SESSION['store_id'],
            $this->store_grade['sg_album_limit']
        );

        if(!$result['state']) {
            echo json_encode(array('error' => $result['msg']));die;
        }

        echo json_encode($result['data']);die;
    }

    /**
     * ajax获取商品分类的子级数据
     */
    public function ajax_goods_classOp() {
        $gc_id = intval($_GET['gc_id']);
        $deep = intval($_GET['deep']);
        if ($gc_id <= 0 || $deep <= 0 || $deep >= 4) {
            exit();
        }
        $model_goodsclass = Model('goods_class');
        $list = $model_goodsclass->getGoodsClass($_SESSION['store_id'], $gc_id, $deep,$_SESSION['seller_group_id'],$_SESSION['seller_gc_limits']);
        if (empty($list)) {
            exit();
        }
        /**
         * 转码
         */
        if (strtoupper ( CHARSET ) == 'GBK') {
            $list = Language::getUTF8 ( $list );
        }
        echo json_encode($list);
    }


    /**
     * 违规下架商品管理
     */
    public function lockup_listOp() {
        Tpl::output('type', 'lockup');
        Tpl::output('top_link',$this->sublink($this->links,'lockup_list'));
						
		Tpl::setDirquna('shop');
        Tpl::showpage('goods.index');
    }
    /**
     * 等待审核商品管理
     */
    public function waitverify_listOp() {
        Tpl::output('type', 'waitverify');
        Tpl::output('top_link',$this->sublink($this->links,'waitverify_list'));
						
		Tpl::setDirquna('shop');
        Tpl::showpage('goods.index');
    }

    /**
     * 输出XML数据
     */
    public function get_xmlOp() {
        $model_goods = Model('goods');
        $condition = array();
        if ($_GET['goods_name'] != '') {
            $condition['goods_name'] = array('like', '%' . $_GET['goods_name'] . '%');
        }
        if ($_GET['goods_commonid'] != '') {
            $condition['goods_commonid'] = array('like', '%' . $_GET['goods_commonid'] . '%');
        }
        if ($_GET['store_name'] != '') {
            $condition['store_name'] = array('like', '%' . $_GET['store_name'] . '%');
        }
        if ($_GET['brand_name'] != '') {
            $condition['brand_name'] = array('like', '%' . $_GET['brand_name'] . '%');
        }
        if (intval($_GET['cate_id']) > 0) {
            $condition['gc_id'] = intval($_GET['cate_id']);
        }
        if ($_GET['goods_state'] != '') {
            $condition['goods_state'] = $_GET['goods_state'];
        }
        if ($_GET['goods_verify'] != '') {
            $condition['goods_verify'] = $_GET['goods_verify'];
        }
        if ($_POST['query'] != '') {
            $condition[$_POST['qtype']] = array('like', '%' . $_POST['query'] . '%');
        }
        $order = '';
        $param = array('goods_commonid', 'goods_name', 'goods_price', 'goods_state', 'goods_verify', 'goods_image', 'goods_jingle', 'gc_id'
                , 'gc_name', 'store_id', 'store_name', 'is_own_shop', 'brand_id', 'brand_name', 'goods_addtime', 'goods_marketprice', 'goods_costprice'
                , 'goods_freight', 'is_virtual', 'virtual_indate', 'virtual_invalid_refund', 'is_fcode'
                , 'is_presell', 'presell_deliverdate'
        );
        if (in_array($_POST['sortname'], $param) && in_array($_POST['sortorder'], array('asc', 'desc'))) {
            $order = $_POST['sortname'] . ' ' . $_POST['sortorder'];
        }
        $page = $_POST['rp'];

        switch ($_GET['type']) {
            // 禁售
            case 'lockup':
                $goods_list = $model_goods->getGoodsCommonLockUpList($condition, '*', $page, $order);
                break;
                // 等待审核
            case 'waitverify':
                $goods_list = $model_goods->getGoodsCommonWaitVerifyList($condition, '*', $page, $order);
                break;
                // 全部商品
            default:
                $goods_list = $model_goods->getGoodsCommonList($condition, '*', $page, $order);
                break;
        }

        // 库存
        $storage_array = $model_goods->calculateStorage($goods_list);

        // 商品状态
        $goods_state = $this->getGoodsState();

        // 审核状态
        $verify_state = $this->getGoodsVerify();

        $data = array();
        $data['now_page'] = $model_goods->shownowpage();
        $data['total_num'] = $model_goods->gettotalnum();
        foreach ($goods_list as $value) {
            $param = array();
            $operation = '';
            switch ($_GET['type']) {
                // 禁售
                case 'lockup':
                    $operation .= "<a class='btn red' href='javascript:void(0);' onclick=\"fg_del('" . $value['goods_commonid'] . "')\"><i class='fa fa-trash-o'></i>删除</a>";
                    break;
                    // 等待审核
                case 'waitverify':
                    $operation .= "<a class='btn orange' href='javascript:void(0);' onclick=\"fg_verify('" . $value['goods_commonid'] . "')\"><i class='fa fa-check-square'></i>审核</a>";
                    break;
                    // 全部商品
                default:
                    $operation .= "<a class='btn red' href='javascript:void(0);' onclick=\"fg_lonkup('" . $value['goods_commonid'] . "')\"><i class='fa fa-ban'></i>下架</a>";
                    break;
            }
            $operation .= "<span class='btn'><em><i class='fa fa-cog'></i>设置 <i class='arrow'></i></em><ul>";
            $operation .= "<li><a href='" . urlShop('goods', 'index', array('goods_id' => $storage_array[$value['goods_commonid']]['goods_id'])) . "' target=\"_blank\">查看商品详细</a></li>";
            $operation .= "<li><a href='javascript:void(0)' onclick=\"fg_sku('" . $value['goods_commonid'] . "')\">查看商品SKU</a></li>";
            $operation .= "</ul>";
            $param['operation'] = $operation;
            $param['goods_commonid'] = $value['goods_commonid'];
            $param['goods_name'] = $value['goods_name'];
            $param['goods_price'] = ncPriceFormat($value['goods_price']);
            $param['goods_state'] = $goods_state[$value['goods_state']];
            $param['goods_verify'] = $verify_state[$value['goods_verify']];
            $param['goods_image'] = "<a href='javascript:void(0);' class='pic-thumb-tip' onMouseOut='toolTip()' onMouseOver='toolTip(\"<img src=".thumb($value,'60').">\")'><i class='fa fa-picture-o'></i></a>";
            $param['goods_jingle'] = $value['goods_jingle'];
            $param['gc_id'] = $value['gc_id'];
            $param['gc_name'] = $value['gc_name'];
            $param['store_id'] = $value['store_id'];
            $param['store_name'] = $value['store_name'];
            $param['is_own_shop'] = $value['is_own_shop'] == 1 ? '平台自营' : '入驻商户';
            $param['brand_id'] = $value['brand_id'];
            $param['brand_name'] = $value['brand_name'];
            $param['goods_addtime'] = date('Y-m-d', $value['goods_addtime']);
            $param['goods_marketprice'] = ncPriceFormat($value['goods_marketprice']);
            $param['goods_costprice'] = ncPriceFormat($value['goods_costprice']);
            $param['goods_freight'] = $value['goods_freight'] == 0 ? '免运费' : ncPriceFormat($value['goods_freight']);
            $param['goods_storage'] = $storage_array[$value['goods_commonid']]['sum'];
            $param['is_virtual'] = $value['is_virtual'] ==  '1' ? '<span class="yes"><i class="fa fa-check-circle"></i>是</span>' : '<span class="no"><i class="fa fa-ban"></i>否</span>';
            $param['virtual_indate'] = $value['is_virtual'] == '1' && $value['virtual_indate'] > 0 ? date('Y-m-d', $value['virtual_indate']) : '--';
            $param['virtual_invalid_refund'] = $value['is_virtual'] ==  '1' ? ($value['virtual_invalid_refund'] == 1 ? '<span class="yes"><i class="fa fa-check-circle"></i>是</span>' : '<span class="no"><i class="fa fa-ban"></i>否</span>') : '--';
            $data['list'][$value['goods_commonid']] = $param;
        }
        echo Tpl::flexigridXML($data);exit();
    }

    /**
     * 商品状态
     * @return multitype:string
     */
    private function getGoodsState() {
        return array('1' => '出售中', '0' => '仓库中', '10' => '违规下架');
    }

    private function getGoodsVerify() {
        return array('1' => '通过', '0' => '未通过', '10' => '等待审核');
    }

    /**
     * 违规下架
     */
    public function goods_lockupOp() {
        if (chksubmit()) {
            $commonid = intval($_POST['commonid']);
            if ($commonid <= 0) {
                    showDialog(L('nc_common_op_fail'), 'reload');
            }
            $update = array();
            $update['goods_stateremark'] = trim($_POST['close_reason']);

            $where = array();
            $where['goods_commonid'] = $commonid;

            Model('goods')->editProducesLockUp($update, $where);
            showDialog(L('nc_common_op_succ'), '', 'succ', '$("#flexigrid").flexReload();CUR_DIALOG.close()');
        }
        $common_info = Model('goods')->getGoodsCommonInfoByID($_GET['id']);
        Tpl::output('common_info', $common_info);
						
		Tpl::setDirquna('shop');
        Tpl::showpage('goods.close_remark', 'null_layout');
    }

    /**
     * 删除商品
     */
    public function goods_delOp() {
        $common_id = intval($_GET['id']);
        if ($common_id <= 0) {
            exit(json_encode(array('state'=>false,'msg'=>'删除失败')));
        }
        Model('goods')->delGoodsAll(array('goods_commonid' => $common_id));
        $this->log('删除商品[ID:'.$common_id.']',1);
        exit(json_encode(array('state'=>true,'msg'=>'删除成功')));
    }

    /**
     * 审核商品
     */
    public function goods_verifyOp(){
        if (chksubmit()) {
            $commonid = intval($_POST['commonid']);
            if ($commonid <= 0) {
                    showDialog(L('nc_common_op_fail'), 'reload');
            }
            $update2 = array();
            $update2['goods_verify'] = intval($_POST['verify_state']);

            $update1 = array();
            $update1['goods_verifyremark'] = trim($_POST['verify_reason']);
            $update1 = array_merge($update1, $update2);
            $where = array();
            $where['goods_commonid'] = $commonid;

            $model_goods = Model('goods');
            if (intval($_POST['verify_state']) == 0) {
                $model_goods->editProducesVerifyFail($where, $update1, $update2);
            } else {
                $model_goods->editProduces($where, $update1, $update2);
            }
            showDialog(L('nc_common_op_succ'), '', 'succ', '$("#flexigrid").flexReload();CUR_DIALOG.close();');
        }
        $common_info = Model('goods')->getGoodsCommonInfoByID($_GET['id']);
        Tpl::output('common_info', $common_info);
						
		Tpl::setDirquna('shop');
        Tpl::showpage('goods.verify_remark', 'null_layout');
    }

    /**
     * ajax获取商品列表
     */
    public function get_goods_sku_listOp() {
        $commonid = $_GET['commonid'];
        if ($commonid <= 0) {
            showDialog('参数错误', '', '', 'CUR_DIALOG.close();');
        }
        $model_goods = Model('goods');
        $goodscommon_list = $model_goods->getGoodsCommonInfoByID($commonid, 'spec_name');
        if (empty($goodscommon_list)) {
            showDialog('参数错误', '', '', 'CUR_DIALOG.close();');
        }
        $spec_name = array_values((array)unserialize($goodscommon_list['spec_name']));
        $goods_list = $model_goods->getGoodsList(array('goods_commonid' => $commonid), 'goods_id,goods_spec,store_id,goods_price,goods_serial,goods_storage,goods_image');
        if (empty($goods_list)) {
            showDialog('参数错误', '', '', 'CUR_DIALOG.close();');
        }

        foreach ($goods_list as $key => $val) {
            $goods_spec = array_values((array)unserialize($val['goods_spec']));
            $spec_array = array();
            foreach ($goods_spec as $k => $v) {
                $spec_array[] = '<div class="goods_spec">' . $spec_name[$k] . L('nc_colon') . '<em title="' . $v . '">' . $v .'</em>' . '</div>';
            }
            $goods_list[$key]['goods_image'] = thumb($val, '60');
            $goods_list[$key]['goods_spec'] = implode('', $spec_array);
            $goods_list[$key]['url'] = urlShop('goods', 'index', array('goods_id' => $val['goods_id']));
        }

//         /**
//          * 转码
//          */
//         if (strtoupper(CHARSET) == 'GBK') {
//             Language::getUTF8($goods_list);
//         }
//         echo json_encode($goods_list);
        Tpl::output('goods_list', $goods_list);
						
		Tpl::setDirquna('shop');
        Tpl::showpage('goods.sku_list', 'null_layout');
    }

    /**
     * 商品设置
     */
    public function goods_setOp() {
        $model_setting = Model('setting');
        if (chksubmit()){
            $update_array = array();
            $update_array['goods_verify'] = $_POST['goods_verify'];
            $result = $model_setting->updateSetting($update_array);
            if ($result === true){
                $this->log(L('nc_edit,nc_goods_set'),1);
                showMessage(L('nc_common_save_succ'));
            }else {
                $this->log(L('nc_edit,nc_goods_set'),0);
                showMessage(L('nc_common_save_fail'));
            }
        }
        $list_setting = $model_setting->getListSetting();
        Tpl::output('list_setting',$list_setting);

        Tpl::output('top_link',$this->sublink($this->links,'goods_set'));
						
		Tpl::setDirquna('shop');
        Tpl::showpage('goods.setting');
    }

    /**
     * csv导出
     */
    public function export_csvOp() {
        $model_goods = Model('goods');
        $condition = array();
        $limit = false;
        if ($_GET['id'] != '') {
            $id_array = explode(',', $_GET['id']);
            $condition['goods_commonid'] = array('in', $id_array);
        }
        if ($_GET['goods_name'] != '') {
            $condition['goods_name'] = array('like', '%' . $_GET['goods_name'] . '%');
        }
        if ($_GET['goods_commonid'] != '') {
            $condition['goods_commonid'] = array('like', '%' . $_GET['goods_commonid'] . '%');
        }
        if ($_GET['store_name'] != '') {
            $condition['store_name'] = array('like', '%' . $_GET['store_name'] . '%');
        }
        if ($_GET['brand_name'] != '') {
            $condition['brand_name'] = array('like', '%' . $_GET['brand_name'] . '%');
        }
        if ($_GET['cate_id'] != '') {
            $condition['gc_id'] = $_GET['cate_id'];
        }
        if ($_GET['goods_state'] != '') {
            $condition['goods_state'] = $_GET['goods_state'];
        }
        if ($_GET['goods_verify'] != '') {
            $condition['goods_verify'] = $_GET['goods_verify'];
        }
        if ($_REQUEST['query'] != '') {
            $condition[$_REQUEST['qtype']] = array('like', '%' . $_REQUEST['query'] . '%');
        }
        $order = '';
        $param = array('goods_commonid', 'goods_name', 'goods_price', 'goods_state', 'goods_verify', 'goods_image', 'goods_jingle', 'gc_id'
                , 'gc_name', 'store_id', 'store_name', 'is_own_shop', 'brand_id', 'brand_name', 'goods_addtime', 'goods_marketprice', 'goods_costprice'
                , 'goods_freight', 'is_virtual', 'virtual_indate', 'virtual_invalid_refund', 'is_fcode'
                , 'is_presell', 'presell_deliverdate'
        );
        if (in_array($_REQUEST['sortname'], $param) && in_array($_REQUEST['sortorder'], array('asc', 'desc'))) {
            $order = $_REQUEST['sortname'] . ' ' . $_REQUEST['sortorder'];
        }
        if (!is_numeric($_GET['curpage'])){
            switch ($_GET['type']) {
                // 禁售
                case 'lockup':
                    $count = $model_goods->getGoodsCommonLockUpCount($condition);
                    break;
                    // 等待审核
                case 'waitverify':
                    $count = $model_goods->getGoodsCommonWaitVerifyCount($condition);
                    break;
                    // 全部商品
                default:
                    $count = $model_goods->getGoodsCommonCount($condition);
                    break;
            }
            if ($count > self::EXPORT_SIZE ){   //显示下载链接
                $array = array();
                $page = ceil($count/self::EXPORT_SIZE);
                for ($i=1;$i<=$page;$i++){
                    $limit1 = ($i-1)*self::EXPORT_SIZE + 1;
                    $limit2 = $i*self::EXPORT_SIZE > $count ? $count : $i*self::EXPORT_SIZE;
                    $array[$i] = $limit1.' ~ '.$limit2 ;
                }
                Tpl::output('list',$array);
                Tpl::output('murl','index.php?act=goods&op=index');
								
		Tpl::setDirquna('shop');
                Tpl::showpage('export.excel');
                exit();
            }
        } else {
            $limit1 = ($_GET['curpage']-1) * self::EXPORT_SIZE;
            $limit2 = self::EXPORT_SIZE;
            $limit = $limit1 .','. $limit2;
        }
        switch ($_GET['type']) {
            // 禁售
            case 'lockup':
                $goods_list = $model_goods->getGoodsCommonLockUpList($condition, '*', null, $order, $limit);
                break;
                // 等待审核
            case 'waitverify':
                $goods_list = $model_goods->getGoodsCommonWaitVerifyList($condition, '*', null, $order, $limit);
                break;
                // 全部商品
            default:
                $goods_list = $model_goods->getGoodsCommonList($condition, '*', null, $order, $limit);
                break;
        }
        $this->createCsv($goods_list);
    }

    /**
     * 生成csv文件
     */
    private function createCsv($goods_list) {
        // 库存
        $storage_array = Model('goods')->calculateStorage($goods_list);

        // 商品状态
        $goods_state = $this->getGoodsState();

        // 审核状态
        $verify_state = $this->getGoodsVerify();
        $data = array();
        foreach ($goods_list as $value) {
            $param = array();
            $param['goods_commonid'] = $value['goods_commonid'];
            $param['goods_name'] = $value['goods_name'];
            $param['goods_price'] = ncPriceFormat($value['goods_price']);
            $param['goods_state'] = $goods_state[$value['goods_state']];
            $param['goods_verify'] = $verify_state[$value['goods_verify']];
            $param['goods_image'] = thumb($value,'60');
            $param['goods_jingle'] = htmlspecialchars($value['goods_jingle']);
            $param['gc_id'] = $value['gc_id'];
            $param['gc_name'] = $value['gc_name'];
            $param['store_id'] = $value['store_id'];
            $param['store_name'] = $value['store_name'];
            $param['is_own_shop'] = $value['is_own_shop'] == 1 ? '平台自营' : '入驻商户';
            $param['brand_id'] = $value['brand_id'];
            $param['brand_name'] = $value['brand_name'];
            $param['goods_addtime'] = date('Y-m-d', $value['goods_addtime']);
            $param['goods_marketprice'] = ncPriceFormat($value['goods_marketprice']);
            $param['goods_costprice'] = ncPriceFormat($value['goods_costprice']);
            $param['goods_freight'] = $value['goods_freight'] == 0 ? '免运费' : ncPriceFormat($value['goods_freight']);
            $param['goods_storage'] = $storage_array[$value['goods_commonid']]['sum'];
            $param['is_virtual'] = $value['is_virtual'] ==  '1' ? '是' : '否';
            $param['virtual_indate'] = $value['is_virtual'] == '1' && $value['virtual_indate'] > 0 ? date('Y-m-d', $value['virtual_indate']) : '--';
            $param['virtual_invalid_refund'] = $value['is_virtual'] ==  '1' ? ($value['virtual_invalid_refund'] == 1 ? '是' : '否') : '--';
            $data[$value['goods_commonid']] = $param;
        }

        $header = array(
                'goods_commonid' => 'SPU',
                'goods_name' => '商品名称',
                'goods_price' => '商品价格(元)',
                'goods_state' => '商品状态',
                'goods_verify' => '审核状态',
                'goods_image' => '商品图片',
                'goods_jingle' => '广告词',
                'gc_id' => '分类ID',
                'store_id' => '店铺ID',
                'store_name' => '店铺名称',
                'is_own_shop' => '店铺类型',
                'brand_id' => '品牌ID',
                'brand_name' => '品牌名称',
                'goods_addtime' => '发布时间',
                'goods_marketprice' => '市场价格(元)',
                'goods_costprice' => '成本价格(元)',
                'goods_freight' => '运费(元)',
                'goods_storage' => '库存',
                'is_virtual' => '虚拟商品',
                'virtual_indate' => '有效期',
                'virtual_invalid_refund' => '允许退款'
        );
       array_unshift($data, $header);
		$csv = new Csv();
	    $export_data = $csv->charset($data,CHARSET,'GBK');
	    $csv->filename = $csv->charset('goods_list',CHARSET).$_GET['curpage'] . '-'.date('Y-m-d');
	    $csv->export($data);
    }

}
