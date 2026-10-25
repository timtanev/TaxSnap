import SwiftUI
import WebKit
struct WebView: UIViewRepresentable { let url: URL; func makeUIView(context: Context) -> WKWebView { let w = WKWebView(frame: .zero, configuration: config); w.isInspectable=true; return w; } func updateUIView(_ w: WKWebView, context: Context) { if w.url==nil { w.load(URLRequest(url: url)) } } }
struct ContentView: View { var body: some View { if let u = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "www") { WebView(url: u).ignoresSafeArea() } } }