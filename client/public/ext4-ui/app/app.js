Ext.application({
    name: 'MaximusCollectivus',
    appFolder: 'ext4-ui/app',
    autoCreateViewport: true,
    models: ['Station', 'Song'],    
    stores: ['Stations', 'RecentSongs', 'SearchResults'],
    controllers: ['Station', 'Song'],
    launch: function() {
        // This is fired as soon as the page is ready
    }
});