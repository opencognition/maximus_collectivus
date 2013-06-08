Ext.application({
    name: 'MaximusCollectivus',
    appFolder: 'ext4-ui/app_mc',
    autoCreateViewport: true,
    models: ['Exercise', 'Tree'],
    stores: ['SearchExercisesResults', 'Tree', 'Exercises'],
    controllers: ['Exercise'],
    launch: function() {
        // This is fired as soon as the page is ready
    }
});