const cds = require('@sap/cds')

module.exports = cds.service.impl(async function() {
    // FIX A: Added NumberRanges to the entities list
    const { PurchaseOrders, NumberRanges } = this.entities

    this.before('SAVE', PurchaseOrders, async (req) => {
        // 1. Skip if number already exists (Prevent overwrite on Edit)
        if (req.data.poNumber) {
            console.log('>>> PO has already a number skipping generation')
            return
        }

        // 2. Validation
        if (!req.data.items || req.data.items.length === 0) {
            return req.error(400, 'At least 1 line item is required')
        }

        // 3. Increment Logic (Best Practice)
        const range = await SELECT.one.from(NumberRanges)
                            .where({ type: 'PurchaseOrder' })
                            .forUpdate()

        let nextValue = 1
        if (range) {
            nextValue = range.currentValue + 1
            // FIX C: You must actually save the new number back to the DB!
            await UPDATE(NumberRanges)
                  .set({ currentValue: nextValue })
                  .where({ type: 'PurchaseOrder' })
        } else {
            // First time setup
            await INSERT.into(NumberRanges).entries({ type: 'PurchaseOrder', currentValue: 1 })
        }

        // 4. Enrichment: Assign the number to the record being saved
        req.data.poNumber = `PO-${nextValue.toString().padStart(4, '0')}`
    })

    this.on('submitPO', async (req) => {
        const { poID } = req.data
        return `PO ${poID} submitted successfully`
    })

    this.after('READ', PurchaseOrders, (each) => {
        const elements = Array.isArray(each) ? each : [each]
        elements.forEach(po => {
            if (po.status === 'DRAFT') po.status = 'Approval Pending'
        })
    })
})