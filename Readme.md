db/schema --> What is there in database.
srv/po-service.cds --> What we EXPOSE to the outside world

--------------------------------------------------------------------------------
schema:

"items: Composition of many PurchaseOrderItem on items.po = $self;"

Composition: It tells POItem is child class of POheader.
Many: It is like one to many relationship explained in sprigboot. One Po_Header can have multiple lineitems.

items.po = $self
items: The name of compositon field itself.
items.po = The po field inside the child entity PurchaseOrderItem.
$self = Refers to the current entity instance Purchase order

----------------------------------------------------------------------------------------------------

/db/Sample.csv --> Goes directly in sqlite db, no event handler in between, so the format of csv will include all fields in entities.

----------------------------------------------------------------------------------------------------
curl [flags] [URL]
```

The flags you already used:
```
-X POST              →  specify HTTP method (GET is default)
-H 'key: value'      →  add a header
-d '{...}'           →  add request body data

----------------------------------------------------------------------------------------------------
po-Service.cds and po-Service.js should have identical naming.