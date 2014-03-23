[{include file="headitem.tpl" title="PAYMILL_TITLE"|oxmultilangassign}]
<script type="text/javascript">
<!--

function DeletePic(Marker)
{
    var oForm = document.getElementById("myedit");
    oForm.fnc.value="deletePicture";
    oForm.MarkerPicture.value=Marker;
    oForm.submit();
}

//-->
</script>

<div id=liste>

    <form name="myedit" enctype="multipart/form-data" id="myedit" action="[{$oViewConf->getSelfLink()}]" method="post">
        [{$oViewConf->getHiddenSid()}]
        <input type="hidden" name="cl" value="admin_shoplocator_configuration">
        <input type="hidden" name="fnc" value="">
        <input type="hidden" name="oxid" value="[{ $oxid }]">
        <input type="hidden" name="editval[stores_settings__oxid]" value="[{$edit->stores_settings__oxid->value}]">
        <input type="hidden" name="actshop" value="[{$oViewConf->getActiveShopId()}]">
        <input type="hidden" name="language" value="[{ $actlang }]">
        <input type="hidden" name="MarkerPicture" value="">
        <table cellspacing="0" cellpadding="0" border="0" style="width:100%;height:100%;">



            <tr>
                <td valign="top" class="edittext" style="padding:10px;">
                    <table cellspacing="0" cellpadding="10" border="0" class="edittext" style="text-align: left;">

                        <tr>
                            <td style="padding: 10px" class="edittext"  colspan="2">
                               <h1>[{ oxmultilang ident="SHOPLOCATOR_ADMIN_CONFIGURATION_SETTINGS_TITLE" }]</h1>
                            </td>
                        </tr>
                        </tr>
                        <tr>
                            <td class="edittext">
                                [{ oxmultilang ident="SHOPLOCATOR_ADMIN_CONFIGURATION_TITLE" }]
                            </td>
                            <td class="edittext">
                                <input type="text" class="editinput" size="40"  name="editval[stores_settings__title]" value="[{$edit->stores_settings__title->value}]">
                                [{ oxinputhelp ident="HELP_SHOPLOCATOR_ADMIN_CONFIGURATION_SETTINGS_TITLE" }]
                            </td>
                        </tr>
                        <tr>
                            <td class="edittext">
                                [{ oxmultilang ident="SHOPLOCATOR_ADMIN_CONFIGURATION_SHORTDESCRIPTION" }]
                            </td>
                            <td class="edittext">
                                <input type="text" class="editinput" size="40"  name="editval[stores_settings__short_description]" value="[{$edit->stores_settings__short_description->value}]">
                                [{ oxinputhelp ident="HELP_SHOPLOCATOR_ADMIN_CONFIGURATION_SHORTDESCRIPTION" }]
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="edittext" width="250" nowrap="">[{ oxmultilang ident="SHOPLOCATOR_ADMIN_CONFIGURATION_STREETVIEWACTIVE" }]</td>
                            <td valign="top" class="edittext">
                                <select name="editval[stores_settings__streetview_active]">
                                    <option value="yes"[{if $edit->stores_settings__streetview_active->value == "1" || $edit->stores_settings__streetview_active->value == ""}] selected="selected"[{/if}]>[{ oxmultilang ident=SHOPLOCATOR_YES" }]</option>
                                    <option value="no"[{if $edit->stores_settings__streetview_active->value == "0"}] selected="selected"[{/if}]>[{ oxmultilang ident="SHOPLOCATOR_NO" }]</option>
                                </select>
                                [{ oxinputhelp ident="HELP_SHOPLOCATOR_ADMIN_CONFIGURATION_STREETVIEWACTIVE" }]
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="edittext" width="250" nowrap="">[{ oxmultilang ident="SHOPLOCATOR_ADMIN_CONFIGURATION_DIRECTIONSACTIVE" }]</td>
                            <td valign="top" class="edittext">
                                <select name="editval[stores_settings__directions_active]">
                                    <option value="yes"[{if $edit->stores_settings__directions_active->value == "1" || $edit->stores_settings__directions_active->value == ""}] selected="selected"[{/if}]>[{ oxmultilang ident="SHOPLOCATOR_YES" }]</option>
                                    <option value="no"[{if $edit->stores_settings__directions_active->value == "0"}] selected="selected"[{/if}]>[{ oxmultilang ident="SHOPLOCATOR_NO" }]</option>
                                </select>
                                [{ oxinputhelp ident="HELP_SHOPLOCATOR_ADMIN_CONFIGURATION_DIRECTIONSACTIVE" }]
                            </td>
                        </tr>
                        <tr>
                            <td class="edittext">
                                [{ oxmultilang ident="SHOPLOCATOR_ADMIN_CONFIGURATION_ZOOMFACTOR" }]
                            </td>
                            <td class="edittext">
                                <input type="text" class="editinput" size="40"  name="editval[stores_settings__zoom_factor]" value="[{$edit->stores_settings__zoom_factor->value}]">
                                [{ oxinputhelp ident="HELP_SHOPLOCATOR_ADMIN_CONFIGURATION_ZOOMFACTOR" }]
                            </td>
                        </tr>
                        <tr>
                            <td class="edittext">
                                [{ oxmultilang ident="SHOPLOCATOR_ADMIN_CONFIGURATION_STYLEDMAP" }]
                            </td>
                            <td class="edittext">
                                <textarea class="editinput" rows="3" cols="38"
                                          name="editval[stores_settings__styled_map]">[{$edit->stores_settings__styled_map->rawValue}]</textarea>
                                [{ oxinputhelp ident="HELP_SHOPLOCATOR_ADMIN_CONFIGURATION_STYLEDMAP" }]
                            </td>
                        </tr>
                        <tr>
                            <td class="text">
                                [{ oxmultilang ident="SHOPLOCATOR_ADMIN_CONFIGURATION_MARKER" }]
                            </td>
                            <td class="edittext">
                                <input class="editinput" name="myfile" type="file">
                                [{ oxinputhelp ident="HELP_SHOPLOCATOR_ADMIN_CONFIGURATION_MARKER" }]
                            </td>
                        </tr>
                        <tr>
                            <td class="text">
                            </td>
                            <td class="edittext">
                                <table class="listTable" cellspacing="0" cellpadding="5" border="0" class="edittext" style="width:270px; text-align: left;">
                                    <tbody>
                                    <tr>
                                        <th valign="top" colspan="5">
                                            Marker Bilder

                                        </th>
                                    </tr>
                                    [{foreach from=$markers item="sKey"}]
                                    <tr>
                                        <td class="text">
                                            [{ $sKey }]
                                        </td>
                                        </td>
                                        <td nowrap="nowrap">
                                            <a class="deleteText" href="Javascript:DeletePic('[{$sKey}]');">
                                                <span class="ico"></span>
                                                <span class="float: left;>">Löschen</span>
                                            </a>
                                        </td>
                                        <td>
                                            <a class="zoomText" target="_blank" href="../[{$ordner_marker}][{$sKey}]">
                                                <span class="ico"></span>
                                                <span class="float: left;>">Vorschau</span>
                                            </a>
                                        </td>
                                    </tr>
                                    [{/foreach}]
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>

                            <td valign="top" class="edittext" width="250" nowrap=""></td>
                            <td valign="top" class="edittext">
                                <input type="submit" name="save" value="[{ oxmultilang ident="GENERAL_SAVE" }]" onClick="Javascript:document.myedit.fnc.value='save'" ">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
    [{include file="pagenavisnippet.tpl"}]
</div>
[{include file="pagetabsnippet.tpl"}]

[{include file="bottomnaviitem.tpl"}]

[{include file="bottomitem.tpl"}]
