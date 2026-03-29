using POService from './po-Service';

annotate POService.PurchaseOrders with @(
    odata.draft.enabled
);

annotate com.team.po.PurchaseOrderItem with @(
    UI: {
        LineItem: [
            { $Type: 'UI.DataField', Value: lineItem,  Label: 'Line'       },
            { $Type: 'UI.DataField', Value: material,  Label: 'Material'   },
            { $Type: 'UI.DataField', Value: quantity,  Label: 'Quantity'   },
            { $Type: 'UI.DataField', Value: uom,       Label: 'UoM'        },
            { $Type: 'UI.DataField', Value: unitPrice, Label: 'Unit Price' }
        ]
    }
);