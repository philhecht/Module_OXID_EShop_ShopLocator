[{oxscript add="$('a.js-external').attr('target', '_blank');"}]
[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="Filial Suche"|oxmultilangassign }]
    [{assign var="search_head" value="PAGE_SEARCH_SEARCH_HITSFOR"|oxmultilangassign}]


    <script type="text/javascript" charset="utf-8" src="//maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <script type="text/javascript"  src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script>
        function MedicareDataSource() {
            $.extend(this, new storeLocator.StaticDataFeed);

            var that = this;

            $.getJSON('[{$oViewConf->getModuleUrl('shoplocator','out/src/data/data.json')}]', function(data) {
                that.setStores(that.parse_(data));
            });
        }
    </script>
    <script type="text/javascript" charset="utf-8" src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/infobubble/src/infobubble-compiled.js"></script>
    <script type="text/javascript" charset="utf-8" src="[{$oViewConf->getModuleUrl('shoplocator','out/src/javascript/store-locator.compiled.js')}]"></script>
    <script src="[{$oViewConf->getModuleUrl('shoplocator','out/src/javascript/medicare-static-ds.js')}]" type="text/javascript"></script>
    [{$javascript}]
    <link rel="stylesheet" href="[{$oViewConf->getModuleUrl('shoplocator','out/src/css/storelocator.css')}]">


    <h1 class="pageHead">[{$title}]</h1>
    [{insert name="oxid_tracker" title=$template_title }]


    <div id="panel_list"></div>
    <div id="map-canvas"></div>


    [{/capture}]
[{include file="layout/page.tpl" }]