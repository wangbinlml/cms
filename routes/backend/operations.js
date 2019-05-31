const express = require('express');
const mysql = require('../../classes/db/MySQL');
const log = require('../../classes/utils/Logger').getLogger("system");
const router = express.Router();
const _ = require('lodash');
const moment = require('moment');

/* GET users listing. */
router.get('/', (req, res, next) => {
    res.render('backend/operation_log', {
        user: req.session.user,
        menus: req.session.menus,
        menu_active: req.session.menu_active['/admin/operation_log'] || {},
        title: '操作日志'
    });
});
router.get('/load', async(req, res, next) => {
    let sqlcount = "select count(*) count from tb_operation_logs ";
    let sql = "select * from tb_operation_logs ";

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
        sqlcount = sqlcount + " where operations like '%" + search.value + "%'";
        sql = sql + " where operations like '%" + search.value + "%'";
    }

    let memuCount = await mysql.query(sqlcount);
    sql = sql + " ORDER BY operate_time DESC limit " + start + "," + length;
    let result = await mysql.query(sql);
    let backResult = {
        draw: draw,
        recordsTotal: memuCount['0']['count'],
        recordsFiltered: memuCount['0']['count'],
        data: []
    };
    for (let i in result) {
        backResult.data.push({
            id: result[i].id,
            is: result[i].id + "_",
            operations: result[i].operations,
            user_name: result[i].user_name,
            name: result[i].name,
            operate_time: moment(result[i].operate_time).format("YYYY-MM-DD HH:mm:ss"),
        });
    }
    res.status(200).json(backResult);
});
router.delete('/delete', async(req, res, next) => {
    let result = {
        error: 0,
        msg: ""
    };

    try {
        log.info("delete operation log params: ", req.body);
        let ids = req.body.ids;
        if (ids && ids.trim() != "") {
            ids = ids.split(",");
            let sql = 'delete from tb_operation_logs where id in (';
            for (let i = 0; i < ids.length; i++) {
                if (i == 0) {
                    sql = sql + ids[i];
                } else {
                    sql = sql + "," + ids[i];
                }
            }
            sql = sql + ")";
            await mysql.query(sql);
        } else {
            result.error = 1;
            result.msg = "删除失败，必须选择一项";
        }
    } catch (e) {
        log.error("delete operation log ret:", e);
        result.error = 1;
        result.msg = "删除失败，请联系管理员";
    }
    res.status(200).json(result);
});
module.exports = router;