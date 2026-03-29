//Created a namespace named "com.team.po"
namespace com.team.po;

using { managed, cuid } from '@sap/cds/common' ;


//Creation of PO_Header entity --> Parent entity
entity PurchaseOrder: managed, cuid {

    // SAP: EBELN
    poNumber : String(10) not null;

    // SAP: BUKRS
    companyCode : String(4);

    // SAP: BSART
    poType : String(4);

    // SAP: LIFNR
    @mandatory
    vendor : String(10);

    // SAP: AEDAT
    orderDate : Date;

    // SAP: ZTERM
    paymentTerms : String(4);

    // SAP: ERNAM
    //createdBy : String(50);

    // Custom / calculated
    totalAmount : Decimal(13,2);
    currency : String(3);

    // SAP: STATU
    status : String(20) default 'DRAFT';

    // Composition (Header → Items)
    items : Composition of many PurchaseOrderItem on items.up_ = $self;
}


//Creation of PO_Items entity --> Child entity
entity PurchaseOrderItem : cuid, managed {

    // SAP: EBELN (FK)
    up_ : Association to PurchaseOrder;

    // SAP: EBELP
    lineItem : Integer;

    // SAP: MATNR
    material : String(40);

    // SAP: MATKL
    materialGroup : String(9);

    // SAP: WERKS
    plant : String(4);

    // SAP: LGORT
    storageLocation : String(4);

    // SAP: MENGE
    quantity : Decimal(13,3);

    // SAP: MEINS
    uom : String(3);

    // SAP: NETPR
    unitPrice : Decimal(13,2);

    // SAP: PEINH
    priceUnit : Integer;
}