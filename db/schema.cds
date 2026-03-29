//Created a namespace named "com.team.po"
namespace com.team.po;

using { managed, cuid } from '@sap/cds/common' ;


//Creation of PO_Header entity --> Parent entity
entity PurchaseOrder: managed, cuid {

   // @mandatory
    poNumber : String(10) not null;

    @mandatory
    vendor : String(100) not null;
    orderDate : Date;
    totalAmount: Decimal(13,2);
    currency: String(3);
    status: String(20) default 'DRAFT';
    items: Composition of many PurchaseOrderItem on items.po = $self;
}

////Creation of PO_Items entity --> Child entity
entity PurchaseOrderItem : cuid {

    po : Association to PurchaseOrder;
    lineItem : Integer;
    material : String(40);
    quantity : Decimal(13,3);
    unitPrice : Decimal(13,2);
}