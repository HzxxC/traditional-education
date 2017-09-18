<?php
/**
 * 提现明细
 *
 */



defined('In33hao') or exit('Access Invalid!');

class withdrawControl extends SystemControl{
    public function __construct(){
        parent::__construct();
        Language::read('member');
    }

    /**
     * 佣金明细列表
     */
    public function indexOp(){
        Tpl::setDirquna('distribute');
        Tpl::showpage('withdraw.index');
    }


    /**
     * 输出XML数据
     */
    public function get_xmlOp() {
        $model_member = Model('member');
        $condition = array();
        $condition['c_type'] = 2;
        if ($_POST['query'] != '') {
            $condition[$_POST['qtype']] = array('like', '%' . $_POST['query'] . '%');
        }
        $order = '';
        $param = array('c_id','member_id', 'member_name', 'c_money', 'c_type', 'c_note', 'c_time'
        );
        if (in_array($_POST['sortname'], $param) && in_array($_POST['sortorder'], array('asc', 'desc'))) {
            $order = $_POST['sortname'] . ' ' . $_POST['sortorder'];
        }
        $page = $_POST['rp'];
        
        $withdraw_list = $model_member->getMemberCommissionList($condition, '*', $page, $order);
        
        // 获得会员佣金列表
        $data = array();
        $data['now_page'] = $model_member->shownowpage();
        $data['total_num'] = $model_member->gettotalnum();
        foreach ($withdraw_list as $value) {
            $param = array();
            // $param['operation'] = "<a class='btn red' href='javascript:void(0);' onclick=\"fg_del('" . $value['videos_id'] . "')\"><i class='fa fa-trash-o'></i>查看</a>";
            $param['c_id'] = $value['c_id'];
            $param['member_name'] = $value['member_name'];
            $param['c_money'] = $value['c_money'];
            $param['c_time'] = date('Y-m-d H:i:s', $value['c_time']);;
            $param['c_note'] = $value['c_note'];
            $data['list'][$value['c_id']] = $param;
        }
        echo Tpl::flexigridXML($data);exit();
    }

}
