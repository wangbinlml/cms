var Controller = require("../classes/controller/Controller");
var FrontController = require("../classes/controller/FrontController");
var d = new Controller();
d.init('Mitzie')
// 'Mitzie barks.'
d.speak();
console.log(d.name);
d = new Controller();
d.init('Huazai');

console.log(d.name);

var front = new FrontController();
front.init("张珊")
console.log(front.name);
front.speak();
front.abc()