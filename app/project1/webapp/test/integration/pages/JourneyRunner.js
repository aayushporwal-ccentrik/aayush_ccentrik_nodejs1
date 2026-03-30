sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"aayush/project1/test/integration/pages/PurchaseOrdersList",
	"aayush/project1/test/integration/pages/PurchaseOrdersObjectPage",
	"aayush/project1/test/integration/pages/PurchaseOrderItemObjectPage"
], function (JourneyRunner, PurchaseOrdersList, PurchaseOrdersObjectPage, PurchaseOrderItemObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('aayush/project1') + '/test/flp.html#app-preview',
        pages: {
			onThePurchaseOrdersList: PurchaseOrdersList,
			onThePurchaseOrdersObjectPage: PurchaseOrdersObjectPage,
			onThePurchaseOrderItemObjectPage: PurchaseOrderItemObjectPage
        },
        async: true
    });

    return runner;
});

