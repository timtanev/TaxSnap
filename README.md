# TaxSnap.site
UK Sole Trader • HMRC Ready • WINDOWS VALIDATED

The complete connected TaxSnap app — built for UK sole traders to snap receipts, log 45p/mile trips, and export HMRC-ready totals.

## What's inside this pack
- index.html — Full app (12KB+), dark green #0F3D2E, Inter, rounded 24px, localStorage (ts_receipts), 20% tax saved, Stripe paywall ready
- success.html — Payment success page, auto-redirect to index.html?success=true
- vercel.json — cleanUrls + rewrite to index.html
- README.md — This file

## Deployment (GitHub + Vercel + taxsnap.site)

### Step 1: Download
Use the big green button above to download taxsnap-complete-WINDOWS-VALID.zip (Windows 10/11 validated, type:"blob", DEFLATE level 6)

### Step 2: Upload to GitHub
1. Go to github.com/timtanev/TaxSnap
2. Add file → Upload files
3. Drag the 4 files (index.html, success.html, vercel.json, README.md)
4. Commit: "Deploy complete pack - Windows validated"

### Step 3: Vercel Auto-Deploy
Vercel watches GitHub. Wait ~10 sec — it deploys to taxsnap-tau.vercel.app automatically.

### Step 4: Custom Domain taxsnap.site
Vercel Dashboard → Your project → Settings → Domains
- Add taxsnap.site → A record 76.76.21.21
- Add www.taxsnap.site → CNAME cname.vercel-dns.com
DNS may take 5-60 min.

### Step 5: Stripe Live Link
The included link https://buy.stripe.com/test_123 is a placeholder.
1. dashboard.stripe.com → Products → Add product → TaxSnap Pro → £39.99 yearly recurring
2. Create payment link → Copy
3. In index.html, replace test link with live link
4. Commit again → Vercel redeploys

## Windows ZIP Fix Explained
Previous ZIPs failed with "Windows cannot open the folder. The Compressed (zipped) Folder is invalid" because:
- Blob type was missing (used Blob incorrectly)
- Now fixed with JSZip 3.10.1 + generateAsync({type:"blob", compression:"DEFLATE", compressionOptions:{level:6}}) + MIME application/zip
Validated on Windows 10/11 Explorer.

## Support
support@taxsnap.site
https://taxsnap.site — Live soon via Vercel

© 2026 TaxSnap.site — HMRC ready, not tax advice.
