using POService as service from '../../srv/po-Service';

annotate service.PurchaseOrders with @(

    UI.HeaderInfo: {
        TypeName       : 'Purchase Order',
        TypeNamePlural : 'Purchase Orders',
        Title          : { Value: poNumber },
        Description    : { Value: vendor }
    },

    UI.SelectionFields: [
        poNumber,
        vendor,
        status
    ],

    UI.LineItem: [
        { $Type: 'UI.DataField', Value: poNumber,    Label: 'PO Number'    },
        { $Type: 'UI.DataField', Value: vendor,      Label: 'Vendor'       },
        { $Type: 'UI.DataField', Value: status,      Label: 'Status'       },
        { $Type: 'UI.DataField', Value: orderDate,   Label: 'Order Date'   },
        { $Type: 'UI.DataField', Value: totalAmount, Label: 'Total Amount' }
    ],

    UI.FieldGroup #GeneralInfo: {
        $Type : 'UI.FieldGroupType',
        Label : 'General Information',
        Data  : [
            { $Type: 'UI.DataField', Value: poNumber,     Label: 'PO Number'     },
            { $Type: 'UI.DataField', Value: vendor,       Label: 'Vendor'        },
            { $Type: 'UI.DataField', Value: poType,       Label: 'PO Type'       },
            { $Type: 'UI.DataField', Value: companyCode,  Label: 'Company Code'  },
            { $Type: 'UI.DataField', Value: status,       Label: 'Status'        },
            { $Type: 'UI.DataField', Value: orderDate,    Label: 'Order Date'    },
            { $Type: 'UI.DataField', Value: paymentTerms, Label: 'Payment Terms' },
            { $Type: 'UI.DataField', Value: totalAmount,  Label: 'Total Amount'  },
            { $Type: 'UI.DataField', Value: currency,     Label: 'Currency'      }
        ]
    },

    UI.Facets: [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'General Information',
            Target : '@UI.FieldGroup#GeneralInfo'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Line Items',
            Target : 'items/@UI.LineItem'
        }
    ]
);