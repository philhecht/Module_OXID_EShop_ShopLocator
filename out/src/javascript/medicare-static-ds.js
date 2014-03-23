

/**
 * @const
 * @type {!storeLocator.FeatureSet}
 * @private
 */
MedicareDataSource.prototype.FEATURES_ = new storeLocator.FeatureSet(
    new storeLocator.Feature('store_country_Schweiz', 'Schweiz'),
    new storeLocator.Feature('store_country_Deutschland', 'Deutschland')
);


/**
 * @return {!storeLocator.FeatureSet}
 */
MedicareDataSource.prototype.getFeatures = function() {
    return this.FEATURES_;
};




/**
 * @private
 * @param {string} json
 * @return {!Array.<!storeLocator.Store>}
 */

MedicareDataSource.prototype.parse_ = function(data)
{
	var featurelist = this.FEATURES_;


    var stores = [];
    $.each(data.stores, function(i, dbstore)
    {
        
        var features = new storeLocator.FeatureSet;
        features.add(featurelist.getById('store_country_' + dbstore.store_country));
        features.add(featurelist.getById('store_country_' + dbstore.store_country));
        
        
        var position = new google.maps.LatLng(dbstore.store_latitude, dbstore.store_logitude);

        var locality = dbstore.store_zip + ' ' + dbstore.store_city + ', ' + dbstore.store_country;

        $.each(data.stores_settings, function(i, settings)
        {
           // alert(JSON.stringify(settings));

        var store = new storeLocator.Store(dbstore.oxid, position, features, {
            title: dbstore.store_name,
            address: dbstore.store_address + '<br>' + locality,
            hours: dbstore.store_contact,
            marker:dbstore.store_marker,
            zoom: settings.zoom_factor,
            streetview: settings.streetview_active,
            description: dbstore.store_description
        });
        stores.push(store);

            //alert(JSON.stringify(store.getDetails()));


        });
    });
    return stores;
};
