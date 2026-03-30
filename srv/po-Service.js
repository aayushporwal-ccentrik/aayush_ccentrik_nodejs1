const cds = require('@sap/cds')

module.exports = cds.service.impl(async function() {
    //Added NumberRanges to the entities list
    const { PurchaseOrders} = this.entities
    const db = await cds.connect.to('db')
    const { NumberRanges } = db.entities('com.team.po')

    this.before('CREATE', PurchaseOrders, async(req)=> {
    console.log(">>> CREATE event triggered for PurchaseOrders");
        // Increment Logic (Best Practice)
        const range = await SELECT.one.from(NumberRanges)
                            .where({ type: 'PurchaseOrder' })
                            .forUpdate()
        
        let nextValue = 1
        if (range) {
            nextValue = range.currentValue + 1
            // save the new number back to the DB!
            await UPDATE(NumberRanges)
                  .set({ currentValue: nextValue })
                  .where({ type: 'PurchaseOrder' })
        } else {
            // First time setup
            await INSERT.into(NumberRanges).entries({ type: 'PurchaseOrder', currentValue: 1 })
        }

        //  Enrichment: Assign the number to the record being saved
        req.data.EBELN = `PO-${nextValue.toString().padStart(4, '0')}`
        console.log(">>> Assigned EBELN:", req.data.EBELN);
    }) // <--- Added missing closing brace for 'NEW' handler

    this.before('SAVE', PurchaseOrders, async (req) => {
        // 1. Skip if number already exists (Prevent overwrite on Edit)
        if (req.data.EBELN) {
            console.log('>>> PO has already a number skipping generation')
            return
        }

        // 2. Validation
        if (!req.data.items || req.data.items.length === 0) {
            return req.error(400, 'At least 1 line item is required')
        }
    }) 

    this.on('submitPO', async (req) => {
        const { poID } = req.data
        return `PO ${ poID } submitted successfully`
    })

    this.after('READ', PurchaseOrders, (each) => {
        const elements = Array.isArray(each) ? each : [each]
        elements.forEach(po => {
            if (po.status === 'DRAFT') po.status = 'Approval Pending'
        })
    })
})