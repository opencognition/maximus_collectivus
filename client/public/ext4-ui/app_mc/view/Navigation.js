Ext.define('MaximusCollectivus.view.Navigation', {
    extend: 'Ext.tree.Panel',
    alias: 'widget.navigation',
    title: 'Exercise Navigator',
    store: 'Tree',
    id: 'foobar',
    rootVisible: false,
    displayField: 'name',
    root: {
      name: 'Root',
      id: 'root',
      children: []
    },
    dockedItems: [{
        dock: 'top',
        xtype: 'toolbar',
        items: [{
            glyph: 61,
            xtype: 'button'
        }, '-', {
            glyph: 88,
            xtype: 'button'
        }, {
            glyph: 70,
            xtype: 'button'
        }, '-', {
            glyph: 47,
            xtype: 'button'
        }]
    }]
});