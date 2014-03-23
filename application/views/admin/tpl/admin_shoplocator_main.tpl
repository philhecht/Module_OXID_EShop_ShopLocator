[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign}]


<script type="text/javascript">
    <!--
    function editThis( sID )
    {
        var oTransfer = top.basefrm.edit.document.getElementById( "transfer" );
        oTransfer.oxid.value = sID;
        oTransfer.cl.value = top.basefrm.list.sDefClass;

        //forcing edit frame to reload after submit
        top.forceReloadingEditFrame();

        var oSearch = top.basefrm.list.document.getElementById( "search" );
        oSearch.oxid.value = sID;
        oSearch.actedit.value = 0;
        oSearch.submit();
    }
    [{if !$oxparentid}]
    window.onload = function ()
    {
        [{ if $updatelist == 1}]
        top.oxid.admin.updateList('[{ $oxid }]');
        [{ /if}]
        var oField = top.oxid.admin.getLockTarget();
        oField.onchange = oField.onkeyup = oField.onmouseout = top.oxid.admin.unlockSave;
    }
            [{/if}]
    //-->
</script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
   <style>


    #panel {
    position: absolute;
    top: 5px;
    left: 50%;
    margin-left: -180px;
    z-index: 5;
    background-color: #fff;
    padding: 5px;
    border: 1px solid #999;
    }
    </style>


[{ if $readonly }]
[{assign var="readonly" value="readonly disabled"}]
[{else}]
[{assign var="readonly" value=""}]
[{/if}]

<form name="transfer" id="transfer" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="oxidCopy" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="admin_shoplocator_main">
    <input type="hidden" name="language" value="[{ $actlang }]">
</form>


