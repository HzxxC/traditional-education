<?php
/**
 * 会员佣金
 *
 *
 *
 *
 * @好商城提供技术支持 授权请购买shopnc授权
 * @license    http://www.33hao.com
 * @link       交流群号：138182377
 */



defined('In33hao') or exit('Access Invalid!');

class memberControl extends SystemControl{
    const EXPORT_SIZE = 1000;
    public function __construct(){
        parent::__construct();
        Language::read('member');
    }

    public function indexOp() {
        $this->memberOp();
    }

    /**
     * 会员管理
     */
    public function memberOp(){
		Tpl::setDirquna('distribute');
        Tpl::showpage('member.index');
    }

    /**
     * 会员修改
     */
    public function member_editOp(){
        $lang   = Language::getLangContent();
        $model_member = Model('member');
        /**
         * 保存
         */
        if (chksubmit()){
            /**
             * 验证
             */
            $obj_validate = new Validate();
            $obj_validate->validateparam = array(
            array("input"=>$_POST["member_email"], "require"=>"true", 'validator'=>'Email', "message"=>$lang['member_edit_valid_email']),
            );
            $error = $obj_validate->validate();
            if ($error != ''){
                showMessage($error);
            }else {
                $update_array = array();
                $update_array['member_id']          = intval($_POST['member_id']);
                if (!empty($_POST['member_passwd'])){
                    $update_array['member_passwd'] = md5($_POST['member_passwd']);
                }
                $update_array['member_email']       = $_POST['member_email'];
                $update_array['member_truename']    = $_POST['member_truename'];
                $update_array['member_sex']         = $_POST['member_sex'];
                $update_array['member_qq']          = $_POST['member_qq'];
                $update_array['member_ww']          = $_POST['member_ww'];
                $update_array['inform_allow']       = $_POST['inform_allow'];
                $update_array['is_buy']             = $_POST['isbuy'];
                $update_array['is_allowtalk']       = $_POST['allowtalk'];
                if (!empty($_POST['member_avatar'])){
                    $update_array['member_avatar'] = $_POST['member_avatar'];
                }
                $result = $model_member->editMember(array('member_id'=>intval($_POST['member_id'])),$update_array);
                if ($result){
                    $url = array(
                    array(
                    'url'=>'index.php?act=member&op=member',
                    'msg'=>$lang['member_edit_back_to_list'],
                    ),
                    array(
                    'url'=>'index.php?act=member&op=member_edit&member_id='.intval($_POST['member_id']),
                    'msg'=>$lang['member_edit_again'],
                    ),
                    );
                    $this->log(L('nc_edit,member_index_name').'[ID:'.$_POST['member_id'].']',1);
                    showMessage($lang['member_edit_succ'],$url);
                }else {
                    showMessage($lang['member_edit_fail']);
                }
            }
        }
        $condition['member_id'] = intval($_GET['member_id']);
        $member_array = $model_member->getMemberInfo($condition);

        Tpl::output('member_array',$member_array);
		Tpl::setDirquna('shop');
        Tpl::showpage('member.edit');
    }

    /**
     * 新增会员
     */
    public function member_addOp(){
        $lang   = Language::getLangContent();
        $model_member = Model('member');
        /**
         * 保存
         */
        if (chksubmit()){
            /**
             * 验证
             */
            $obj_validate = new Validate();
            $obj_validate->validateparam = array(
                array("input"=>$_POST["member_name"], "require"=>"true", "message"=>$lang['member_add_name_null']),
                array("input"=>$_POST["member_passwd"], "require"=>"true", "message"=>'密码不能为空'),
                array("input"=>$_POST["member_email"], "require"=>"true", 'validator'=>'Email', "message"=>$lang['member_edit_valid_email'])
            );
            $error = $obj_validate->validate();
            if ($error != ''){
                showMessage($error);
            }else {
                $insert_array = array();
                $insert_array['member_name']    = trim($_POST['member_name']);
                $insert_array['member_passwd']  = trim($_POST['member_passwd']);
                $insert_array['member_email']   = trim($_POST['member_email']);
                $insert_array['member_truename']= trim($_POST['member_truename']);
                $insert_array['member_sex']     = trim($_POST['member_sex']);
                $insert_array['member_qq']      = trim($_POST['member_qq']);
                $insert_array['member_ww']      = trim($_POST['member_ww']);
                //默认允许举报商品
                $insert_array['inform_allow']   = '1';
                if (!empty($_POST['member_avatar'])){
                    $insert_array['member_avatar'] = trim($_POST['member_avatar']);
                }

                $result = $model_member->addMember($insert_array);
                if ($result){
                    $url = array(
                    array(
                    'url'=>'index.php?act=member&op=member',
                    'msg'=>$lang['member_add_back_to_list'],
                    ),
                    array(
                    'url'=>'index.php?act=member&op=member_add',
                    'msg'=>$lang['member_add_again'],
                    ),
                    );
                    $this->log(L('nc_add,member_index_name').'[ '.$_POST['member_name'].']',1);
                    showMessage($lang['member_add_succ'],$url);
                }else {
                    showMessage($lang['member_add_fail']);
                }
            }
        }
		Tpl::setDirquna('shop');
        Tpl::showpage('member.add');
    }

