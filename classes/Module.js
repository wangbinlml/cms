const fs = require('fs');
const mysql = require('./db/MySQL');
const stringUtils = require('./utils/StringUtils');
const logger = require("./utils/logger").getLogger("system");
var path = require('path');

function Module() {
    // module id
    this.id;
    // module name
    this.name;
    // status
    this.active;
    // desc
    this.desc = "";
    // module web path (eg. '/cms/modules/modulename/')
    this.path = "";
}

Module.prototype = {
    install: async function () {
        if (!stringUtils.isModuleName(this.name)) {
            return false;
        }
        let result = await mysql.query('select * from tb_module where name=?', this.name);
        if (result.length > 0) {
            return false;
        }
        result = await mysql.query('insert into tb_module(name, active,desc,path) value (?,?,?,?)', [this.name, this.active, this.desc, this.path])
        return result.insertId;
    },
    uninstall: async function () {
        let result = await mysql.query('select * from tb_hook_module where id_module=?', this.id);
        for (let i = 0; i < result.length; i++) {
            let hook = result[i];
            await mysql.query("delete from tb_hook_module where id_hook = ?", hook.id_hook);
        }
        return await mysql.query("delete from tb_module where id = ?", this.id);
    },

    /**
     * Connect module to a hook
     *
     * @param string $hook_name Hook name
     * @return boolean result
     */
    registerHook: async function (hook_name) {
        if (!this.id) {
            return false;
        }
        // Check if already register
        let result = await mysql.query('select hm.id_module from tb_hook_module hm , tb_hook h where hm.id_hook = h.id_hook and hm.id_module=? and h.name', [this.id, hook_name]);
        if (!result || result.length == 0) {
            return false;
        }
        // Get hook id
        result = await mysql.query('select id_hook from tb_hook where name=?', hook_name);
        if (!result || result.length == 0) {
            return false;
        }
        // Get module position in hook
        let result2 = await mysql.query('select max(position) position from tb_hook_module where id_hook=?', result[0]['id_hook']);

        // Register module in hook

        await query('INSERT INTO `tb_hook_module` (`id_module`, `id_hook`, `position`) ' +
            ' VALUES (' + this.id + ', ' + result[0]['id_hook'] + ', ' + (parseInt(result2[0]['position']) + 1) + ')');
        return result;
    },

    /**
     * Unregister module from hook
     *
     * @param int $id_hook Hook id
     * @return boolean result
     */
    unregisterHook: async function (hook_id) {
        return await query('DELETE  FROM `tb_hook_module` WHERE `id_module` = ' + this.id + ' AND `id_hook` = ' + hook_id);
    },

    /**
     * Return an instance of the specified module
     *
     * @param string $moduleName Module name
     * @return Module instance
     */
    getInstanceByName: function (moduleName) {
        if (!fs.existsSync(process.cwd() + "/themes/default/modules/" + moduleName + '/' + moduleName + '.js'))
            return false;
        let moduleInstance = require("../themes/default/modules/" + moduleName + '/' + moduleName + '.js').instance();
        return moduleInstance;
    },
    /**
     * Return an instance of the specified module
     *
     * @param integer $id_module Module ID
     * @return Module instance
     */
    getInstanceById: async function (id_module) {
        let result = await mysql.query('SELECT name FROM tb_module WHERE  id_module = ' + id_module);
        return (result && result.length > 0 ? this.getInstanceByName(result[0]['name']) : false);
    },
    /**
     * Return installed modules
     *
     * @return array Modules
     */
    getModulesInstalled: async function () {
        return await mysql.query('SELECT * FROM tb_module m  LEFT JOIN tb_hook_module hm ON m.id_module = hm.id_module LEFT JOIN tb_hook k ON hm.id_hook = k.id_hook');
    },
    /*
	 * Execute modules for specified hook
	 *
	 * @param string $hook_name Hook Name
	 * @param array $hookArgs Parameters for the functions
	 * @return string modules output
	 */
    hookExec: async function (hook_name, hookArgs, id_module) {
        let sql = 'SELECT hm.`id_hook`, m.`name`, hm.`position` FROM `tb_module` m ' +
            'LEFT JOIN `tb_hook_module` hm ON hm.`id_module` = m.`id_module` ' +
            'LEFT JOIN `tb_hook` h ON h.`id_hook` = hm.`id_hook` ' +
            'WHERE h.`name` = ? AND m.`active` = 1 ' + (id_module ? 'AND m.`id_module` = ' + id_module : '') + ' ORDER BY hm.`position`, m.`name` DESC';
        logger.info("hookExec: " + sql);
        let result = await mysql.query(sql, hook_name);
        if (!result)
            return false;
        let output = "";
        for (let i = 0; i < result.length; i++) {
            let module = result[i];
            let moduleName = module['name'];
            let moduleInstance = this.getInstanceByName(moduleName);
            if (!moduleInstance)
                continue;
            let func = 'hook'+hook_name;
            output = output + await moduleInstance[func].call(hookArgs);
        }
        return output;
    }
};

function instances() {
    return new Module();
}

module.exports.instances = instances;