<form name="myedit" id="myedit" enctype="multipart/form-data" action="[{ $oViewConf->getSelfLink() }]" method="post">
    <input type="hidden" name="MAX_FILE_SIZE" value="[{$iMaxUploadFileSize}]">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="cl" value="admin_shoplocator_main">
    <input type="hidden" name="fnc" value="">
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="voxid" value="[{ $oxid }]">
    <input type="hidden" name="oxparentid" value="[{ $oxparentid }]">
    <input type="hidden" name="editval[stores__oxid]" value="[{ $oxid }]">
    <input type="hidden" name="language" value="[{ $actlang }]">

    [{assign var="latitude" value=$edit->stores__store_latitude->rawValue}]
    [{assign var="logitude" value=$edit->stores__store_logitude->rawValue}]
    <script>
        function initialize() {
            var myLatlng = new google.maps.LatLng([{$latitude}],[{$logitude}]);
            var mapOptions = {
                zoom: 17,
                center: myLatlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: 'Hello!'
            });
        }

        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
    <table style="float: left;" border="0" width="20%">
        <tr>
            <td valign="top" class="edittext">
                <table cellspacing="0" cellpadding="0" border="0">

                    <tr>
                        <td class="edittext" width="120">
                            [{ oxmultilang ident="GENERAL_ACTIVE" }]
                        </td>
                        <td class="edittext">

                            <input class="edittext" type="checkbox" name="editval[stores__store_active]" value='1' [{if $edit->stores__store_active->value == 1}]checked[{/if}] [{ $readonly }]>
                            [{ oxinputhelp ident="HELP_GENERAL_ACTIVE" }]
                        </td>
                    </tr>
                    <tr>
                        <td class="edittext">
                            [{ oxmultilang ident="SHOPLOCATOR_ADMIN_MAIN_TITLE" }]
                        </td>
                        <td class="edittext">
                            <input type="text" class="editinput" size="40" maxlength="[{$edit->stores__store_name->fldmax_length}]" id="oLockTarget" name="editval[stores__store_name]"
                                   value="[{$edit->stores__store_name->value}]" [{ $readonly }]>
                            [{ oxinputhelp ident="HELP_SHOPLOCATOR_ADMIN_MAIN_TITLE" }]
                        </td>
                    </tr>
                    <tr>
                        <td class="edittext">
                            [{ oxmultilang ident="SHOPLOCATOR_ADMIN_MAIN_ADDRESS" }]
                        </td>
                        <td class="edittext">
                            <input type="text" class="editinput" size="40"
                                   name="editval[stores__store_address]" value="[{$edit->stores__store_address->rawValue}]" [{ $readonly }]>
                            [{ oxinputhelp ident="HELP_SHOPLOCATOR_ADMIN_MAIN_ADDRESS" }]
                        </td>

                    </tr>
                    <tr>
                        <td class="edittext">
                            [{ oxmultilang ident="SHOPLOCATOR_ADMIN_MAIN_CITY" }]
                        </td>
                        <td class="edittext">
                            <input type="text" class="editinput" size="40"
                                   name="editval[stores__store_city]" value="[{$edit->stores__store_city->rawValue}]" [{ $readonly }]></textarea>
                            [{ oxinputhelp ident="HELP_SHOPLOCATOR_ADMIN_MAIN_CITY" }]
                        </td>
                    </tr>
                    <tr>
                        <td class="edittext">
                            [{ oxmultilang ident="SHOPLOCATOR_ADMIN_MAIN_ZIP" }]
                        </td>
                        <td class="edittext">
                            <input type="text" class="editinput" size="40"
                                   name="editval[stores__store_zip]" value="[{$edit->stores__store_zip->rawValue}]" [{ $readonly }]>
                            [{ oxinputhelp ident="HELP_SHOPLOCATOR_ADMIN_MAIN_ZIP" }]
                        </td>
                    </tr>
                    <tr>
                        <td class="edittext">
                            [{ oxmultilang ident="SHOPLOCATOR_ADMIN_MAIN_COUNTRY" }]
                        </td>
                        <td class="edittext">
                            <select name="editval[stores__store_country]" class="editinput" onChange="Javascript:top.oxid.admin.changeLstrt()" [{ $readonly }]>
                            <option value="">---</option>
                            [{foreach from=$oView->getCountryList() item=pcou}]
                            <option value="[{ $pcou->oxcountry__oxid->value }]" [{if $edit->stores__store_country->value == $pcou->oxcountry__oxid->value }] selected="selected"[{/if}]>
                            [{ $pcou->oxcountry__oxtitle->value|oxtruncate:40:"..":true }]</option>
                            [{/foreach}]
                            </select>
                            [{ oxinputhelp ident="HELP_SHOPLOCATOR_ADMIN_MAIN_COUNTRY" }]
                        </td>

                    </tr>
                    <tr>
                        <td class="edittext">
                            [{ oxmultilang ident="SHOPLOCATOR_ADMIN_MAIN_MARKER" }]
                        </td>
                        <td class="edittext">
                            <select name="editval[stores__store_marker]" class="editinput" onChange="Javascript:top.oxid.admin.changeLstrt()" [{ $readonly }]>
                            <option value="">---</option>
                            [{foreach from=$markers item=sKey}]
                            <option value="[{ $sKey }]" [{if $edit->stores__store_marker->value == $sKey }] selected="selected"[{/if}]>[{$sKey|oxtruncate:40:"..":true }]</option>
                            [{/foreach}]
                            </select>
                            [{ oxinputhelp ident="HELP_SHOPLOCATOR_ADMIN_MAIN_MARKER" }]
                        </td>

                    </tr>
                    <tr>
                        <td class="edittext">
                            [{ oxmultilang ident="SHOPLOCATOR_ADMIN_MAIN_CONTACT" }]
                        </td>
                        <td class="edittext">
                            <textarea class="editinput" rows="3" cols="38"
                                      name="editval[stores__store_contact]"  [{ $readonly }]>[{$edit->stores__store_contact->rawValue}]</textarea>
                            [{ oxinputhelp ident="HELP_SHOPLOCATOR_ADMIN_MAIN_CONTACT" }]
                        </td>

                    </tr>
                    <tr>
                        <td class="edittext">
                            [{ oxmultilang ident="SHOPLOCATOR_ADMIN_MAIN_DESCRIPTION" }]
                        </td>
                        <td class="edittext">
                            <textarea class="editinput" rows="3" cols="38"
                                      name="editval[stores__store_description]"  [{ $readonly }]>[{$edit->stores__store_description->rawValue}]</textarea>
                            [{ oxinputhelp ident="HELP_SHOPLOCATOR_ADMIN_MAIN_DESCRIPTION" }]
                        </td>

                    </tr>
                    <tr>
                        <td class="edittext"><br><br>
                        </td>
                        <td class="edittext"><br><br>
                            <input type="submit" class="edittext" id="oLockButton" name="saveArticle" value="[{ oxmultilang ident="GENERAL_SAVE" }]"
                            onClick="Javascript:document.myedit.fnc.value='save'"" [{ $readonly }] [{ if !$edit->stores__store_store_name->value && !$oxparentid }]disabled[{/if}] [{ $readonly }]><br>
                        </td>
                    </tr>


                </table>
            </td>
            <td></td>
        </tr>
    </table>
    <div style="float:left; margin: 50px 0 0 50px; width: 450px; height: 250px;" id="map-canvas"></div>
</form>
<div style="clear:both"></div>

[{include file="bottomnaviitem.tpl"}]
[{include file="bottomitem.tpl"}]