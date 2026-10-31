import "./globals.css";
export const metadata = { title: "Deployable App - Vercel iad1", description: "Next.js 15.5.28 fully deployable" };
export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>
        <nav>
          <div className="container" style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', height: 64 }}>
            <div style={{ fontWeight: 800, fontSize: 20 }}>▲ NEXT DEPLOY</div>
            <div style={{ display: 'flex', gap: 20, fontSize: 14, fontWeight: 500 }}>
              <a href="/">Home</a>
              <a href="/about">About</a>
              <a href="/api/health">API</a>
            </div>
          </div>
        </nav>
        {children}
        <footer style={{ borderTop: '1px solid #e4e4e7', marginTop: 80, padding: '40px 0', textAlign: 'center', color: '#71717a', fontSize: 14 }}>
          <div className="container">
            Built for Vercel iad1 • Washington, D.C. (East) • 2 cores, 8 GB • Next.js 15.5.28
          </div>
        </footer>
      </body>
    </html>
  );
}
