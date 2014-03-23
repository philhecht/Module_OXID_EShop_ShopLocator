<?php

class shoplocator_settings extends oxBase
{
    /**
     * Current class name
     *
     * @var string
     */
    protected $_sClassName = 'shoplocator_settings';

    /**
     * Core database table name. $sCoreTable could be only original data table name and not view name.
     *
     * @var string
     */
    protected $_sCoreTable = 'stores_settings';

    /**
     * Initiates Obejct Structure
     * @param $aParams
     */
    public function __construct($aParams = null)
    {
        parent::__construct();
        $this->init('stores_settings');
    }


}

?>