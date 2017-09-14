<?php
/**
 * 商品类别模型
 *
 *
 *
 * * @好商城 (c) 2015-2018 33HAO Inc. (http://www.33hao.com)
 * @license    http://www.33 hao.c om
 * @link       交流群号：138182377
 * @since      好商城提供技术支持 授权请购买shopnc授权
 */

defined('In33hao') or exit('Access Invalid!');

class videos_classModel extends Model
{
    /**
     * 缓存数据
     */
    protected $cachedData;

    /**
     * 缓存数据 原H('videos_class')形式
     */
    protected $vcForCacheModel;

    public function __construct() {
        parent::__construct('videos_class');
    }

    /**
     * 获取缓存数据
     *
     * @return array
     * array(
     *   'data' => array(
     *     // Id => 记录
     *   )
     * )
     */
    public function getCache() {
        if ($this->cachedData) {
            return $this->cachedData;
        }
        $data = rkcache('vc_class');
        if (!$data) {
            $data = array();
            foreach ((array) $this->getVideosClassList(array()) as $v) {
                $id = $v['vc_id'];
                $data['data'][$id] = $v;
            }
            wkcache('vc_class', $data);
        }
        return $this->cachedData = $data;
    }

    /**
     * 删除缓存数据
     */
    public function dropCache() {
        $this->cachedData = null;
        $this->vcForCacheModel = null;

        dkcache('vc_class');
    }

    /**
     * 类别列表
     *
     * @param  array   $condition  检索条件
     * @return array   返回二位数组
     */
    public function getVideosClassList($condition, $field = '*') {
        $result = $this->table('videos_class')->field($field)->where($condition)->order('vc_sort asc,vc_id asc')->limit(false)->select();
        return $result;
    }

    /**
     * 从缓存获取全部分类
     */
    public function getVideosClassListAll() {
        $data = $this->getCache();
        return array_values((array) $data['data']);
    }

    /**
     * 从缓存获取全部分类 分类id作为数组的键
     */
    public function getVideosClassIndexedListAll() {
        $data = $this->getCache();
        return (array) $data['data'];
    }

    /**
     * 从缓存获取分类 通过分类id数组
     *
     * @param array $ids 分类id数组
     */
    public function getVideosClassListByIds($ids) {
        $data = $this->getCache();
        $ret = array();
        foreach ((array) $ids as $i) {
            if ($data['data'][$i]) {
                $ret[] = $data['data'][$i];
            }
        }
        return $ret;
    }

    /**
     * 从缓存获取分类 通过分类id
     *
     * @param int $id 分类id
     */
    public function getVideosClassInfoById($id) {
        $data = $this->getCache();
        return $data['data'][$id];
    }
    
    /**
     * 返回缓存数据 原H('videos_class')形式
     */
    public function getVideosClassForCacheModel() {

        if ($this->vcForCacheModel)
            return $this->vcForCacheModel;

        $data = $this->getCache();

        $r = $data['data'];
        $r = (array) $r;

        return $this->vcForCacheModel = $r;
    }

    /**
     * 更新信息
     * @param unknown $data
     * @param unknown $condition
     */
    public function editVideosClass($data = array(), $condition = array()) {
        // 删除缓存
        $this->dropCache();
        return $this->where($condition)->update($data);
    }

    /**
     * 取得分类
     */
    public function getVideosClass($store_id, $pid = 0, $deep = 1, $group_id = null, $gc_limits = 1, $is_all_class = null) {
        // 读取商品分类 by 33 hao .com 批量添加分类修改
        $gc_list_o = $gc_list = $this->getGoodsClassListByParentId($pid);
        // 如果不是自营店铺或者自营店铺未绑定全部商品类目，读取绑定分类
        if($is_all_class == null) {
            $is_all_class = checkPlatformStoreBindingAllGoodsClass();
        }
        if (!$is_all_class) {
            $gc_list = array_under_reset($gc_list, 'gc_id');
            $model_storebindclass = Model('store_bind_class');
            $gcid_array = $model_storebindclass->getStoreBindClassList(array(
                'store_id' => $store_id,
                'state' => array('in', array(1, 2)),
            ), '', "class_{$deep} asc", "distinct class_{$deep}");

            if (!empty($gcid_array)) {
                $tmp_gc_list = array();
                foreach ($gcid_array as $value) {
                    if($value["class_{$deep}"] == 0)
                    return $gc_list_o;
                    if (isset($gc_list[$value["class_{$deep}"]])) {
                        $tmp_gc_list[] = $gc_list[$value["class_{$deep}"]];
                    }
                }
                $gc_list = $tmp_gc_list;
            } else {
                return array();
            }
        }
        //排除无权操作的数组
        if (!$gc_limits && $group_id) {
            $gc_list_group = Model('seller_group_bclass')->getSellerGroupBclasList(array('group_id'=>$group_id),'','','distinct class_'.$deep,'class_'.$deep);
            $temp = array();
            foreach ($gc_list as $k => $v) {
                if (array_key_exists($v['gc_id'],$gc_list_group)) {
                    $temp[] = $gc_list[$k];
                }
            }
            $gc_list = $temp;
        }
        return $gc_list;
    }

        /**
     * 删除商品分类
     * @param unknown $condition
     * @return boolean
     */
    public function delVideosClass($condition) {
        // 删除缓存
        $this->dropCache();
        return $this->where($condition)->delete();
    }

    /**
     * 删除视频分类
     *
     * @param array $gcids
     * @return boolean
     */
    public function delVideosClassByGcIdString($gcids) {
        $gcids = explode(',', $gcids);
        if (empty($gcids)) {
            return false;
        }
        $goods_class = $this->getGoodsClassForCacheModel();
        $gcid_array = array();
        foreach ($gcids as $gc_id) {
            $child = (!empty($goods_class[$gc_id]['child'])) ? explode(',', $goods_class[$gc_id]['child']) : array();
            $childchild = (!empty($goods_class[$gc_id]['childchild'])) ? explode(',', $goods_class[$gc_id]['childchild']) : array();
            $gcid_array = array_merge($gcid_array, array($gc_id), $child, $childchild);
        }
        // 删除商品分类
        $this->delGoodsClass(array('gc_id' => array('in', $gcid_array)));
        // 删除常用商品分类
        Model('goods_class_staple')->delStaple(array('gc_id_1|gc_id_2|gc_id_3' => array('in', $gcid_array)));
        // 删除分类tag表
        Model('goods_class_tag')->delGoodsClassTag(array('gc_id_1|gc_id_2|gc_id_3' => array('in', $gcid_array)));
        // 删除店铺绑定分类
        Model('store_bind_class')->delStoreBindClass(array('class_1|class_2|class_3' => array('in', $gcid_array)));
        //删除商家权限组绑定的分类
        Model('seller_group_bclass')->delSellerGroupBclass(array('class_1|class_2|class_3' => array('in', $gcid_array)));
        // 商品下架
        Model('goods')->editProducesLockUp(array('goods_stateremark' => '商品分类被删除，需要重新选择分类'), array('gc_id' => array('in', $gcid_array)));
        return true;
    }


    /**
     * 新增视频分类
     * @param array $insert
     * @return boolean
     */
    public function addVideosClass($insert) {
        // 删除缓存
        $this->dropCache();
        return $this->insert($insert);
    }

}
