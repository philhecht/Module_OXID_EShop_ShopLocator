<?php

/*
20.11.2012 oxutilfile.php extended
case 'PROMO':
                $sTarget = "/usr/www/users/voukxc/out/pictures/promo/". str_replace("_ico","",$oPictureHandler->getIconName( $sTarget ));
			 //echo $this->_prepareImageName();
                $this->_copyFile($sSource, $sTarget);
                break;
*/
class shoplocator_oxutilsfile extends shoplocator_oxutilsfile_parent
{
    /**
     * adds promo dir
     */

    public function processFile($sFileName, $sUploadPath)
    {

        parent::processFile($sFileName, $sUploadPath);

    }

    protected $_aTypeToPath = array(
        'TC' => 'master/category/thumb',
        'CICO' => 'master/category/icon',
        'PICO' => 'master/category/promo_icon',
        'MICO' => 'master/manufacturer/icon',
        'VICO' => 'master/vendor/icon',
        'PROMO' => self::PROMO_PICTURE_DIR,
        'ICO' => 'master/product/icon',
        'TH' => 'master/product/thumb',
        'M1' => 'master/product/1',
        'M2' => 'master/product/2',
        'M3' => 'master/product/3',
        'M4' => 'master/product/4',
        'M5' => 'master/product/5',
        'M6' => 'master/product/6',
        'M7' => 'master/product/7',
        'M8' => 'master/product/8',
        'M9' => 'master/product/9',
        'M10' => 'master/product/10',
        'M11' => 'master/product/11',
        'M12' => 'master/product/12',
        'MARKER' => 'marker',
        'P1' => '1',
        'P2' => '2',
        'P3' => '3',
        'P4' => '4',
        'P5' => '5',
        'P6' => '6',
        'P7' => '7',
        'P8' => '8',
        'P9' => '9',
        'P10' => '10',
        'P11' => '11',
        'P12' => '12',
        'Z1' => 'z1',
        'Z2' => 'z2',
        'Z3' => 'z3',
        'Z4' => 'z4',
        'Z5' => 'z5',
        'Z6' => 'z6',
        'Z7' => 'z7',
        'Z8' => 'z8',
        'Z9' => 'z9',
        'Z10' => 'z10',
        'Z11' => 'z11',
        'Z12' => 'z12',
        //
        'WP' => 'master/wrapping',
        'FL' => 'media',
    );


}