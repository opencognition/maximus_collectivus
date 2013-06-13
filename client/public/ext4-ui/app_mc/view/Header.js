Ext.define('MaximusCollectivus.view.Header', {
    extend: 'Ext.Container',
    xtype: 'appHeader',
    id: 'app-header',
    height: 52,
    layout: {
        type: 'hbox',
        align: 'middle'
    },
    initComponent: function() {
        this.items = [{
            xtype: 'component',
            id: 'app-header-title',
            html: 'Maximus Collectivus',
            flex: 1
        }];

        // if (!Ext.getCmp('options-toolbar')) {
        //     this.items.push({
        //         xtype: 'themeSwitcher'
        //     });
        // }

        this.callParent();
    }
});