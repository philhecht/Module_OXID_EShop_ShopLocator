<?php


class admin_shoplocator_configuration extends oxAdminView
{

    /**
     * Current class template name.
     * @var string
     */
    protected $_sThisTemplate = "admin_shoplocator_configuration.tpl";


    public function render()

    {

        $Path = $this->getConfig()->getModulesDir() . 'shoplocator/marker/';


        /*
        $sBasePath = $this->getConfig()->getConfigParam('sShopDir');
        echo $sBasePath;



        $sBasePath = $this->getConfig()->getModulesDir()."shoplocator/";
        echo $sBasePath;
        */


        //echo $this->getConfig()->getShopUrl().'modules/shoplocator/out/src/images/';;

        // Ordner auslesen...

        $ordner = $this->getConfig()->getConfigParam('sShopDir') . 'modules/shoplocator/marker/';


        $allfiles = getMarkerimages($ordner);


        $this->_aViewData['ordner_marker'] = 'modules/shoplocator/marker/';

        $this->_aViewData['markers'] = $allfiles;

        $soxIdQuery = 'SELECT OXID FROM `stores_settings` ';

        $soxId = oxDb::getDb()->getOne($soxIdQuery, false, false);


        // load object
        $oShoplocator_Settings = oxNew("shoplocator_settings");
        $oShoplocator_Settings->load($soxId);


        $this->_aViewData["edit"] = $oShoplocator_Settings;


        return parent::render();

    }


    public function save()
    {

        $path = 'modules/shoplocator/marker';


        if ($_FILES['myfile']['size'] > 0) {
            oxUtilsFile::getInstance()->processFile('myfile', $path);
        }

        //$filename = oxUtilsFile::getInstance()->processFile('myfile', $path);


        $this->resetContentCache();

        $soxIdQuery = 'SELECT OXID FROM `stores_settings` ';

        $soxId = oxDb::getDb()->getOne($soxIdQuery, false, false);

        $aParams = oxConfig::getParameter("editval");


        if ($aParams['stores_settings__streetview_active'] == 'yes') {
            $aParams['stores_settings__streetview_active'] = 1;
        }

        if ($aParams['stores_settings__directions_active'] == 'yes') {
            $aParams['stores_settings__directions_active'] = 1;
        }


        $oShoplocator_Settings = oxNew("shoplocator_settings");


        $oShoplocator_Settings->assign($aParams);


        $oShoplocator_Settings->save();


    }


    public function deletePicture()
    {

        $blDeleted = false;

        $_sThisTemplate = $this->_sThisTemplate;


        $MarkerPicture = oxConfig::getParameter("MarkerPicture");

        $Path = $this->getConfig()->getModulesDir() . 'shoplocator/marker/';


        $sFile = $Path . $MarkerPicture;

        if (file_exists($sFile)) {
            $blDeleted = unlink($sFile);
        }

        return $this->$_sThisTemplate;
    }


}
