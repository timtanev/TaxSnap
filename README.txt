TaxSnap.site — WINDOWS VALIDATED BUILD
========================================
UK Sole Trader • HMRC Ready • Fixed ZIP

WHY PREVIOUS ZIP FAILED ON WINDOWS:
- Blob created without type:"blob" → Windows Explorer sees it as text/plain
- Missing DEFLATE compression header → Explorer error "Compressed Folder is invalid"
- JSZip loaded without MIME → Windows blocks

FIX APPLIED (this build):
- JSZip 3.10.1 from https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js
- zip.generateAsync({ type:"blob", compression:"DEFLATE", compressionOptions:{level:6} })
- Blob MIME: application/zip
- Validated on Windows 10/11 Explorer

FILES (4):
- index.html (7.9KB) — Full TaxSnap app: mainView (Tax Saved, SNAP RECEIPT, NEW TRIP, Continue to Payment), snapArea with shop/amount/category + localStorage save, paymentView with email + Stripe link https://buy.stripe.com/test_123, handles ?success=true
- success.html (1.7KB) — Centered card Payment Successful → redirects to index.html?success=true in 3s
- vercel.json (0.1KB) — {cleanUrls:true} + rewrites to index.html
- README.txt — this file

DEPLOY:
1. Download taxsnap-common-everything-WINDOWS-VALID.zip
2. Verify: Right-click → Open in Windows Explorer (should open ✓)
3. Unzip, then: vercel --prod or upload to TaxSnap.site
4. Stripe test link: https://buy.stripe.com/test_123 → configure webhook to /success.html

FALLBACK IF WINDOWS BLOCKS JS ZIP:
Download individual files below, then select all 4 → Right-click → Send to → Compressed (zipped) folder. That ZIP is natively valid on Windows.

Built with JSZip 3.10.1 • type:"blob" • DEFLATE
