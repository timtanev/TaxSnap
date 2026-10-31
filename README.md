
# TaxSnap iOS - FreeAgent Features

SwiftUI iOS app that replicates FreeAgent.com features for TaxSnap.site

## Features Implemented (FreeAgent parity):
1. Bank Feed via Open Banking (TrueLayer ready)
2. Overview Dashboard with cashflow forecast
3. Banking - Explain transactions like FreeAgent
4. Invoicing - Estimate -> Invoice flow
5. Expenses - Receipt snap grid
6. Taxes - MTD VAT + Self Assessment + 1099 Calculator WebView
7. 90-day consent warning (FCA requirement)

## How to run:
1. Open Xcode 15+
2. New Project -> iOS App -> SwiftUI -> Name: TaxSnap
3. Replace ContentView.swift with TaxSnapApp.swift content
4. Add Charts framework: import Charts (iOS 16+)
5. For bank feed real integration:
   - Install TrueLayer iOS SDK: pod 'TrueLayer' or SPM
   - Replace showConnectBank sheet with:
     ```swift
     TrueLayer.shared.banking.createConnection(...)
     ```

## TrueLayer integration snippet (add to Banking tab):
```swift
import TrueLayer

func connectBank() {
    let config = BankingConfig(providers: .uk)
    TrueLayer.shared.banking.presentConnectionFlow(from: viewController, config: config) { result in
        switch result {
        case .success(let connection):
            // Save connection.conId, fetch transactions
            // POST to your backend: /api/bank-accounts
            print("Connected: \(connection)")
        case .failure(let error):
            print(error)
        }
    }
}
```

## Backend needed (same as web):
- POST /api/bank-accounts - store TrueLayer token
- GET /api/transactions - list with explain status
- POST /api/invoices - create invoice

This file is ready for iOS 16+, iPhone and iPad.
