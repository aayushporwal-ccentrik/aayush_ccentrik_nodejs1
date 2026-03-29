using com.team.po as po from '../db/schema';

service POService @(path: '/po') {

    entity PurchaseOrders as projection on po.PurchaseOrder;

    function getTotalbyVendor(vendor : String) returns Decimal;
}

// Bound action defined via extend
extend service POService {
    action submitPO(poID : UUID) returns String;
}
