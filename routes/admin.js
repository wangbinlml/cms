const express = require('express');
const router = express.Router();

const index = require('./backend/index');
const menus = require('./backend/menus');
const roles = require('./backend/roles');
const users = require('./backend/users');
const login_log = require('./backend/login_log');
const operation_log = require('./backend/operations');
const contents = require('./backend/contents');
const channels = require('./backend/channels');
const resources = require('./backend/resources');
const login = require('./backend/login');
const passport = require('../classes/Passport');

//配置路由
router.use('/', passport.authenticateMiddleware(), index);
router.use('/users', passport.authenticateMiddleware(), users);
router.use('/menus', passport.authenticateMiddleware(), menus);
router.use('/roles', passport.authenticateMiddleware(), roles);
router.use('/login_log', passport.authenticateMiddleware(), login_log);
router.use('/operation_log', passport.authenticateMiddleware(), operation_log);
router.use('/contents', passport.authenticateMiddleware(), contents);
router.use('/channels', passport.authenticateMiddleware(), channels);
router.use('/resources', passport.authenticateMiddleware(), resources);
router.use('/login', login);

module.exports = router;