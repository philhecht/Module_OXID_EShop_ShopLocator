<?php

class shoplocator_out extends oxUBase
{
    /**
     * Current class template name.
     * @var string
     */
    protected $_sThisTemplate = 'shoplocator_out.tpl';


    public function render()
    {
        parent::render();
        $this->createJsonFile();
        $this->getLocation();
        return $this->_sThisTemplate;

    }
    /**
     * Builds the Javascript
     */
    public function getLocation()
    {

        $shadow = $this->getConfig()->getShopUrl() . 'modules/shoplocator/out/src/images/';

        $foldermarker = $this->getConfig()->getShopUrl() . 'modules/shoplocator/marker/';

        $sSelect = "select * from stores_settings";

        $rs = oxDb::getDb()->execute($sSelect);

        while (!$rs->EOF) {


            $title = $rs->fields[1];
            $description = $rs->fields[2];
            $streetview = $rs->fields[3];
            $direction = $rs->fields[4];
            $zoom = $rs->fields[5];
            if ($rs->fields[6] == '') {
                $styled_map = 'nostyle';

            } else {
                $styled_map = $rs->fields[6];
            }

            $rs->moveNext();

        }


        $javascript = "";
        $javascript = '<script type="text/javascript">';

        $javascript .= "
var SHADOW = new google.maps.MarkerImage('$shadow' + 'medicare-shadow.png', null, null,
    new google.maps.Point(14, 13));

google.maps.event.addDomListener(window, 'load', function(){



    var nostyle = ''
    var styles = $styled_map;
    var styled_map;



    var myOptions = {
        center: new google.maps.LatLng(47.2, 8.4),
        zoom: $zoom,
    }

     if(styles == '')
    {
        myOptions.mapTypeId = google.maps.MapTypeId.ROADMAP;
    }
    else{
        myOptions.mapTypeControlOptions = {mapTypeIds: [google.maps.MapTypeId.ROADMAP, \"map_style\"]};
        //alert(styles.toSource());

    }

  var map = new google.maps.Map(document.getElementById('map-canvas'), myOptions, {


  });



        if(styles != '')
        {
        var styledMap = new google.maps.StyledMapType(styles,{name: \"Styled Map\"});

        map.mapTypes.set('map_style', styledMap);
        map.setMapTypeId('map_style');
        }



      var panelDiv = document.getElementById('panel_list');

      var data = new MedicareDataSource;




      var view = new storeLocator.View(map, data,  {
        geolocation: false,
        features: data.getFeatures()




      });

      view.createMarker = function(store) {



          var details = store.getDetails();

          var markerbild = '' + '$foldermarker' + details.marker + ''

          //alert(markerbild);

          var ICON = new google.maps.MarkerImage(markerbild, null, null,
                new google.maps.Point(14, 13));



          var markerOptions = {
          position: store.getLocation(),
          icon: ICON,
          shadow: SHADOW,
          animation: google.maps.Animation.DROP,
          title: store.getDetails().title
        };
        return new google.maps.Marker(markerOptions);
  }






  var infoBubble = new InfoBubble;
  view.getInfoWindow = function(store) {




      if (!store) {
      return infoBubble;
    }




      var details = store.getDetails();


      var html = [
      '<div class=\"store\"><div class=\"title\">', details.title,
      '</div><div class=\"address\">', details.address, '</div>',
      '<div class=\"hours misc\">', details.hours, '</div>',
      '<div class=\"hours misc\">', details.description, '</div></div>'].join('');




    infoBubble.setContent($(html)[0]);




    //alert(infoBubble.toSource());
    return infoBubble;
    };

  var panel = new storeLocator.Panel(panelDiv, {
    view: view,
  });



  view.selectedStore_changed  = function(store) {

  var that = panel;
  var store = this.get('selectedStore');
  if (!store) {
    return;
  }



  var direction = $direction;
  var streetview = $streetview;


  var node = view.getInfoWindow().getContent();
  var directionsLink = $('<a/>')
                          .text('Directions')
                          .attr('href', '#')
                          .addClass('action')
                          .addClass('directions');

  // TODO(cbro): Make these two permanent fixtures in InfoWindow.
  // Move out of Panel.
  var zoomLink = $('<a/>')
                    .text('Zoom here')
                    .attr('href', '#')
                    .addClass('action')
                    .addClass('zoomhere');

  var streetViewLink = $('<a/>')
                          .text('Street view')
                          .attr('href', '#')
                          .addClass('action')
                          .addClass('streetview');

  directionsLink.click(function() {
    that.showDirections();
    return false;
  });

  zoomLink.click(function() {
    view.getMap().setOptions({
      center: store.getLocation(),
      zoom: 16
    });
  });

  streetViewLink.click(function() {
    var streetView = view.getMap().getStreetView();
    streetView.setPosition(store.getLocation());
    streetView.setVisible(true);
  });



   if(direction == '1'){

   $(node).append(directionsLink);


   }

   if(streetview == '1'){

   $(node).append(streetViewLink);


   }



  $(node).append(zoomLink);


  }



});


";


        $javascript .= "</script>";

        $this->_aViewData['title'] = $title;


        $this->_aViewData['javascript'] = $javascript;


    }

    /**
     *
     */
    public function  createJsonFile()
    {
        // Select all the rows in the markers table
        $sQ = "SELECT * from stores ";

        $sQ2 = "SELECT * from stores_settings ";


        $rs = oxDb::getDb()->execute($sQ);

        $rs2 = oxDb::getDb()->execute($sQ2);


        $result = array();
        $stores = array();
        $stores_settings = array();


        $rows = $rs->RecordCount();

        $rows2 = $rs2->RecordCount();


        for ($row = 0; $row < $rows; $row++) {

            if ($rs->fields[11]) {
                $stores[$row]['oxid'] = $rs->fields[0];
                $stores[$row]['store_name'] = $rs->fields[1];
                $stores[$row]['store_address'] = $rs->fields[2];
                $stores[$row]['store_city'] = $rs->fields[3];
                $stores[$row]['store_zip'] = $rs->fields[4];
                $country = $rs->fields[5];

                $soxIdQuery = "SELECT oxtitle FROM oxcountry WHERE OXID = '$country' ";

                $stores[$row]['store_country'] = oxDb::getDb()->getOne($soxIdQuery);

                $stores[$row]['store_contact'] = $rs->fields[6];
                $stores[$row]['store_description'] = $rs->fields[7];
                $stores[$row]['store_latitude'] = $rs->fields[8];
                $stores[$row]['store_logitude'] = $rs->fields[9];
                $stores[$row]['store_marker'] = $rs->fields[10];
                $stores[$row]['store_active'] = $rs->fields[11];
            }
            $rs->moveNext();


        }


        for ($row = 0; $row < $rows2; $row++) {


            $stores_settings[$row]['oxid'] = $rs2->fields[0];
            $stores_settings[$row]['title'] = utf8_encode($rs2->fields[1]);
            $stores_settings[$row]['short_description'] = utf8_encode($rs2->fields[2]);
            $stores_settings[$row]['streetview_active'] = $rs2->fields[3];
            $stores_settings[$row]['direction_active'] = $rs2->fields[4];
            $stores_settings[$row]['zoom_factor'] = $rs2->fields[5];
            $stores_settings[$row]['styled_map'] = $rs2->fields[6];


            $rs2->moveNext();


        }

        $result["stores_settings"] = $stores_settings;

        $result["stores"] = $stores;

        $json_data = json_encode($result);

        $this->writeJSON('data', $json_data);

    }


    public function writeJSON($file_name, $data)
    {


        $file = $this->getConfig()->getModulesDir() . 'shoplocator/out/src/data/' . $file_name . '.json';


        $fh = fopen($file, 'w')
        or die("Error opening output file");
        fwrite($fh, $data);
        fclose($fh);


    }


}
