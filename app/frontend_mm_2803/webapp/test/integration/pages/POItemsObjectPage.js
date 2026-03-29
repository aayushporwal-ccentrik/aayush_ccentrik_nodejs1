sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'aayush.frontendmm2803',
            componentId: 'POItemsObjectPage',
            contextPath: '/PurchaseOrders/items'
        },
        CustomPageDefinitions
    );
});