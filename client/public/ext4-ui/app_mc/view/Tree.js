Ext.define('MaximusCollectivus.view.Tree', {
    extend: 'Ext.tree.Panel',
    alias: 'widget.tree',
    store: 'Tree',
    rootVisible: false,
    displayField: 'name',
    root: {
      name: 'Root',
      id: 'root',
      children: []
    }
});