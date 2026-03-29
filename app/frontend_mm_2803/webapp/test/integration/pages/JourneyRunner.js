sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"aayush/frontendmm2803/test/integration/pages/PurchaseOrdersList",
	"aayush/frontendmm2803/test/integration/pages/PurchaseOrdersObjectPage",
	"aayush/frontendmm2803/test/integration/pages/POItemsObjectPage"
], function (JourneyRunner, PurchaseOrdersList, PurchaseOrdersObjectPage, POItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('aayush/frontendmm2803') + '/test/flp.html#app-preview',
        pages: {
			onThePurchaseOrdersList: PurchaseOrdersList,
			onThePurchaseOrdersObjectPage: PurchaseOrdersObjectPage,
			onThePOItemsObjectPage: POItemsObjectPage
        },
        async: true
    });

    return runner;
});

