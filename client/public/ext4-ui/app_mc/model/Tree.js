Ext.define('MaximusCollectivus.model.Tree', {
    extend: 'Ext.data.Model',
    fields: [
      {name: 'id',              mapping: 'id'},
      {name: 'parent_id',       mapping: 'parent_id'},
      {name: 'lft',             mapping: 'lft'},
      {name: 'rgt',             mapping: 'rgt'},
      {name: 'depth',           mapping: 'depth'},
      {name: 'position',        mapping: 'position'},
      {name: 'describer_id',    mapping: 'describer_id'},
      {name: 'describer_type',  mapping: 'describer_type'},
      {name: 'code',            mapping: 'describer.code'},
      {name: 'name',            mapping: 'describer.name'},
      {name: 'description',     mapping: 'describer.description'}
    ],
    
    proxy: {
        type: 'ajax',
        url: 'nodes/tree.json?includes=describer,children',
        extraParams: {
          "conditions[parent_id]": null
        },
        reader: {
            type: 'json',
            root: 'result',
            getResponseData: function(response) {
                var jsonData = Ext.JSON.decode(response.responseText);
                return this.readRecords(jsonData.result.data);
            }
        }
    }
});