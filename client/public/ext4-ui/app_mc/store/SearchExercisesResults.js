Ext.define('MaximusCollectivus.store.SearchExercisesResults', {
    extend: 'Ext.data.Store',
    requires: 'MaximusCollectivus.model.Exercise',
    model: 'MaximusCollectivus.model.Exercise',
    autoLoad: true
});