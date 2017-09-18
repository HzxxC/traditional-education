<?php defined('In33hao') or exit('Access Invalid!'); return array (
  'system' => 
  array (
    'name' => '平台',
    'child' => 
    array (
      0 => 
      array (
        'name' => '设置',
        'child' => 
        array (
          'setting' => '站点设置',
          'upload' => '上传设置',
          'admin' => '权限设置',
          'admin_log' => '操作日志',
          'cache' => '清理缓存',
        ),
      ),
      1 => 
      array (
        'name' => '会员',
        'child' => 
        array (
          'member' => '会员管理',
          'account' => '账号同步',
        ),
      ),
      2 => 
      array (
        'name' => '网站',
        'child' => 
        array (
          'article_class' => '文章分类',
          'article' => '文章管理',
          'document' => '会员协议',
          'navigation' => '页面导航',
          'adv' => '广告管理',
          'rec_position' => '推荐位',
        ),
      ),
      3 => 
      array (
        'name' => '应用',
        'child' => 
        array (
          'hao' => '基本设置',
          'link' => '友情连接',
          'goods' => '商品评价',
          'db' => '数据库管理',
        ),
      ),
    ),
  ),
  'shop' => 
  array (
    'name' => '商城',
    'child' => 
    array (
      0 => 
      array (
        'name' => '设置',
        'child' => 
        array (
          'setting' => '商城设置',
          'upload' => '图片设置',
          'search' => '搜索设置',
          'seo' => 'SEO设置',
          'message' => '消息通知',
          'payment' => '支付方式',
          'express' => '快递公司',
          'waybill' => '运单模板',
        ),
      ),
      1 => 
      array (
        'name' => '商品',
        'child' => 
        array (
          'goods' => '商品管理',
          'goods_class' => '分类管理',
          'brand' => '品牌管理',
          'type' => '类型管理',
          'spec' => '规格管理',
          'goods_album' => '图片空间',
          'goods_recommend' => '商品推荐',
        ),
      ),
      2 => 
      array (
        'name' => '店铺',
        'child' => 
        array (
          'store' => '店铺管理',
          'store_class' => '店铺分类',
          'help_store' => '店铺帮助',
          'store_joinin' => '商家入驻',
          'ownshop' => '自营店铺',
        ),
      ),
      3 => 
      array (
        'name' => '会员',
        'child' => 
        array (
          'member' => '会员管理',
          'member_exp' => '等级经验值',
          'points' => '积分管理',
          'sns_sharesetting' => '分享绑定',
          'sns_malbum' => '会员相册',
          'snstrace' => '会员动态',
          'sns_member' => '会员标签',
          'predeposit' => '预存款',
          'chat_log' => '聊天记录',
        ),
      ),
      4 => 
      array (
        'name' => '交易',
        'child' => 
        array (
          'order' => '商品订单',
          'vr_order' => '虚拟订单',
          'refund' => '退款管理',
          'return' => '退货管理',
          'vr_refund' => '虚拟订单退款',
          'consulting' => '咨询管理',
          'inform' => '举报管理',
          'evaluate' => '评价管理',
          'complain' => '投诉管理',
        ),
      ),
      5 => 
      array (
        'name' => '运营',
        'child' => 
        array (
          'operating' => '运营设置',
          'bill' => '结算管理',
          'vr_bill' => '虚拟订单结算',
          'mall_consult' => '平台客服',
          'rechargecard' => '平台充值卡',
          'delivery' => '物流自提服务站',
          'contract' => '消费者保障服务',
        ),
      ),
      6 => 
      array (
        'name' => '促销',
        'child' => 
        array (
          'operation' => '促销设定',
          'groupbuy' => '抢购管理',
          'vr_groupbuy' => '虚拟抢购设置',
          'promotion_cou' => '加价购',
          'promotion_xianshi' => '限时折扣',
          'promotion_mansong' => '店铺满即送',
          'promotion_bundling' => '优惠套装',
          'promotion_booth' => '推荐展位',
          'promotion_book' => '预售商品',
          'promotion_fcode' => 'Ｆ码商品',
          'promotion_combo' => '推荐组合',
          'promotion_sole' => '手机专享',
          'pointprod' => '积分兑换',
          'voucher' => '店铺代金券',
          'redpacket' => '平台红包',
          'activity' => '活动管理',
        ),
      ),
      7 => 
      array (
        'name' => '统计',
        'child' => 
        array (
          'stat_general' => '概述及设置',
          'stat_industry' => '行业分析',
          'stat_member' => '会员统计',
          'stat_store' => '店铺统计',
          'stat_trade' => '销量分析',
          'stat_goods' => '商品分析',
          'stat_marketing' => '营销分析',
          'stat_aftersale' => '售后分析',
        ),
      ),
    ),
  ),
  'distribute' => 
  array (
    'name' => '分销',
    'child' => 
    array (
      0 => 
      array (
        'name' => '设置',
        'child' => 
        array (
          'setting' => '分销设置',
        ),
      ),
      1 => 
      array (
        'name' => '视频',
        'child' => 
        array (
          'videos' => '视频管理',
          'videos_class' => '分类管理',
        ),
      ),
      2 => 
      array (
        'name' => '会员',
        'child' => 
        array (
          'member' => '会员管理',
          'commission' => '佣金明细',
          'withdraw' => '提现明细',
        ),
      ),
      3 => 
      array (
        'name' => '交易',
        'child' => 
        array (
          'order' => '视频订单',
        ),
      ),
      4 => 
      array (
        'name' => '统计',
        'child' => 
        array (
          'stat_general' => '概述与设置',
          'stat_industry' => '视频分析',
          'stat_member' => '会员统计',
          'stat_trade' => '销量分析',
        ),
      ),
    ),
  ),
  'mobile' => 
  array (
    'name' => '手机端',
    'child' => 
    array (
      0 => 
      array (
        'name' => '设置',
        'child' => 
        array (
          'mb_setting' => '手机端设置',
          'mb_special' => '模板设置',
          'mb_category' => '分类图片',
          'mb_app' => '应用安装',
          'mb_feedback' => '意见反馈',
          'mb_payment' => '手机支付',
          'mb_wx' => '微信二维码',
          'mb_connect' => '第三方登录',
        ),
      ),
    ),
  ),
);