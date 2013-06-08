Ext.define('MaximusCollectivus.store.Tree', {
    extend: 'Ext.data.TreeStore',
    requires: 'MaximusCollectivus.model.Tree',
    model: 'MaximusCollectivus.model.Tree',
    listeners: {
      beforeload: function( store, operation, eOpts ) {
        store.proxy.extraParams = {
          "conditions[parent_id]": Ext.isNumber(parseInt((operation.id || "").split("-")[1])) ? operation.id.split("-")[1] : null
        }
      },
      append: function (thisNode, newChildNode, index, eOpts) {
        try {
          newChildNode.set('expandable', !Ext.isEmpty(newChildNode.data.children));
          newChildNode.set('id', newChildNode.data.describer_type + '-' + newChildNode.data.id);
        }
        catch (exc) {
        }
      }
    }
});

// Ext.define('TreeModel', {
//     extend: 'Ext.data.Model',
//     fields: [
//         { name: 'text', type: 'string', defaultValue: null },
//         { name: 'parentId', type: 'string', defaultValue: null },
//         { name: 'index', type: 'int', defaultValue: null },
//         { name: 'depth', type: 'int', defaultValue: 0 },
//         { name: 'expanded', type: 'bool', defaultValue: false, persist: false },
//         { name: 'expandable', type: 'bool', defaultValue: true, persist: false },
//         { name: 'checked', type: 'auto', defaultValue: null },
//         { name: 'leaf', type: 'bool', defaultValue: false, persist: false },
//         { name: 'cls', type: 'string', defaultValue: null, persist: false },
//         { name: 'icon', type: 'string', defaultValue: null, persist: false },
//         { name: 'iconCls', type: 'string', defaultValue: null, persist: false },
//         { name: 'iconQtip', type: 'string', defaultValue: null, persist: false },
//         { name: 'root', type: 'boolean', defaultValue: false, persist: false },
//         { name: 'isLast', type: 'boolean', defaultValue: false, persist: false },
//         { name: 'isFirst', type: 'boolean', defaultValue: false, persist: false },
//         { name: 'allowDrop', type: 'boolean', defaultValue: true, persist: false },
//         { name: 'allowDrag', type: 'boolean', defaultValue: true, persist: false },
//         { name: 'loaded', type: 'boolean', defaultValue: false, persist: false },
//         { name: 'loading', type: 'boolean', defaultValue: false, persist: false },
//         { name: 'href', type: 'string', defaultValue: null, persist: false },
//         { name: 'hrefTarget', type: 'string', defaultValue: null, persist: false },
//         { name: 'qtip', type: 'string', defaultValue: null, persist: false },
//         { name: 'qtitle', type: 'string', defaultValue: null, persist: false }
//     ]
// });