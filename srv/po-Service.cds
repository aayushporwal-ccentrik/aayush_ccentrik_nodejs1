using com.team.po as po from '../db/schema';

service POService @(path: '/po') {

    entity PurchaseOrders as projection on po.PurchaseOrder;
    entity POItems as projection on po.PurchaseOrderItem;

    action submitPO(poID : UUID) returns String;
    function getTotalbyVendor(vendor : String) returns Decimal;
}


annotate POService.PurchaseOrders with @(
  odata.draft.enabled
);


annotate POService.PurchaseOrders with @(
  UI: {
    LineItem: [
      { $Type: 'UI.DataField', Value: poNumber, Label: 'PO Number' },
      { $Type: 'UI.DataField', Value: vendor,   Label: 'Vendor' },
      { $Type: 'UI.DataField', Value: status,   Label: 'Status' }
    ]
  }
);