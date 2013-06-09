Ext.define('MaximusCollectivus.view.Viewport', {
    extend: 'Ext.container.Viewport',
    requires:[
        'Ext.tab.Panel',
        'Ext.layout.container.Border',
        'MaximusCollectivus.view.Navigation'
    ],

    layout: 'border',

    items: [{
        region: 'north',
        // xtype: 'appHeader',
        html: '<h1>Maximus Collectivus</h1>'
    }, {
        region: 'west',
        xtype: 'navigation',
        width: 250,
        minWidth: 100,
        height: 200,
        split: true,
        stateful: true,
        stateId: 'mainnav.west',
        collapsible: true,
        tools: [{
            type: 'gear',
            regionTool: true
        }]
    }, {
        region: 'center',
        // xtype: 'contentPanel'
        html: 'details'
    }, {
        region: 'east',
        id: 'east-region',
        title: 'Info',
        stateful: true,
        stateId: 'mainnav.east',
        split: true,
        collapsible: true,
        layout: {
            type: 'vbox',
            align: 'stretch'
        },
        width: 250,
        height: 200,
        minWidth: 100,
        tools: [{
            type: 'gear',
            regionTool: true
        }],
        items: [{
            // xtype: 'descriptionPanel',
            stateful: true,
            stateId: 'mainnav.east.description',
            html: 'description',
            height: 200,
            minHeight: 100
        }, {
            xtype: 'splitter',
            collapsible: true,
            collapseTarget: 'prev'
        }, {
            // xtype: 'codePreview',
            html: 'history',
            flex: 1//,
            //minHeight: 100
        }]
    }]
});