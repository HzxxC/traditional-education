<?php
/**
 * 菜单
 *
 * @好商城提供技术支持 授权请购买shopnc授权
 * @license    http://www.33hao.com
 * @link       交流群号：138182377
 */
defined('In33hao') or exit('Access Invalid!');

$_menu['distribute'] = array(
        'name' => '分销',
        'child' => array(
                array(
                        'name' => '设置',
                        'child' => array(
                                'setting' => '分销设置',
                                // 'upload' => '视频设置',
                                // 'seo' => 'SEO设置',
                                // 'payment' => '支付方式'
                        )),
                array(
                        'name' => '视频',
                        'child'=>array(
                                'videos' => '视频管理',
                                'videos_class' => '分类管理'
                        )),
                array(
                        'name' => '会员',
                        'child' => array(
                                'member' => '会员管理',
                                'commission' => '佣金明细',
                                'withdraw' => '提现明细'
                        )),
                array(
                        'name' => '交易',
                        'child' => array(
                                'order' => '视频订单'
                        )),
                array(
                        'name' => '统计',
                        'child' => array(
                                'stat_general' => '概述与设置',
                                'stat_industry' => '视频分析',
                                'stat_member' => '会员统计',
                                'stat_trade' => '销量分析'
                        ))
));
