Ext.define('MaximusCollectivus.model.Song', {
    extend: 'Ext.data.Model',
    fields: ['id', 'name', 'artist', 'album', 'played_date', 'station'],
    
    proxy: {
        type: 'ajax',
        url: 'ext4-ui/data/recentsongs.json',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});