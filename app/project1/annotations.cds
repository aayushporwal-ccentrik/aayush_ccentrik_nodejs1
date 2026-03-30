using POService as service from '../../srv/po-Service';
annotate service.PurchaseOrders with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : EBELN,
            },
            {
                $Type : 'UI.DataField',
                Value : BUKRS,
            },
            {
                $Type : 'UI.DataField',
                Value : BSART,
            },
            {
                $Type : 'UI.DataField',
                Value : LIFNR,
            },
            {
                $Type : 'UI.DataField',
                Value : AEDAT,
            },
            {
                $Type : 'UI.DataField',
                Value : ZTERM,
            },
            {
                $Type : 'UI.DataField',
                Value : totalAmount,
            },
            {
                $Type : 'UI.DataField',
                Value : currency,
            },
            {
                $Type : 'UI.DataField',
                Value : STATU,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Line Items',
            Target: 'items/@UI.LineItem', // 'items' is the composition name in your DB
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : EBELN,
        },
        {
            $Type : 'UI.DataField',
            Value : BUKRS,
        },
        {
            $Type : 'UI.DataField',
            Value : BSART,
        },
        {
            $Type : 'UI.DataField',
            Value : LIFNR,
        },
        {
            $Type : 'UI.DataField',
            Value : AEDAT,
        },
    ],
);

