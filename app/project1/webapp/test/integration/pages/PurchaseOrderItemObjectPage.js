sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'aayush.project1',
            componentId: 'PurchaseOrderItemObjectPage',
            contextPath: '/PurchaseOrders/items'
        },
        CustomPageDefinitions
    );
});