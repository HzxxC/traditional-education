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
class settingControl extends SystemControl{
    private $links = array(
        array('url'=>'act=setting&op=base','lang'=>'fx_set')
    );
    public function __construct(){
        parent::__construct();
        Language::read('setting');
    }

    public function indexOp() {
        $this->baseOp();
    }

    /**
     * 基本信息
     */
    public function baseOp(){
        $model_setting = Model('setting');
        if (chksubmit()){
            
            $list_setting = $model_setting->getListSetting();
            $update_array = array();
            $update_array['site_video_price'] = $_POST['site_video_price'];
            $update_array['site_first_ratio'] = $_POST['site_first_ratio'];
            $update_array['site_second_ratio'] = $_POST['site_second_ratio'];
           
            $result = $model_setting->updateSetting($update_array);
            if ($result === true){
                $this->log(L('nc_edit,web_set'),1);
                showMessage(L('nc_common_save_succ'));
            }else {
                $this->log(L('nc_edit,web_set'),0);
                showMessage(L('nc_common_save_fail'));
            }
        }
        $list_setting = $model_setting->getListSetting();
        Tpl::output('list_setting',$list_setting);
        //输出子菜单
        Tpl::output('top_link',$this->sublink($this->links,'base'));
		Tpl::setDirquna('distribute');

        Tpl::showpage('setting.base');
    }

   
}
