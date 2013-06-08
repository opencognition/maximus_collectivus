Ext.define('MaximusCollectivus.controller.Exercise', {
    extend: 'Ext.app.Controller',

    refs: [{
        ref: 'tree',
        selector: 'tree'
    }],

    stores: ['SearchExercisesResults', 'Exercises'],
    
    init: function() {
        // Start listening for events on views
        this.control({
            'tree': {
                // selectionchange: this.onExerciseSelect
            },
            'newexercise': {
                select: this.onNewExerciseSelect
            }
        });
    },
    
    onLaunch: function() {
        var exercisesStore = this.getExercisesStore();        
        exercisesStore.load({
            callback: this.onExercisesLoad,
            scope: this
        });
    },

    onExerciseSelect: function(selModel, selection) {
        // Fire an application wide event
        this.application.fireEvent('exercisestart', selection[0]);
    },
    
    onNewExerciseSelect: function(field, selection) {
        var selected = selection[0],
            tree = this.getTree();
        // if (selected && !store.getById(selected.get('id'))) {
            // store.add(selected);
        // }
        // list.getSelectionModel().select(selected);
    }
});
