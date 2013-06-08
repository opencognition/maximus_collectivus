Ext.define('MaximusCollectivus.view.Viewport', {
    extend: 'Ext.container.Viewport',
    layout: 'fit',
    
    requires: [
        'MaximusCollectivus.view.NewExercise',
        'MaximusCollectivus.view.ExercisesList',
        'MaximusCollectivus.view.Tree'
    ],
    
    initComponent: function() {
        this.items = {
            dockedItems: [{
                dock: 'top',
                xtype: 'toolbar',
                height: 80,
                items: [{
                    xtype: 'newexercise',
                    width: 150
                }, {
                    xtype: 'component',
                    flex: 1,
                    style: {"text-align": 'center'},
                    html: '<h1 class="header">Maximus Collectivus</h1>'
                }, {
                    xtype: 'component',
                    style: {"text-align": 'center', padding: '20px;'},
                    html: '<h2 class="mc-small-tagline">Collect data the way the Spartans do!</h2>'
                }]
            }],
            layout: {
                type: 'border',
                align: 'stretch'
            },
            items: [{
                width: 300,
                xtype: 'panel',
                border: false,
                id: 'west-region',
                region: 'west',
                split: true,
                width: 250,
                minWidth: 200,
                layout: {
                    type: 'vbox',
                    align: 'stretch'
                },
                items: [{
                    xtype: 'tree',
                    title: 'Exercises',
                    flex: 1,
                    border: false,
                    collapsible: true,
                    tools: [{
                        type: 'gear',
                        regionTool: true
                    }]
                }]
            }, {
                xtype: 'container',
                region: 'center',
                flex: 1,
                layout: {
                    type: 'vbox',
                    align: 'stretch'
                },
                items: [{
                    xtype: 'component',
                    flex: 1,
                    html: 'details'
                }]
            }]
        };
        
        this.callParent();
    }
});