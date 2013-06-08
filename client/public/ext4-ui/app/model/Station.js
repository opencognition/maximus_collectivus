Ext.define('MaximusCollectivus.model.Station', {
    extend: 'Ext.data.Model',
    fields: ['id', 'name'],
    
    proxy: {
        type: 'ajax',
        url: 'ext4-ui/data/stations.json',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});