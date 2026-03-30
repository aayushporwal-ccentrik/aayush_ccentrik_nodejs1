//Importing Data Model
using com.project.po as po from '../db/ZMM_AP_2803';

service POService @(path: '/po') {

//Exposing the entity endpoints
    entity PurchaseOrders as projection on po.PurchaseOrder{

    };

//Defining the contract for logic but not logic itself
    function getTotalbyVendor(vendor : String) returns Decimal;
}

// Extending the contract via Custom action
extend service POService {
    action submitPO(poID : UUID) returns String;
}
