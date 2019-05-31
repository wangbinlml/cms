const express = require('express');
const router = express.Router();
const stringUtils = require("../../classes/utils/StringUtils");
const mysql = require('../../classes/db/MySQL');
const menu_auth = require("./menu_auth");
const common = require("../../classes/Common");
const passport = require('../../classes/Passport');

/* GET home page. */
router.get('/', (req, res, next) => {
    const user = req.user;
    if (user) {
        res.redirect("/admin");
    }
    res.render('backend/login', {title: 'Login', msg: "请输入您的用户名和密码"});
});
router.get('/exit', (req, res, next) => {
    req.session.destroy(function (err) {
        if (err) {
            console.error("--> session destroy failed.err -> ", err);
        }
    });
    res.redirect("/admin");
});
/* POST */
router.post('/', function (req, res, next) {
    passport.authenticate('local', function (err, user, info) {
        if (err) {
            return next(err);
        }
        if (!user) {
            return res.redirect('/admin/login');
        }
        req.logIn(user, async function (err) {
            if (err) {
                return next(err);
            }
            req.session.user = user;
            // session中设置菜单
            await menu_auth.setMenus(req, user['id_employee']);
            await common.saveLoginLog(req);
            res.status(200).json({error: 0, msg: "登录成功"});
            //return res.redirect('/admin');
        });
    })(req, res, next);
});
module.exports = router;