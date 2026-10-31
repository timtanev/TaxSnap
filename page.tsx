export default function About() {
  return (
    <main className="container" style={{ padding: '60px 24px' }}>
      <h1 style={{ fontSize: 42, fontWeight: 800, marginBottom: 16 }}>About this deployable</h1>
      <p style={{ color: '#52525b', maxWidth: 700, fontSize: 18, marginBottom: 32 }}>
        This is a full Next.js App Router project, not just an image. It has routing, API, layout, and is ready for GitHub + Vercel.
      </p>
      <div className="grid grid-3">
        <div className="card"><h3>Routes</h3><p style={{ color: '#71717a', fontSize: 14, marginTop: 8 }}>/ (home)<br/>/about (this page)<br/>/api/health (json api)</p></div>
        <div className="card"><h3>Stack</h3><p style={{ color: '#71717a', fontSize: 14, marginTop: 8 }}>Next.js 15.5.28<br/>React 19<br/>TypeScript 5<br/>Vercel iad1</p></div>
        <div className="card"><h3>Deploy</h3><p style={{ color: '#71717a', fontSize: 14, marginTop: 8 }}>Push to GitHub → Import to Vercel → Auto deploy. Works on first try.</p></div>
      </div>
    </main>
  );
}
