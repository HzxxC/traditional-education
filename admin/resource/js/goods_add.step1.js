// 选择商品分类
function selClass($this){

    $('.wp_category_list').css('background', '');

    $this.siblings('li').children('a').attr('class', '');
    $this.children('a').attr('class', 'classDivClick');
    var data_str = '';
    eval('data_str = ' + $this.attr('data-param'));
    $('#class_id').val(data_str.gcid);
    $('#t_id').val(data_str.tid);
    $('#dataLoading').show();
    var deep = parseInt(data_str.deep) + 1;
    
    $.getJSON('index.php?act=goods&op=ajax_goods_class', {gc_id : data_str.gcid, deep: deep}, function(data) {
        if (data != null) {
            $('input[nctype="buttonNextStep"]').attr('disabled', true);
            $('#class_div_' + deep).children('ul').html('').end()
                .parents('.wp_category_list:first').removeClass('blank')
                .parents('.sort_list:first').removeClass('none').nextAll('div').addClass('none').children('div').addClass('blank').children('ul').html('');
            $.each(data, function(i, n){
                $('#class_div_' + deep).children('ul').append('<li data-param="{gcid:'
                        + n.gc_id +',deep:'+ deep +',tid:'+ n.type_id +'}"><a class="" href="javascript:void(0)"><i class="fa fa-angle-right"></i>'
                        + n.gc_name + '</a></li>')
                        .find('li:last').click(function(){
                            selClass($(this));
                        });
            });
        } else {
            $('#class_div_' + data_str.deep).parents('.sort_list:first').nextAll('div').addClass('none').children('div').addClass('blank').children('ul').html('');
            disabledButton();
        }
        // 显示选中的分类
        showCheckClass();
        $('#dataLoading').hide();
    });
}
function disabledButton() {
    if ($('#class_id').val() != '') {
        $('#submitBtn').attr('disabled', false).removeClass('disabled').addClass('ncap-btn-green');
    } else {
        $('#submitBtn').attr('disabled', true).removeClass('ncap-btn-green').addClass('disabled');
    }
}

$(function(){
    //自定义滚定条
    $('#class_div_1').perfectScrollbar();
    $('#class_div_2').perfectScrollbar();
    $('#class_div_3').perfectScrollbar();

    // ajax选择分类
    $('li[nctype="selClass"]').click(function(){
        selClass($(this));
    });

    // 返回分类选择
    $('a[nc_type="return_choose_sort"]').unbind().click(function(){
        $('#class_id').val('');
        $('#t_id').val('');
        $('#commoditydd').html('');
        $('.wp_search_result').hide();
        $('.wp_sort').show();
    });
    
    // 常用分类选择 展开与隐藏
    $('#commSelect').hover(
        function(){
            $('#commListArea').show();
        },function(){
            $('#commListArea').hide();
        }
    );
     
    
});
// 显示选中的分类
function showCheckClass(){
    var str = "";
    $.each($('a[class=classDivClick]'), function(i) {
        str += $(this).text() + '<i class="fa fa-angle-right"></i>';
    });
    str = str.substring(0, str.length - 33);
    $('#commoditydd').html(str);
}