    /**
     * ajax操作
     */
    public function ajaxOp(){
        switch ($_GET['branch']){
            /**
             * 验证会员是否重复
             */
            case 'check_user_name':
                $model_member = Model('member');
                $condition['member_name']   = $_GET['member_name'];
                $condition['member_id'] = array('neq',intval($_GET['member_id']));
                $list = $model_member->getMemberInfo($condition);
                if (empty($list)){
                    echo 'true';exit;
                }else {
                    echo 'false';exit;
                }
                break;
                /**
             * 验证邮件是否重复
             */
            case 'check_email':
                $model_member = Model('member');
                $condition['member_email'] = $_GET['member_email'];
                $condition['member_id'] = array('neq',intval($_GET['member_id']));
                $list = $model_member->getMemberInfo($condition);
                if (empty($list)){
                    echo 'true';exit;
                }else {
                    echo 'false';exit;
                }
                break;
        }
    }

    /**
     * 输出XML数据
     */
    public function get_xmlOp() {
        $model_member = Model('member');
        $condition = array();
        if ($_POST['query'] != '') {
            $condition[$_POST['qtype']] = array('like', '%' . $_POST['query'] . '%');
        }
        $order = '';
        $param = array('member_id','member_name','member_avatar', 'member_mobile', 'member_time','member_login_time','member_login_ip','member_state',
            'commission_money', 'have_withdraw_money', 'no_withdraw_money'
        );
        if (in_array($_POST['sortname'], $param) && in_array($_POST['sortorder'], array('asc', 'desc'))) {
            $order = $_POST['sortname'] . ' ' . $_POST['sortorder'];
        }
        $page = $_POST['rp'];
        
        $member_list = $model_member->getMemberCommissionInfo($condition, '*', $page, $order);
        // 获得会员佣金列表
        $sex_array = $this->get_sex();

        $data = array();
        $data['now_page'] = $model_member->shownowpage();
        $data['total_num'] = $model_member->gettotalnum();
        foreach ($member_list as $value) {
            $param = array();
            // $param['operation'] = "<a class='btn red' href='javascript:void(0);' onclick=\"fg_del('" . $value['videos_id'] . "')\"><i class='fa fa-trash-o'></i>查看</a>";
            $param['member_id'] = $value['member_id'];
            $param['member_name'] = "<img src=".getMemberAvatarForID($value['member_id'])." class='user-avatar' onMouseOut='toolTip()' onMouseOver='toolTip(\"<img src=".getMemberAvatarForID($value['member_id']).">\")'>".$value['member_name'];
            $param['member_mobile'] = $value['member_mobile'];
            $param['commission_money'] = $value['commission_money'];
            $param['no_withdraw_money'] = $value['no_withdraw_money'];
            $param['have_withdraw_money'] = $value['have_withdraw_money'];
            $param['member_state'] = $value['member_state'] ==  '1' ? '<span class="yes"><i class="fa fa-check-circle"></i>可用</span>' : '<span class="no"><i class="fa fa-ban"></i>不可用</span>';
            $data['list'][$value['member_id']] = $param;
        }
        echo Tpl::flexigridXML($data);exit();
    }

    /**
     * 性别
     * @return multitype:string
     */
    private function get_sex() {
        $array = array();
        $array[1] = '男';
        $array[2] = '女';
        $array[3] = '保密';
        return $array;
    }
   
}
