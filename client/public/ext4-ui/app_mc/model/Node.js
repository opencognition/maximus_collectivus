Ext.define('MaximusCollectivus.model.Node', {
    extend: 'Ext.data.Model',
    fields: [
      {name: 'id',              mapping: 'id'},
      {name: 'parent_id',       mapping: 'parent_id'},
      {name: 'lft',             mapping: 'lft'},
      {name: 'rgt',             mapping: 'rgt'},
      {name: 'depth',           mapping: 'depth'},
      {name: 'position',        mapping: 'position'},
      {name: 'describer_id',    mapping: 'describer_id'},
      {name: 'describer_type',  mapping: 'describer_type'}
    ],
    
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