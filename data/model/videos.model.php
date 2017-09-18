<?php
/**
 * 商品管理
 *
 *
 *
 *
 * @好商城提供技术支持 授权请购买shopnc授权
 * @license    http://www.33hao.com
 * @link       交流群号：138182377
 */



defined('In33hao') or exit('Access Invalid!');

class videosModel extends Model{
    public function __construct(){
        parent::__construct('videos');
    }

    const STATE1 = 1;       // 上架
    const STATE0 = 0;       // 下架

    /**
     * 新增商品数据
     *
     * @param array $insert 数据
     * @param string $table 表名
     */
    public function addVideos($insert) {
        $result = $this->table('videos')->insert($insert);
        if ($result) {
            $this->_dVideosCache($result);
        }
        return $result;
    }

    /**
     * 新增多条商品数据
     *
     * @param unknown $insert
     */
    public function addVideosImagesAll($insert) {
        $result = $this->table('goods_images')->insertAll($insert);
        if ($result) {
            $commonid_array = array();
            foreach ($insert as $val) {
                $this->_dGoodsImageCache($val['goods_commonid'] . '|' . $val['color_id']);
                $this->_dGoodsCommonCache($val['goods_commonid']);
                $this->_dGoodsSpecCache($val['goods_commonid']);
                $commonid_array[] = $val['goods_commonid'];
            }
            if (C('cache_open') && !empty($commonid_array)) {
                $commonid_array = array_unique($commonid_array);
                $goodsid_list = $this->getVideosList(array('goods_commonid' => array('in', $commonid_array)), 'goods_id');
                foreach ($goodsid_list as $val) {
                    $this->_dGoodsCache($val['goods_id']);
                }
            }
        }
        return $result;
    }

     /**
     * 商品SKU列表
     *
     * @param array $condition 条件
     * @param string $field 字段
     * @param string $group 分组
     * @param string $order 排序
     * @param int $limit 限制
     * @param int $page 分页
     * @return array 二维数组
     */
    public function getVideosList($condition, $field = '*', $group = '',$order = '', $limit = 0, $page = 0, $count = 0) {
        return $this->table('videos')->field($field)->where($condition)->group($group)->order($order)->limit($limit)->page($page, $count)->select();
    }
    /**
     * 普通列表，即不包括虚拟商品、F码商品、预售商品、预定商品
     *
     * @param array $condition 条件
     * @param string $field 字段
     * @param string $group 分组
     * @param string $order 排序
     * @param int $limit 限制
     * @param int $page 分页
     * @param boolean $lock 是否锁定
     * @return array
     */
    public function getGeneralGoodsList($condition, $field = '*', $page = 0, $order = 'goods_id desc') {
        $condition['is_virtual']    = 0;
        $condition['is_fcode']      = 0;
        $condition['is_presell']    = 0;
        $condition['is_book']       = 0;
        return $this->getVideosList($condition, $field, '', $order, 0, $page, 0);
    }

    /**
     * 出售中普通列表，即不包括虚拟商品、F码商品、预售商品、预定商品
     *
     * @param array $condition 条件
     * @param string $field 字段
     * @param string $group 分组
     * @param string $order 排序
     * @param int $limit 限制
     * @param int $page 分页
     * @param boolean $lock 是否锁定
     * @return array
     */
    public function getGeneralGoodsOnlineList($condition, $field = '*', $page = 0, $order = 'goods_id desc') {
        $condition['goods_state']   = self::STATE1;
        $condition['goods_verify']  = self::VERIFY1;
        return $this->getGeneralGoodsList($condition, $field, $page, $order);
    }

    /**
     * 在售商品SKU列表
     *
     * @param array $condition 条件
     * @param string $field 字段
     * @param string $group 分组
     * @param string $order 排序
     * @param int $limit 限制
     * @param int $page 分页
     * @param boolean $lock 是否锁定
     * @return array
     */
    public function getGoodsOnlineList($condition, $field = '*', $page = 0, $order = 'goods_id desc', $limit = 0, $group = '', $lock = false, $count = 0) {
        $condition['goods_state']   = self::STATE1;
        $condition['goods_verify']  = self::VERIFY1;
        return $this->getVideosList($condition, $field, $group, $order, $limit, $page, $count);
    }

    /**
     * 商品列表 卖家中心使用
     *
     * @param array $condition 条件
     * @param array $field 字段
     * @param string $page 分页
     * @param string $order 排序
     * @return array
     */
    public function getVideosCommonList($condition, $field = '*', $page = 10, $order = 'videos_id desc', $limit = '') {
        return $this->table('videos')->field($field)->where($condition)->order($order)->limit($limit)->page($page)->select();
    }

