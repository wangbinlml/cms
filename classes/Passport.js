const passport = require('passport');
const LocalStrategy = require('passport-local');
const logger = require("./utils/logger").getLogger("system");
// 用户名密码验证策略
passport.use(new LocalStrategy(
    /**
     * @param username 用户输入的用户名
     * @param password 用户输入的密码
     * @param done 验证验证完成后的回调函数，由passport调用
     */
    async function (username, password, done) {
        try {
            let result = await global.mysql.query("select * from tb_employee where active = 0 and username = ?", username);
            if (result && result.length >0) {
                let user = result[0];
                var salt = user.salt;
                var password2 = stringUtils.createPassword(password.trim() + salt);
                if (user.password == password2) {
                    return done(null, user);
                } else {
                    logger.error('密码错误');
                    return done(null, false, {message: '密码错误'});
                }
            } else {
                logger.error('用户不存在');
                return done(null, false, {message: '用户不存在'});
            }
        } catch (e) {
            logger.error(e.message);
            return done(null, false, {message: e.message});
        }
    }
));
// serializeUser 用户登录验证成功以后将会把用户的数据存储到 session 中
passport.serializeUser(function (user, done) {
    done(null, user);
});
// deserializeUser 每次请求的时将从 session 中读取用户对象，并将其封装到 req.user
passport.deserializeUser(function (user, done) {
    return done(null, user);
});
// 这是封装了一个中间件函数到 passport 中，可以在需要拦截未验证的用户的请求的时候调用
passport.authenticateMiddleware = function authenticationMiddleware() {
    return function (req, res, next) {
        if (req.isAuthenticated() || req.originalUrl == '/admin/login') {
            return next();
        }
        res.redirect('/admin/login');
        //res.render('backend/login', {title: '员工登录', msg: "请输入您的用户名和密码"});
        //res.send('非法访问');
    }
};
module.exports = passport;
