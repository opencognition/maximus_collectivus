Ext.define('MaximusCollectivus.view.Navigation', {
    extend: 'Ext.tree.Panel',
    alias: 'widget.navigation',
    title: 'Exercise Navigator',
    store: 'Tree',
    rootVisible: false,
    displayField: 'name',
    root: {
      name: 'Root',
      id: 'root',
      children: []
    }
});