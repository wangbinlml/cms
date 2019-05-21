var Controller = require("./Controller");
function FrontController(){
    let name;
    Controller.call(this);
}

(function(){
    // 创建一个没有实例方法的类
    let Super = function(){};
    Super.prototype = Controller.prototype;
    //将实例作为子类的原型
    FrontController.prototype = new Super();
    FrontController.prototype.abc = function () {
        console.log("=======")
    }

})();

module.exports = FrontController;