    /**
     * 出售中的商品列表 卖家中心使用
     *
     * @param array $condition 条件
     * @param array $field 字段
     * @param string $page 分页
     * @param string $order 排序
     * @return array
     */
    public function getGoodsCommonOnlineList($condition, $field = '*', $page = 10, $order = "goods_commonid desc") {
        $condition['goods_state']   = self::STATE1;
        $condition['goods_verify']  = self::VERIFY1;
        return $this->getVideosCommonList($condition, $field, $page, $order);
    }

    /**
     * 出售中的普通商品列表，即不包括虚拟商品、F码商品、预售商品
     */
    public function getGeneralGoodsCommonList($condition, $field = '*', $page = 10) {
        $condition['is_virtual']    = 0;
        $condition['goods_state']   = self::STATE1;
        $condition['goods_verify']  = self::VERIFY1;
        return $this->getVideosCommonList($condition, $field, $page);
    }

    /**
     * 出售中的未参加促销的虚拟商品列表
     */
    public function getVrGoodsCommonList($condition, $field = '*', $page = 10) {
        $condition['is_virtual']    = 1;
        $condition['goods_state']   = self::STATE1;
        $condition['goods_verify']  = self::VERIFY1;
        return $this->getVideosCommonList($condition, $field, $page);
    }


    /**
     * 下架视频列表
     *
     * @param array $condition 条件
     * @param array $field 字段
     * @param string $page 分页
     * @param string $order 排序
     * @return array
     */
    public function getVideosLockUpList($condition, $field = '*', $page = 10, $order = "videos_id desc", $limit = '') {
        $condition['videos_state']   = self::STATE0;
        return $this->getVideosCommonList($condition, $field, $page, $order, $limit);
    }

    /**
     * 读取列表
     * @param array $condition
     *
     */
    public function getGoodsRecommendList($condition, $limit = '', $order = '', $field = '*') {
        return $this->field($field)->where($condition)->limit($limit)->order($order)->select();
    }


    /**
     * 更新商品SUK数据
     *
     * @param array $update 更新数据
     * @param array $condition 条件
     * @return boolean
     */
    public function editVideos($update, $condition, $updateXS = false) {
        $videos_list = $this->getVideosList($condition, 'videos_id');
        if (empty($videos_list)) {
            return true;
        }
        $videoids_array = array();
        foreach ($videos_list as $value) {
            $videoids_array[] = $value['videos_id'];
        }
        return $this->editVideosById($update, $videoids_array, $updateXS);
    }

    /**
     * 更新商品SUK数据
     * @param array $update
     * @param int|array $videoids_array
     * @return boolean|unknown
     */
    public function editVideosById($update, $videoids_array, $updateXS = false) {
        if (empty($videoids_array)) {
            return true;
        }
        $condition['videos_id'] = array('in', $videoids_array);
        $update['videos_addtime'] = TIMESTAMP;
        $result = $this->table('videos')->where($condition)->update($update);
        if ($result) {
            foreach ((array)$videoids_array as $value) {
                $this->_dVideosCache($value);
            }
            if (C('fullindexer.open') && $updateXS) {
                QueueClient::push('updateXS', $videoids_array);
            }
        }
        return $result;
    }

    /**
     * 更新商品信息
     *
     * @param array $condition
     * @param array $update1
     * @param array $update2
     * @return boolean
     */
    public function editProduces($condition, $update1, $updateXS = false) {
        $return = $this->editVideos($update1, $condition, $updateXS);
        if ($return) {
            return true;
        } else {
            return false;
        }
    }


    /**
     * 商品下架
     * @param array $condition 条件
     * @return boolean
     */
    public function editProducesOffline($condition) {
        $update = array('videos_state' => self::STATE0);
        return $this->editProducesNoLock($condition, $update, array(), true);
    }

    /**
     * 商品上架
     * @param array $condition 条件
     * @return boolean
     */
    public function editProducesOnline($condition) {
        $update = array('videos_state' => self::STATE1);
        // 禁售商品、审核失败商品不能上架。
        $condition['videos_state'] = self::STATE0;
        return $this->editProduces($condition, $update);
    }

