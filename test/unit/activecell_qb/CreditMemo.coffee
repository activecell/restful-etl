CreditMemo = require("../../../lib/load/providers/activecell_objects/qb/credit_memo").class
assert  = require("chai").assert

describe "qb ActiveCell", ->
  describe "creditMemo object", ->
    beforeEach ()->
      @companyId = "1A78ADSF6780AZXCVf"

      @qbdObj =
        RemainingCredit: 10498.95
        domain: "QBO"
        sparse: false
        Id: "276"
        SyncToken: "0"
        MetaData:
          CreateTime: "2013-04-29T17:30:30-07:00"
          LastUpdatedTime: "2013-04-29T17:30:30-07:00"
        CustomField:[
          Name: "Custom 1"
          Type: "StringType"
          ,
          Name: "Custom 2"
          Type: "StringType"
          ,
          Name: "Custom 3"
          Type: "StringType"
        ]
        DocNumber: "1139"
        TxnDate: "2013-04-29"
        DepartmentRef:
          value: "1"
          name: "testDept"
        PrivateNote:"CreditMemo"
        Line:[
          Id: "1"
          LineNum: 1
          Description: "QBO"
          Amount: 9999.00
          DetailType: "SalesItemLineDetail"
          SalesItemLineDetail:
            ItemRef:
              value: "1"
              name: "Sales"
            UnitPrice:9999
            Qty:1
            TaxCodeRef:
              value:"TAX"
          ,
          Amount: 9999.00
          DetailType: "SubTotalLineDetail"
          SubTotalLineDetail: { }
          ,
          Amount: 999.90
          DetailType: "DiscountLineDetail"
          DiscountLineDetail:
            PercentBased:true
            DiscountPercent:10
            DiscountAccountRef:
              value:"51"
              name:"Discounts given"
        ]
        TxnTaxDetail:
          TxnTaxCodeRef:
            value: "9"
        TotalTax:1499.85
        TaxLine:[
          Amount:1499.85
          DetailType: "TaxLineDetail"
          TaxLineDetail:
            TaxRateRef:
              value:"8"
            PercentBased:true
            TaxPercent:15
            NetAmountTaxable:9999.00
        ]
        CustomerRef:
          value: "96"
          name: "yOvUlsnhx6 AOGcYnY5TI"
        CustomerMemo:
          value: "Issuing a credit to customer"
        BillAddr:
          Id: "92"
          Line1: "2700 Garcia Avenue"
          City: "Mountain View"
          Country: "USA"
          CountrySubDivisionCode: "CA"
          PostalCode: "94043"
          Lat: "37.4276176"
          Long: "-122.099344"
        ShipAddr:
          Id: "93"
          Line1: "2500 Garcia Avenue"
          City: "Mountain View"
          Country: "USA"
          CountrySubDivisionCode: "CA"
          PostalCode: "94043"
          Lat: "37.428314"
          Long: "-122.0961024"
        TotalAmt: 10498.95
        ApplyTaxAfterDiscount: false
        PrintStatus: "NotSet"
        EmailStatus: "NotSet"
        BillEmail:
          Address: "test@abc.com"
        Balance:10498.95
      @creditMemo = new CreditMemo(@companyId)
