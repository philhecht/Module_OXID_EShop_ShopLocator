<?php

class Admin_Shoplocator_Main extends oxAdminDetails
{

    public function render()
    {
        parent::render();

        $myConfig  = $this->getConfig();

        $folder = $this->getConfig()->getConfigParam('sShopDir').'modules/shoplocator/marker/';

        // Image Array in function.php
        $allfiles = getMarkerimages($folder);

        $this->_aViewData['markers'] = $allfiles;

        $soxId = $this->_aViewData["oxid"] = $this->getEditObjectId();

        if ( $soxId != "-1" && isset( $soxId)) {
            // load object
            $oShoplocator = oxNew( "shoplocator" );
            $oShoplocator->load( $soxId );

            $this->_aViewData["edit"] =  $oShoplocator;

            //Disable editing for derived articles
            if ($oShoplocator->isDerived())
                $this->_aViewData['readonly'] = true;

        }

        return "admin_shoplocator_main.tpl";
    }



    /**
     * Speichert den Standort mit den jeweiligen Parameter
     * Saves selection list parameters changes.
     *
     * @return mixed
     */
    public function save()
    {

        parent::save();

        $this->resetContentCache();

        $soxId = $this->getEditObjectId();
        $aParams = oxConfig::getParameter( "editval");

        if ( !isset( $aParams['stores__store_active']))
            $aParams['stores__store_active'] = 0;

        $oShoplocator = oxNew( "shoplocator" );

        if (isset( $aParams['stores__store_address'])){
            $address = str_replace(' ','',$aParams['stores__store_address'])."+".$aParams['stores__store_city']."+".$aParams['stores__store_zip'];

            $pc = file_get_contents('http://maps.googleapis.com/maps/api/geocode/json?address='.$address.'&sensor=false');

            $output= json_decode($pc);


            $aParams['stores__store_latitude'] = $output->results[0]->geometry->location->lat;
            $aParams['stores__store_logitude'] = $output->results[0]->geometry->location->lng;

        }

        if ( $soxId != "-1")
            $oShoplocator->load( $soxId );
        else {
            $aParams['stores__oxid'] = null;
        }

        //Disable editing for derived articles
        if ($oShoplocator->isDerived())
            return;



        $oShoplocator->assign( $aParams);


        $oShoplocator->save();

        // set oxid if inserted
        $this->setEditObjectId( $oShoplocator->getId() );
    }

    /**
     * Returns shop manufacturers list
     *
     * @return oxmanufacturerlist | array
     */
    public function getCountryList()
    {
        $oCouTree = oxNew( "oxCountryList");
        $oCouTree->loadActiveCountries();

        return $oCouTree;
    }




}


