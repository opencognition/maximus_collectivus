Ext.define('MaximusCollectivus.store.SearchResults', {
    extend: 'Ext.data.Store',
    requires: 'MaximusCollectivus.model.Station',
    model: 'MaximusCollectivus.model.Station',

    autoLoad: true,
    
    // Overriding the model's default proxy
    proxy: {
        type: 'ajax',
        url: 'ext4-ui/data/searchresults.json',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});