function Controller(){
    let name;
    let template;
    let css_files=[];
    let js_files = [];
}
Controller.prototype = {
    init: function (name) {
        this.name = name
    },
    speak: function () {
        console.log(this.name + ' makes a noise.');
    },

    postPrecess: function () {

    },
    display: function () {

    },
    setMedia: function () {

    },
    getController: function (className, auth, ssl) {
        return new className(auth, ssl);
    },
    run: function () {
        this.init();
    },
    setTemplate: function (template) {
        this.template = template;
    },
    initHeader: function () {

    },
    initContent: function () {

    },
    initFooter: function () {

    },
    addCSS: function (css_uri) {
        this.css_files = css_uri
    },
    removeCSS: function (css_uri) {

    },
    addJS: function (js_uri) {
        this.js_files = js_uri;
    },
    removeJS: function (js_uri) {

    },
    addJquery: function () {

    }
};


module.exports = Controller;