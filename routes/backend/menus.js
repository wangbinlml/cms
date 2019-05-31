const express = require('express');
const mysql = require('../../classes/db/MySQL');
const router = express.Router();
const log = require('../../classes/utils/Logger').getLogger("system");
const menu_auth = require("./menu_auth");
const common = require("../../classes/Common");
const moment = require("moment");

/* GET users listing. */
router.get('/', (req, res, next) => {
    res.render('backend/menu', {
        user: req.session.user,
        menus: req.session.menus,
        menu_active: req.session.menu_active['/admin/menus'] || {},
        title: '菜单管理',
        router: '/admin/menus'
    });
});
router.get('/load', async (req, res, next) => {
    let menus = req.session.menus;
    let parentMenu = {};
    for (let i = 0; i < menus.length; i++) {
        let menu = menus[i];
        parentMenu[menu['menu_id']] = menu['menu_name'];
    }
    let sqlcount = "select count(*) count from tb_menu where is_del=0";
    let sql = "select * from tb_menu where is_del=0";

    let start = req.query.start;
    let length = req.query.length;
    let draw = req.query.draw;
    if (!start || !draw || !length) {
        res.status(401).json("invoke error!");
        return;
    }

    start = parseInt(start) || 0;
    length = parseInt(length) || 0;
    draw = parseInt(draw) || 0;

    let search = req.query.search;
    if (search) {
        sqlcount = sqlcount + " and menu_name like '%" + search.value + "%'";
        sql = sql + " and menu_name like '%" + search.value + "%'";
    }

    let memuCount = await mysql.query(sqlcount);
    sql = sql + " ORDER BY parent_id ASC,menu_id ASC limit " + start + "," + length;
    let result = await mysql.query(sql);
    let backResult = {
        draw: draw,
        recordsTotal: memuCount['0']['count'],
        recordsFiltered: memuCount['0']['count'],
        data: []
    };
    for (let i in result) {
        backResult.data.push({
            id: result[i].menu_id,
            is: result[i].menu_id + "_",
            parent_id: result[i].parent_id,
            menu_name: result[i].menu_name,
            parent_menu_name: parentMenu[result[i].parent_id] || "无",
            menu_url: result[i].menu_url,
            menu_icon: result[i].menu_icon,
            created_at: result[i].created_at ? moment(result[i].created_at).format("YYYY-MM-DD HH:mm:ss") : "",
            modified_at: result[i].modified_at != "0000-00-00 00:00:00" ? moment(result[i].modified_at).format("YYYY-MM-DD HH:mm:ss") : "",
        });
    }
    res.status(200).json(backResult);
});

router.get('/getParentMenu', async (req, res, next) => {
    try {
        let sql = "select * from tb_menu where parent_id=0 and is_del=0";
        let result = await mysql.query(sql);
        res.status(200).json({
            error: 0,
            msg: "",
            data: result
        });
    } catch (e) {
        log.error("get parent menu: ", e);
        res.status(500).json({
            error: 0,
            msg: "获取父级菜单失败，请联系管理"
        });
    }
});
router.get('/save', async (req, res, next) => {
    let result = {
        error: 0,
        msg: ""
    };
    try {
        let user = req.session.user;
        log.info("save menu params: ", req.query);
        let e_id = req.query.e_id;
        let e_menu_name = req.query.e_menu_name;
        let e_parent_id = req.query.e_parent_id;
        let e_menu_url = req.query.e_menu_url;
        let e_menu_icon = req.query.e_menu_icon;
        if (e_menu_name == "" || e_menu_name.trim() == "") {
            result.msg = "角色不能为空";
        }
        if (result.msg != "") {
            result.error = 1;
        } else {
            let ret, sql;
            if (e_id) {
                sql = "update tb_menu set menu_name=?,parent_id=?,menu_url=?,menu_icon=?, modified_id=?, modified_at=? where menu_id=?";
                let params = [e_menu_name, e_parent_id, e_menu_url, e_menu_icon, user.id, new Date(), e_id];
                ret = await mysql.query(sql, params);
                await common.saveOperateLog(req, "更新菜单：" + e_menu_name + ";ID: " + e_id);
            } else {
                sql = "select * from tb_menu where menu_name=? and is_del=0";
                let users = await mysql.query(sql, e_menu_name);
                if (users.length > 0) {
                    result.error = 1;
                    result.msg = "菜单名已经存在！";
                } else {
                    sql = "insert tb_menu(menu_name, parent_id,menu_url,menu_icon,creator_id) values (?,?,?,?,?)";
                    ret = await mysql.query(sql, [e_menu_name, e_parent_id, e_menu_url, e_menu_icon, user.id]);
                    await common.saveOperateLog(req, "新增菜单：" + e_menu_name);
                }
            }
            log.info("save menu ret: ", ret);
            // session中设置菜单
            if(user && user['id']) {
                await menu_auth.setMenus(req, user['id']);
            }
        }
        res.status(200).json(result);
    } catch (e) {
        log.error("save menu ret:", e);
        result.error = 1;
        result.msg = "保存失败，请联系管理员";
        res.status(200).json(result);
    }
});
router.delete('/delete', async (req, res, next) => {
    let result = {
        error: 0,
        msg: ""
    };

    let user = req.session.user;
    log.info("delete menu params: ", req.body);
    let ids = req.body.ids;
    if (ids && ids.trim() != "") {
        let conn = await mysql.getConnection();
        try {
            ids = ids.split(",");
            let pSql = "select * from tb_menu where parent_id in (";
            let sql = 'delete from tb_menu_role where menu_id in (';
            let sql3 = 'update tb_menu set is_del=1, modified_at=?, modified_id=? where menu_id in (';
            for (let i = 0; i < ids.length; i++) {
                if (i == 0) {
                    sql = sql + ids[i];
                    sql3 = sql3 + ids[i];
                    pSql = pSql + ids[i];
                } else {
                    sql = sql + "," + ids[i];
                    sql3 = sql3 + "," + ids[i];
                    pSql = pSql + "," + ids[i];
                }
            }
            sql = sql + ")";
            sql3 = sql3 + ")";
            pSql = pSql + ")";
            let parentMenu = await mysql.query2(conn, pSql);
            if (parentMenu && parentMenu.length > 0) {
                result.error = 1;
                result.msg = "删除项有子菜单，需要先删除子菜单";
                await mysql.rollback(conn);
            } else {
                await mysql.query2(conn, sql);
                await mysql.query2(conn, sql3, [new Date(), user.id]);
                await mysql.commit(conn);

                // session中设置菜单
                await menu_auth.setMenus(req, user['id']);
                await common.saveOperateLog(req, "删除菜单ID: " + ids);
            }
        } catch (e) {
            log.error("delete menu ret:", e);
            result.error = 1;
            result.msg = "删除失败，请联系管理员";
            await mysql.rollback(conn);
        }
    } else {
        result.error = 1;
        result.msg = "删除失败，必须选择一项";
    }
    res.status(200).json(result);
});
module.exports = router;