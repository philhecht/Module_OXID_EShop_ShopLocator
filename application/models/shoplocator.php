<?php

class shoplocator extends oxBase
{
    /**
     * Current class name
     *
     * @var string
     */
    protected $_sClassName = 'shoplocator';

    /**
     * Core database table name. $sCoreTable could be only original data table name and not view name.
     *
     * @var string
     */
    protected $_sCoreTable = 'stores';

    /**
     * Initiates Obejct Structure
     * @param $aParams
     */
    public function __construct($aParams = null)
    {
        parent::__construct();
        $this->init('stores');
    }

    /**
     * Returns SQL select string with checks if items are available
     *
     * @param bool $blForceCoreTable forces core table usage (optional)
     *
     * @return string
     */
    public function getSqlActiveSnippet($blForceCoreTable = null)
    {
        $sQ = '';
        $sTable = $this->getViewName($blForceCoreTable);

        // has 'active' field ?
        $sQ = " $sTable.store_active = 1 ";

        return $sQ;
    }
}
?>