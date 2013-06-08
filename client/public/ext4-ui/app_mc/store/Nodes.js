Ext.define('MaximusCollectivus.store.Nodes', {
    extend: 'Ext.data.Store',
    requires: 'MaximusCollectivus.model.Node',
    model: 'MaximusCollectivus.model.Node',
    proxy: {
        type: 'ajax',
        url: 'nodes.json',
        reader: {
            type: 'json',
            root: 'result.data',
            totalProperty: "result.total"
        }
    }
});