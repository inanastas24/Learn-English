//
//  ViewController.swift
//  Learn_English
//
//  Created by Anastasiia Inzer on 08.01.2026.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    private var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        loadThemeContent()
    }
    
    private func setupWebView() {
        let config = WKWebViewConfiguration()
        webView = WKWebView(frame: view.bounds, configuration: config)
        webView.navigationDelegate = self
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(webView)
    }
    
    private func loadThemeContent() {
        guard let htmlPath = Bundle.main.path(forResource: "index", ofType: "html") else {
            print("❌ index.html НЕ ЗНАЙДЕНО")
            return
        }
        
        let htmlURL = URL(fileURLWithPath: htmlPath)
        let baseDir = htmlURL.deletingLastPathComponent() // ✅ КЛЮЧОВА ЗМІНА
        
        print("📁 BaseDir: \(baseDir.path)")
        webView.loadFileURL(htmlURL, allowingReadAccessTo: baseDir)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("✅ ЗАВАНТАЖЕНО!")
        diagnosticCSS()
    }
    
    private func diagnosticCSS() {
        webView.evaluateJavaScript("getComputedStyle(document.body).backgroundColor") { color, _ in
            print("🎨 ФОН: \(color ?? "НЕ ПРАЦЮЄ")")
        }
    }
}
