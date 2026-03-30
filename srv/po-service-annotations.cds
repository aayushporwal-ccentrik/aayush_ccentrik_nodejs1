using POService from './po-service';

annotate POService.PurchaseOrders with @(
    odata.draft.enabled
);

annotate com.project.po.PurchaseOrderItem with @(
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