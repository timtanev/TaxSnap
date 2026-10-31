TaxSnap.site - With FreeAgent Features Added

This build includes:
- Existing: 0/5 scans, Export HMRC CSV, Export for Accountant, Upgrade to Pro £3.33/mo
- NEW FreeAgent features:
  - Bank Feed: Monzo, Starling, NatWest, HSBC with TrueLayer Open Banking
  - Where is sync? -> Banking & Invoices tab -> CONNECT BANK ACCOUNT button (top)
  - Explain transactions (like FreeAgent)
  - Invoices: Create, View, Edit, Delete - Example INV-1041 opens
  - Cashflow forecast
  - 90-day consent handling

How to deploy:
1. For taxsnap.site (Hostinger/cPanel):
   - Upload index.html and vercel.json to public_html
   - Overwrite

2. For Vercel (taxsnap-tau.vercel.app):
   - Upload index.html and vercel.json to GitHub repo timtanev/TaxSnap
   - Vercel auto-deploys

3. For local test:
   - Open index.html in browser - all buttons work

Bank sync location:
- Click "Banking & Invoices" tab
- Top card says "WHERE IS SYNC? HERE ↓"
- Big green button: "CONNECT BANK ACCOUNT"
- Click -> Choose bank -> Consent -> Synced

Invoice location:
- Banking & Invoices tab -> "Create Invoice" or "View All Invoices"
- Click any invoice like INV-1041 to open example

TrueLayer integration:
- Search for TrueLayer in App.tsx to add real API keys
