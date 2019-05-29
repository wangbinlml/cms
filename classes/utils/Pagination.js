const mysql = require('../db/MySQL');
module.exports.getData= async (sql, current_page, num) => {
    current_page = (current_page && parseInt(current_page)) || 1; //默认为1
    num = num || 10; //一页条数
    let last_page = current_page - 1;
    if (current_page <= 1) {
        last_page = 1;
    }
    let next_page = current_page + 1;
    let start = (current_page - 1) * num;
    //let sql = 'SELECT COUNT(*) FROM record; SELECT * FROM record limit ' + start + ',20';
    let results = await mysql.query(sql[1], [start, num]);
    let count = await mysql.query(sql[0]);

    // 计算总页数
    let allCount = count[0]['count'];
    let allPage = parseInt(allCount) / num;
    let pageStr = allPage.toString();
    // 不能被整除
    if (pageStr.indexOf('.') > 0) {
        allPage = parseInt(pageStr.split('.')[0]) + 1;
    }
    return {
        total_pages: allPage,
        last_page: last_page,
        current_page: current_page,
        data: results
    }
};
