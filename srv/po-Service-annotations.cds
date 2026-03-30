using POService from './po-Service';

annotate POService.PurchaseOrders with @(
    odata.draft.enabled
    
);

annotate com.project.po.PurchaseOrderItem with @(
UI: {
        LineItem: [
            { $Type: 'UI.DataField', Value: EBELP,  Label: 'Line'       }, // lineItem -> EBELP
            { $Type: 'UI.DataField', Value: MATNR,  Label: 'Material'   }, // material -> MATNR
            { $Type: 'UI.DataField', Value: MENGE,  Label: 'Quantity'   }, // quantity -> MENGE
            { $Type: 'UI.DataField', Value: MEINS,  Label: 'UoM'        }, // uom      -> MEINS
            { $Type: 'UI.DataField', Value: NETPR,  Label: 'Unit Price' }  // unitPrice -> NETPR
        ]
    });