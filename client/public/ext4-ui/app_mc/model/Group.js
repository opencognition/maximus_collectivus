Ext.define('MaximusCollectivus.model.Group', {
    extend: 'Ext.data.Model',
    fields: [
      {name: 'id',          mapping: 'id'},
      {name: 'code',        mapping: 'code'},
      {name: 'name',        mapping: 'name'},
      {name: 'description', mapping: 'description'}
    ],
    
    proxy: {
        type: 'ajax',
        url: 'groups.json',
        reader: {
            type: 'json',
            root: 'result.data',
            totalProperty: "result.total"
        }
    }
});