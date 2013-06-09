Ext.application({
    name: 'MaximusCollectivus',
    appFolder: 'ext4-ui/app_mc',
    models: ['Exercise', 'Tree'],
    stores: ['SearchExercisesResults', 'Tree', 'Exercises'],
    controllers: ['Exercise', 'Main'],
    autoCreateViewport: true,

    launch: function() {
        // This is fired as soon as the page is ready
    },

    init: function() {
        Ext.setGlyphFontFamily('Pictos');
        Ext.tip.QuickTipManager.init();
        Ext.state.Manager.setProvider(Ext.create('Ext.state.CookieProvider'));
    }
});