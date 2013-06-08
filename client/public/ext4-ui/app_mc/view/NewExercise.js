Ext.define('MaximusCollectivus.view.NewExercise', {
    extend: 'Ext.form.field.ComboBox',
    emptyText: 'Search Exercises',
    alias: 'widget.newexercise',
    store: 'SearchExercisesResults',
    queryMode: 'remote',
    displayField: 'name',
    valueField: 'id'
});
