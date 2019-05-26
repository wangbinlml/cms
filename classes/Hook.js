const fs = require('fs');
const mysql = require('./db/MySQL');
const stringUtils = require('./utils/StringUtils');

function Hook() {
    // hook name
    this.name;
}

Hook.prototype = {
    /**
     * Return hook ID from name
     *
     * @param string $hookName Hook name
     * @return integer Hook ID
     */
    get: async function ($hookName) {

        let result = await mysql.query(' SELECT id_hook, name FROM tb_hook WHERE name = ?', name);

        return (result ? result[0]['id_hook'] : false);
    },

    getHooks: async function (position) {
        let sql = 'SELECT *  FROM tb_hook';
        if (position) {
            sql = sql + 'WHERE h.`position` = 1';
        }
        let result = await mysql.query(sql);
        return result;
    },

    getModulesFromHook: async function (id_hook, id_module) {
        if (!id_module) {
            return await mysql.query('SELECT * FROM bs_module m LEFT JOIN bs_hook_module hm ON hm.id_module = m.id_module WHERE hm.id_hook = ?', id_hook);
        } else {
            return await mysql.query('SELECT * FROM bs_module m LEFT JOIN bs_hook_module hm ON hm.id_module = m.id_module WHERE hm.id_hook = ? and  AND m.id_module = ?', [id_hook, id_module]);
        }

    }
};
module.exports = Hook;