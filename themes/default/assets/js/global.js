function Init(){

}
Init.prototype.dropdownitem = function () {
    $('li.dropdown').mouseover(function () {
        $(this).addClass('open');
    }).mouseout(function () {
        $(this).removeClass('open');
    });
}
$(document).ready(function(){
    var init = new Init();
    $(document).off('click.bs.dropdown.data-api');
    init.dropdownitem();
});


