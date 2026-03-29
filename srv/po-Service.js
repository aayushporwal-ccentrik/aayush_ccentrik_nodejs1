
const cds = require('@sap/cds')



module.exports = cds.service.impl(async function()
{
    const {PurchaseOrders} = this.entities

    this.before('CREATE', PurchaseOrders, async(req) => {
        if (!req.data.vendor) {
            req.error(400, 'Vendor is required')
            return
        }
        console.log('>>> Vendor Check Passed')
        const result = await SELECT.one`count(*) as count`.from(PurchaseOrders)
        console.log('>>> SELECT result:', result)

        const nextNumber = (result.count + 1).toString().padStart(4, '0')
        console.log('>>> nextNumber calculated:', nextNumber)

        req.data.poNumber = `PO-${nextNumber}`
        console.log('>>> poNumber assigned:', req.data.poNumber)
    })

    this.on('submitPO', async(req) => {
        const{ poID } = req.data
        
        return `PO ${ poId } submitted successfully`
    })

    this.after('READ', PurchaseOrders,async(results) => {
    return results.map(po => {
        if (po.status === 'DRAFT') po.status = 'Approval Pending'
        return po
})
    })
})


