//Importing Data Model
using com.project.po as po from '../db/ZMM_AP_2803';

service POService @(path: '/po') {

    // 1. Added @odata.draft.enabled to support the Fiori "Create" flow
    // 2. Added @readonly to EBELN so it shows up but can't be changed by the user
    @odata.draft.enabled
    entity PurchaseOrders as projection on po.PurchaseOrder {
        *,
        @readonly EBELN // This matches the technical name in your DB
    };

    //Defining the contract for logic but not logic itself
    // CHANGE: Use technical name LIFNR for consistency if this refers to the vendor field
    function getTotalbyVendor(LIFNR : String) returns Decimal;
}

// 3. Side Effect: Tells the UI to refresh EBELN immediately when a new record is created
annotate POService.PurchaseOrders with @Common.SideEffects : {
    TargetProperties : [ 'EBELN' ] 
};

// Extending the contract via Custom action
extend service POService {
    action submitPO(poID : UUID) returns String;
}