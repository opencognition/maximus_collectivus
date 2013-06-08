Ext.define('MaximusCollectivus.view.ExercisesList', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.exerciseslist',
    
    store: 'Exercises',
    title: 'Exercises',
    hideHeaders: true,
    
    initComponent: function() {
        this.columns = [{
            dataIndex: 'name',
            flex: 1
        }];
        
        this.callParent();
    }
});