    /**
     * 违规下架
     *
     * @param array $update
     * @param array $condition
     * @return boolean
     */
    public function editProducesLockUp($update, $condition) {
        $update_param['videos_state'] = self::STATE0;
        $update = array_merge($update, $update_param);
        $return = $this->table('videos') -> where($condition) -> update($update);
        if ($return) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 获取单条商品SKU信息
     *
     * @param array $condition
     * @param string $field
     * @return array
     */
    public function getVideosInfo($condition, $field = '*') {
        return $this->table('videos')->field($field)->where($condition)->find();
    }

    /**
     * 获取单条商品SKU信息及其促销信息
     *
     * @param int $goods_id
     * @param string $field
     * @return array
     */
    public function getGoodsOnlineInfoForShare($goods_id) {
        $goods_info = $this->getGoodsOnlineInfoAndPromotionById($goods_id);
        if (empty($goods_info)) {
            return array();
        }
        //抢购
        if (isset($goods_info['groupbuy_info'])) {
            $goods_info['promotion_type'] = '抢购';
            $goods_info['promotion_price'] = $goods_info['groupbuy_info']['groupbuy_price'];
        }

        if (isset($goods_info['xianshi_info'])) {
            $goods_info['promotion_type'] = '限时折扣';
            $goods_info['promotion_price'] = $goods_info['xianshi_info']['xianshi_price'];
        }
        return $goods_info;
    }

    /**
     * 查询出售中的商品详细信息及其促销信息
     * @param int $goods_id
     * @return array
     */
    public function getGoodsOnlineInfoAndPromotionById($goods_id) {
        $goods_info = $this->getGoodsInfoAndPromotionById($goods_id);
        if (empty($goods_info) || $goods_info['goods_state'] != self::STATE1 || $goods_info['goods_verify'] != self::VERIFY1) {
            return array();
        }
        return $goods_info;
    }

    /**
     * 查询商品详细信息及其促销信息
     * @param int $goods_id
     * @return array
     */
    public function getGoodsInfoAndPromotionById($goods_id) {
        $goods_info = $this->getGoodsInfoByID($goods_id);
        if (empty($goods_info)) {
            return array();
        }
        // 手机专享
        if (C('promotion_allow') && APP_ID == 'mobile') {
            $goods_info['sole_info'] = Model('p_sole')->getSoleGoodsInfoOpenByGoodsID($goods_info['goods_id']);
        }
        
        //抢购
        if (C('groupbuy_allow') && empty($goods_info['sole_info'])) {
            $goods_info['groupbuy_info'] = Model('groupbuy')->getGroupbuyInfoByGoodsCommonID($goods_info['goods_commonid']);
        }
        
        //限时折扣
        if (C('promotion_allow') && empty($goods_info['sole_info']) && empty($goods_info['groupbuy_info'])) {
            $goods_info['xianshi_info'] = Model('p_xianshi_goods')->getXianshiGoodsInfoByGoodsID($goods_info['goods_id']);
        }
        
        // 加价购
        if (C('promotion_allow')) {
            $goods_info['jjg_info'] = Model('p_cou')->getCachedRelationalCouDetailBySingleSku($goods_info['goods_id']);
        }
        
        return $goods_info;
    }

    /**
     * 查询出售中的商品列表及其促销信息
     * @param array $goodsid_array
     * @return array
     */
    public function getGoodsOnlineListAndPromotionByIdArray($goodsid_array) {
        if (empty($goodsid_array) || !is_array($goodsid_array)) return array();

        $goods_list = array();
        foreach ($goodsid_array as $goods_id) {
            $goods_info = $this->getGoodsOnlineInfoAndPromotionById($goods_id);
            if (!empty($goods_info)) $goods_list[] = $goods_info;
        }

        return $goods_list;
    }

    /**
     * 获取单条商品信息
     *
     * @param array $condition
     * @param string $field
     * @return array
     */
    public function getGoodsCommonInfo($condition, $field = '*') {
        return $this->table('goods_common')->field($field)->where($condition)->find();
    }

    /**
     * 取得商品详细信息（优先查询缓存）
     * 如果未找到，则缓存所有字段
     * @param int $goods_commonid
     * @param string $fields 需要取得的缓存键值, 例如：'*','goods_name,store_name'
     * @return array
     */
    public function getGoodsCommonInfoByID($goods_commonid, $fields = '*') {
        $common_info = $this->_rGoodsCommonCache($goods_commonid, $fields);
        if (empty($common_info)) {
            $common_info = $this->getGoodsCommonInfo(array('goods_commonid'=>$goods_commonid));
            $this->_wGoodsCommonCache($goods_commonid, $common_info);
        }
        return $common_info;
    }

    /**
     * 获得商品SKU某字段的和
     *
     * @param array $condition
     * @param string $field
     * @return boolean
     */
    public function getGoodsSum($condition, $field) {
        return $this->table('goods')->where($condition)->sum($field);
    }

    /**
     * 获得商品SKU数量
     *
     * @param array $condition
     * @param string $field
     * @return int
     */
    public function getGoodsCount($condition) {
        return $this->table('goods')->where($condition)->count();
    }

    /**
     * 获得出售中商品SKU数量
     *
     * @param array $condition
     * @param string $field
     * @return int
     */
    public function getGoodsOnlineCount($condition, $field = '*') {
        $condition['goods_state']   = self::STATE1;
        $condition['goods_verify']  = self::VERIFY1;
        return $this->table('goods')->where($condition)->group('')->count1($field);
    }
    /**
     * 获得商品数量
     *
     * @param array $condition
     * @param string $field
     * @return int
     */
    public function getGoodsCommonCount($condition) {
        return $this->table('goods_common')->where($condition)->count();
    }

    /**
     * 出售中的商品数量
     *
     * @param array $condition
     * @return int
     */
    public function getGoodsCommonOnlineCount($condition) {
        $condition['goods_state']   = self::STATE1;
        $condition['goods_verify']  = self::VERIFY1;
        return $this->getGoodsCommonCount($condition);
    }

    /**
     * 仓库中的商品数量
     *
     * @param array $condition
     * @return int
     */
    public function getGoodsCommonOfflineCount($condition) {
        $condition['goods_state']   = self::STATE0;
        $condition['goods_verify']  = self::VERIFY1;
        return $this->getGoodsCommonCount($condition);
    }

    /**
     * 等待审核的商品数量
     *
     * @param array $condition
     * @return int
     */
    public function getGoodsCommonWaitVerifyCount($condition) {
        $condition['goods_verify']  = self::VERIFY10;
        return $this->getGoodsCommonCount($condition);
    }

    /**
     * 审核失败的商品数量
     *
     * @param array $condition
     * @return int
     */
    public function getGoodsCommonVerifyFailCount($condition) {
        $condition['goods_verify']  = self::VERIFY0;
        return $this->getGoodsCommonCount($condition);
    }

    /**
     * 违规下架的商品数量
     *
     * @param array $condition
     * @return int
     */
    public function getGoodsCommonLockUpCount($condition) {
        $condition['goods_state']   = self::STATE10;
        $condition['goods_verify']  = self::VERIFY1;
        return $this->getGoodsCommonCount($condition);
    }

    /**
     * 商品图片列表
     *
     * @param array $condition
     * @param array $order
     * @param string $field
     * @return array
     */
    public function getGoodsImageList($condition, $field = '*', $order = 'is_default desc,goods_image_sort asc') {
        $this->cls();
        return $this->table('goods_images')->field($field)->where($condition)->order($order)->select();
    }

    /**
     * 删除商品SKU信息
     *
     * @param array $condition
     * @return boolean
     */
    public function delGoods($condition) {
        $goods_list = $this->getVideosList($condition, 'goods_id,goods_commonid,store_id');
        if (!empty($goods_list)) {
            $goodsid_array = array();
            // 删除商品二维码
            foreach ($goods_list as $val) {
                $goodsid_array[] = $val['goods_id'];
                @unlink(BASE_UPLOAD_PATH.DS.ATTACH_STORE.DS.$val['store_id'].DS.$val['goods_id'].'.png');
                // 删除商品缓存
                $this->_dGoodsCache($val['goods_id']);
                // 删除商品规格缓存
                $this->_dGoodsSpecCache($val['goods_commonid']);
            }

            if (C('fullindexer.open')) {
                QueueClient::push('updateXS', $goodsid_array);
            }
            // 删除属性关联表数据
            $this->table('goods_attr_index')->where(array('goods_id' => array('in', $goodsid_array)))->delete();
            // 删除优惠套装商品
            Model('p_bundling')->delBundlingGoods(array('goods_id' => array('in', $goodsid_array)));
            // 优惠套餐活动下架
            Model('p_bundling')->editBundlingCloseByGoodsIds(array('goods_id' => array('in', $goodsid_array)));
            // 推荐展位商品
            Model('p_booth')->delBoothGoods(array('goods_id' => array('in', $goodsid_array)));
            // 限时折扣
            Model('p_xianshi_goods')->delXianshiGoods(array('goods_id' => array('in', $goodsid_array)));
            //删除商品浏览记录
            Model('goods_browse')->delGoodsbrowse(array('goods_id' => array('in', $goodsid_array)));
            // 删除买家收藏表数据
            Model('favorites')->delFavorites(array('fav_id' => array('in', $goodsid_array), 'fav_type' => 'goods'));
            // 删除商品赠品
            Model('goods_gift')->delGoodsGift(array('goods_id' => array('in', $goodsid_array), 'gift_goodsid'=> array('in', $goodsid_array), '_op' => 'or'));
            // 删除推荐组合
            Model('p_combo_goods')->delComboGoods(array('goods_id' => array('in', $goodsid_array), 'combo_goodsid' => array('in', $goodsid_array), '_op' => 'or'));
            // 删除商品F码
            Model('goods_fcode')->delGoodsFCode(array('goods_id' => array('in', $goodsid_array)));
            // 删除门店商品关联
            Model('chain_stock')->delChainStock(array('goods_id' => array('in', $goodsid_array)));
        }
        return $this->table('goods')->where($condition)->delete();
    }

    /**
     * 删除商品图片表信息
     *
     * @param array $condition
     * @return boolean
     */
    public function delGoodsImages($condition) {
        $image_list = $this->getGoodsImageList($condition, 'goods_commonid,color_id');
        if (empty($image_list)) {
            return true;
        }
        $result = $this->table('goods_images')->where($condition)->delete();
        if ($result) {
            foreach ($image_list as $val) {
                $this->_dGoodsImageCache($val['goods_commonid'] . '|' . $val['color_id']);
            }
        }
        return $result;
    }

    /**
     * 商品删除及相关信息
     *
     * @param   array $condition 列表条件
     * @return boolean
     */
    public function delVideosAll($condition) {
        // 删除商品表数据
        return $this->table('videos')->where($condition)->delete();
    }

    /**
     * 删除未锁定商品
     * @param unknown $condition
     */
    public function delGoodsNoLock($condition) {
        $condition['goods_lock'] = 0;
        $common_array = $this->getVideosCommonList($condition, 'goods_commonid', 0);
        $common_array = array_under_reset($common_array, 'goods_commonid');
        $commonid_array = array_keys($common_array);
        return $this->delGoodsAll(array('goods_commonid' => array('in', $commonid_array)));
    }

    /**
     * 发送店铺消息
     * @param string $code
     * @param int $store_id
     * @param array $param
     */
    private function _sendStoreMsg($code, $store_id, $param) {
        QueueClient::push('sendStoreMsg', array('code' => $code, 'store_id' => $store_id, 'param' => $param));
    }

     /**
      * 获得视频子分类的ID
      * @param array $condition
      * @return array
      */
    private function _getRecursiveClass($condition){
        if (isset($condition['vc_id']) && !is_array($condition['vc_id'])) {
            $vc_list = Model('videos_class')->getVideosClassForCacheModel();
            if (!empty($vc_list[$condition['vc_id']])) {
                $vc_id[] = $condition['vc_id'];
                $condition['vc_id'] = array('in', $vc_id);
            }
        }
        return $condition;
    }

    /**
     * 由ID取得在售单个虚拟商品信息
     * @param unknown $goods_id
     * @param string $field 需要取得的缓存键值, 例如：'*','goods_name,store_name'
     * @return array
     */
    public function getVirtualGoodsOnlineInfoByID($goods_id) {
        $goods_info = $this->getGoodsInfoByID($goods_id,'*');
        return $goods_info['is_virtual'] == 1 && $goods_info['virtual_indate'] >= TIMESTAMP ? $goods_info : array();
    }

    /**
     * 取得商品详细信息（优先查询缓存）（在售）
     * 如果未找到，则缓存所有字段
     * @param int $goods_id
     * @param string $field 需要取得的缓存键值, 例如：'*','goods_name,store_name'
     * @return array
     */
    public function getGoodsOnlineInfoByID($goods_id, $field = '*') {
        if ($field != '*') {
            $field .= ',goods_state,goods_verify';
        }
        $goods_info = $this->getGoodsInfoByID($goods_id,trim($field,','));
        if ($goods_info['goods_state'] != self::STATE1 || $goods_info['goods_verify'] != self::VERIFY1) {
            $goods_info = array();
        }
        return $goods_info;
    }

    /**
     * 取得商品详细信息（优先查询缓存）
     * 如果未找到，则缓存所有字段
     * @param int $goods_id
     * @param string $fields 需要取得的缓存键值, 例如：'*','goods_name,store_name'
     * @return array
     */
    public function getVideosInfoByID($videos_id, $fields = '*') {
        $videos_info = $this->_rVideosCache($videos_id, $fields);
        if (empty($videos_info)) {
            $videos_info = $this->getVideosInfo(array('videos_id'=>$videos_id));
            $this->_wVideosCache($videos_id, $videos_info);
        }
        return $videos_info;
    }


    /**
     * 验证是否为普通商品
     * @param array $goods 商品数组
     * @return boolean
     */
    public function checkIsGeneral($goods) {
        if ($goods['is_virtual'] == 1 || $goods['is_fcode'] == 1 || $goods['is_presell'] == 1 || $goods['is_book'] == 1) {
            return false;
        }
        return true;
    }
    
    public function checkOnline($goods) {
        if ($goods['goods_state'] == 1 && $goods['goods_verify'] == 1) {
            return true;
        }
        return false;
    }

    /**
     * 验证是否允许送赠品
     * @param unknown $goods
     * @return boolean
     */
    public function checkGoodsIfAllowGift($goods) {
        if ($goods['is_virtual'] == 1) {
            return false;
        }
        return true;
    }

    /**
     * 获得商品规格数组
     * @param unknown $common_id
     */
    public function getGoodsSpecListByCommonId($common_id) {
        $spec_list = $this->_rGoodsSpecCache($common_id);
        if (empty($spec_list)) {
            $spec_array = $this->getVideosList(array('goods_commonid' => $common_id), 'goods_spec,goods_id,store_id,goods_image,color_id');
            $spec_list['spec'] = serialize($spec_array);
            $this->_wGoodsSpecCache($common_id, $spec_list);
        }
        $spec_array = unserialize($spec_list['spec']);
        return $spec_array;
    }

    /**
     * 获得商品图片数组
     * @param int $goods_id
     * @param array $condition
     */
    public function getGoodsImageByKey($key) {
        $image_list = $this->_rGoodsImageCache($key);
        if (empty($image_list)) {
            $array = explode('|', $key);
            list($common_id, $color_id) = $array;
            $image_more = $this->getGoodsImageList(array('goods_commonid' => $common_id, 'color_id' => $color_id), 'goods_image');
            $image_list['image'] = serialize($image_more);
            $this->_wGoodsImageCache($key, $image_list);
        }
        $image_more = unserialize($image_list['image']);
        return $image_more;
    }

    /**
     * 读取视频缓存
     * @param int $videos_id
     * @param string $fields
     * @return array
     */
    private function _rVideosCache($videos_id, $fields) {
        return rcache($videos_id, 'videos', $fields);
    }

    /**
     * 写入视频缓存
     * @param int $videos_id
     * @param array $goods_info
     * @return boolean
     */
    private function _wVideosCache($videos_id, $vidoes_info) {
        return wcache($videos_id, $vidoes_info, 'videos');
    }

    /**
     * 删除商品缓存
     * @param int $videos_id
     * @return boolean
     */
    private function _dVideosCache($videos_id) {
        return dcache($videos_id, 'videos');
    }


    /**
     * 获取单条商品信息
     *
     * @param int $videos_id
     * @return array
     */
    public function getVideosDetail($videos_id) {
        if($videos_id <= 0) {
            return null;
        }
        $result1 = $this->getGoodsInfoAndPromotionById($videos_id);

        if (empty($result1)) {
            return null;
        }
        if ($result1['goods_body'] == '') unset($result1['goods_body']);
        if ($result1['mobile_body'] == '') unset($result1['mobile_body']); 
        $result2 = $this->getGoodsCommonInfoByID($result1['goods_commonid']);
        $goods_info = array_merge($result2, $result1);

        $goods_info['spec_value'] = unserialize($goods_info['spec_value']);
        $goods_info['spec_name'] = unserialize($goods_info['spec_name']);
        $goods_info['goods_spec'] = unserialize($goods_info['goods_spec']);
        $goods_info['goods_attr'] = unserialize($goods_info['goods_attr']);
        $goods_info['goods_custom'] = unserialize($goods_info['goods_custom']);

        // 手机商品描述
        if ($goods_info['mobile_body'] != '') {
            $mobile_body_array = unserialize($goods_info['mobile_body']);
            $mobile_body = '';
            if (is_array($mobile_body_array)) {
                foreach ($mobile_body_array as $val) {
                    switch ($val['type']) {
                        case 'text':
                            $mobile_body .= '<div>' . $val['value'] . '</div>';
                            break;
                        case 'image':
                            $mobile_body .= '<img src="' . $val['value'] . '">';
                            break;
                    }
                }
            }
            $goods_info['mobile_body'] = $mobile_body;
        }

        // 查询所有规格商品
        $spec_array = $this->getGoodsSpecListByCommonId($goods_info['goods_commonid']);
        $spec_list = array();       // 各规格商品地址，js使用
        $spec_list_mobile = array();       // 各规格商品地址，js使用
        $spec_image = array();      // 各规格商品主图，规格颜色图片使用
        foreach ($spec_array as $key => $value) {
            $s_array = unserialize($value['goods_spec']);
            $tmp_array = array();
            if (!empty($s_array) && is_array($s_array)) {
                foreach ($s_array as $k => $v) {
                    $tmp_array[] = $k;
                }
            }
            sort($tmp_array);
            $spec_sign = implode('|', $tmp_array);
            $tpl_spec = array();
            $tpl_spec['sign'] = $spec_sign;
            $tpl_spec['url'] = urlShop('goods', 'index', array('goods_id' => $value['goods_id']));
            $spec_list[] = $tpl_spec;
            $spec_list_mobile[$spec_sign] = $value['goods_id'];
            $spec_image[$value['color_id']] = thumb($value, 60);
        }
        $spec_list = json_encode($spec_list);

        // 商品多图
        $image_more = $this->getGoodsImageByKey($goods_info['goods_commonid'] . '|' . $goods_info['color_id']);
        $goods_image = array();
        $goods_image_mobile = array();
        if (!empty($image_more)) {
	array_splice($image_more, 5);
            foreach ($image_more as $val) {
	    
	//好商城V5 专用放大镜
                $goods_image[] = array(cthumb($val['goods_image'], 60, $goods_info['store_id']),cthumb($val['goods_image'], 360, $goods_info['store_id']),cthumb($val['goods_image'], 1280, $goods_info['store_id']));
                $goods_image_mobile[] = cthumb($val['goods_image'], 360, $goods_info['store_id']);
            }
        } else {
				// 33 ha o.co m V5. 1 修复编辑产品保存后，无法显示图片
			  $goods_image[] = array(thumb($goods_info, 60),thumb($goods_info, 360),thumb($goods_info, 1280));
                $goods_image_mobile[] = thumb($goods_info, 360);
        }
       

        if ($goods_info['is_book'] != '1') {
            //限时折扣
            if (!empty($goods_info['xianshi_info'])) {
                $goods_info['promotion_type'] = 'xianshi';
                $goods_info['title'] = $goods_info['xianshi_info']['xianshi_title'];
                $goods_info['remark'] = $goods_info['xianshi_info']['xianshi_title'];
                $goods_info['promotion_price'] = $goods_info['xianshi_info']['xianshi_price'];
                $goods_info['down_price'] = ncPriceFormat($goods_info['goods_price'] - $goods_info['xianshi_info']['xianshi_price']);
                $goods_info['lower_limit'] = $goods_info['xianshi_info']['lower_limit'];
                $goods_info['explain'] = $goods_info['xianshi_info']['xianshi_explain'];
				$goods_info['xs_time'] = $goods_info['xianshi_info']['end_time'];
                unset($goods_info['xianshi_info']);
            }
            //抢购
            if (!empty($goods_info['groupbuy_info'])) {
                $goods_info['promotion_type'] = 'groupbuy';
                $goods_info['title'] = '抢购';
                $goods_info['remark'] = $goods_info['groupbuy_info']['remark'];
                $goods_info['promotion_price'] = $goods_info['groupbuy_info']['groupbuy_price'];
                $goods_info['down_price'] = ncPriceFormat($goods_info['goods_price'] - $goods_info['groupbuy_info']['groupbuy_price']);
                $goods_info['upper_limit'] = $goods_info['groupbuy_info']['upper_limit'];
                unset($goods_info['groupbuy_info']);
            }
            // 手机专享
            if (!empty($goods_info['sole_info'])) {
                $goods_info['promotion_type'] = 'sole';
                $goods_info['title'] = '手机专享';
                $goods_info['promotion_price'] = $goods_info['sole_info']['sole_price'];
                unset($goods_info['sole_info']);
            }
            // 加价购
            if (!empty($goods_info['jjg_info'])) {
                $jjgFirstLevel = $goods_info['jjg_info']['firstLevel'];
                if ($jjgFirstLevel && $jjgFirstLevel['mincost'] > 0) {
                    $goods_info['jjg_explain'] = sprintf(
                        '购满<em>&yen;%.2f</em>，再加<em>&yen;%.2f</em>，可换购商品',
                        $jjgFirstLevel['mincost'],
                        $jjgFirstLevel['plus']
                    );
                }
            }
    
            // 验证是否允许送赠品
            if ($this->checkGoodsIfAllowGift($goods_info)) {
                $gift_array = Model('goods_gift')->getGoodsGiftListByGoodsId($goods_id);
                if (!empty($gift_array)) {
                    $goods_info['have_gift'] = 'gift';
                }
            }

            //满即送
            $mansong_info = ($goods_info['is_virtual'] == 1) ? array() : Model('p_mansong')->getMansongInfoByStoreID($goods_info['store_id']);
        }

        // 加入购物车按钮
        $goods_info['cart'] = 1;
        //虚拟、F码、预售不显示加入购物车，不显示门店
        if ($goods_info['is_virtual'] == 1 || $goods_info['is_fcode'] == 1 || $goods_info['is_presell'] == 1 || $goods_info['is_book'] == 1) {
            $goods_info['is_chain'] = 0;
            $goods_info['cart'] = 0;
        }
        
        // 立即购买按钮
        $goods_info['buynow'] = 1;
        // 加价购不显示立即购买按钮
        if (!empty($goods_info['jjg_info'])) {
            $goods_info['buynow'] = 0;
        }

        // 立即购买文字显示
        $goods_info['buynow_text'] = '立即购买';
        if ($goods_info['is_presell'] == 1) {
            $goods_info['buynow_text'] = '预售购买';
        } elseif ($goods_info['is_book'] == 1) {
            $goods_info['buynow_text'] = '支付定金';
        } elseif ($goods_info['is_fcode'] == 1) {
            $goods_info['buynow_text'] = 'F码购买';
        }
        

        $model_plate = Model('store_plate');
        // 顶部关联版式
        $goods_body = '';
        if ($goods_info['plateid_top'] > 0) {
            $plate_top = $model_plate->getStorePlateInfoByID($goods_info['plateid_top']);
            if (!empty($plate_top)) $goods_body .= '<div class="top-template">'. $plate_top['plate_content'] .'</div>';
        }
        $goods_body .= '<div class="default">' . $goods_info['goods_body'] . '</div>';
        // 底部关联版式
        if ($goods_info['plateid_bottom'] > 0) {
            $plate_bottom = $model_plate->getStorePlateInfoByID($goods_info['plateid_bottom']);
            if (!empty($plate_bottom)) $goods_body .= '<div class="bottom-template">'. $plate_bottom['plate_content'] .'</div>';
        }
        $goods_info['goods_body'] = $goods_body;

        // 商品受关注次数加1
        $goods_info['goods_click'] = intval($goods_info['goods_click']) + 1;
        if (C('cache_open')) {
            $this->_wGoodsCache($goods_id, array('goods_click' => $goods_info['goods_click']));
            wcache('updateRedisDate', array($goods_id => $goods_info['goods_click']), 'goodsClick');
        } else {
            $this->editGoodsById(array('goods_click' => array('exp', 'goods_click + 1')), $goods_id);
        }
        $result = array();
        $result['goods_info'] = $goods_info;
        $result['spec_list'] = $spec_list;
        $result['spec_list_mobile'] = $spec_list_mobile;
        $result['spec_image'] = $spec_image;
        $result['goods_image'] = $goods_image;
        $result['goods_image_mobile'] = $goods_image_mobile;
        $result['mansong_info'] = $mansong_info;
        $result['gift_array'] = $gift_array;
        return $result;
    }
    /**
     * 处理商品消费者保障服务信息
     */
    public function getGoodsContract($goods_list, $contract_item = array()){
        if (!$goods_list) {
            return array();
        }
        //查询消费者保障服务
        if (C('contract_allow') == 1) {
            if (!$contract_item) {
                $contract_item = Model('contract')->getContractItemByCache();
            }
        }
        if (!$contract_item) {
            return $goods_list;
        }
        foreach ($goods_list as $k=>$v) {
            $v['contractlist'] = array();
            foreach($contract_item as $citem_k=>$citem_v){
                if($v["contract_$citem_k"] == 1){
                    $v['contractlist'][$citem_k] = $citem_v;
                }
            }
            $goods_list[$k] = $v;
        }
        return $goods_list;
    }
}
