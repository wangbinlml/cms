function Module(id) {
    this.id = id;
}

Module.prototype = {
    _construct: function(){

    },
    install: function () {

    },
    uninstall : function () {
        
    },
    /**
     * This function enable module $name. If an $name is an array,
     * this will enable all of them
     *
     * @param array|string $name
     * @return true if succeed
     * @since 1.4.1
     * @deprecated since 1.7
     * @see  PrestaShop\PrestaShop\Core\Addon\Module\ModuleManager->enable($name)
     */
    enableByName: function (name) {
        
    },
    /**
     * Activate current module.
     *
     * @param bool $force_all If true, enable module for all shop
     */
    enable:function () {

    },
    /**
     * This function disable all module $name. If an $name is an array,
     * this will disable all of them
     *
     * @param array|string $name
     * @return true if succeed
     * @since 1.7
     */
    disableAllByName:function (name) {
        
    },
    /**
     * This function disable module $name. If an $name is an array,
     * this will disable all of them
     *
     * @param array|string $name
     * @return true if succeed
     * @since 1.4.1
     * @deprecated since 1.7
     * @see  PrestaShop\PrestaShop\Core\Addon\Module\ModuleManager->disable($name)
     */
    disableByName: function(name) {

    },
    /**
     * Desactivate current module.
     *
     * @param bool $force_all If true, disable module for all shop
     */
    disable: function() {

    },
    /**
     * Connect module to a hook
     *
     * @param string $hook_name Hook name
     * @param array $shop_list List of shop linked to the hook (if null, link hook to all shops)
     * @return bool result
     */
    public function registerHook($hook_name, $shop_list = null)
    {
        return Hook::registerHook($this, $hook_name, $shop_list);
    }

    /**
     * Unregister module from hook
     *
     * @param mixed $id_hook Hook id (can be a hook name since 1.5.0)
     * @param array $shop_list List of shop
     * @return bool result
     */
    public function unregisterHook($hook_id, $shop_list = null)
    {
        return Hook::unregisterHook($this, $hook_id, $shop_list);
    },
    /*
    * Reposition module
    *
    * @param bool $id_hook Hook ID
    * @param bool $way Up (0) or Down (1)
    * @param int $position
    */
    updatePosition:function ($id_hook, $way, $position = null) {

    },
    public function displayConfirmation($string)
    {
        $output = '
            <div class="bootstrap">
        <div class="module_confirmation conf confirm alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        '.$string.'
        </div>
        </div>';
        return $output;
    }
}

module.exports = Module;