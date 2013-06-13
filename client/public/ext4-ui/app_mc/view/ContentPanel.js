Ext.define('MaximusCollectivus.view.ContentPanel', {
    extend: 'Ext.panel.Panel',
    xtype: 'contentPanel',
    id: 'content-panel',
    title: '&nbsp;',

    autoScroll: true,

    tpl: new Ext.XTemplate(
        '<h1>FOOBAR</h1>',
        '<tpl for="children">',
        '    <h2>{id}</h2>',
        '</tpl>'
    ),

    tools: [{
        type: 'maximize',
        tooltip: 'Maximize example code content'    
    }],

    items: [
        {
            ref: 'innerContent',
            html: '<h1>SNAFU</h1>',
            margins: 20
        }
    ]
});