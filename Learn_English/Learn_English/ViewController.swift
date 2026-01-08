//
//  ViewController.swift
//  Learn_English
//
//  Created by Anastasiia Inzer on 08.01.2026.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    private var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        loadThemeContent()
    }
    
    private func setupWebView() {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        
        webView = WKWebView(frame: .zero, configuration: config)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(webView)
        
        // Auto Layout constraints
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func loadThemeContent() {
        // Спосіб 1: HTML + CSS разом (НАДІЙНИЙ)
        guard let htmlPath = Bundle.main.path(forResource: "index", ofType: "html") else {
            print("❌ index.html НЕ ЗНАЙДЕНО")
            return
        }
        
        let htmlURL = URL(fileURLWithPath: htmlPath)
        let baseDir = htmlURL.deletingLastPathComponent()
        
        print("📁 Base directory: \(baseDir.path)")
        print("🌐 HTML: \(htmlPath)")
        
        webView.loadFileURL(htmlURL, allowingReadAccessTo: baseDir)
    }

    
    // 3. Кнопка перемикання теми - ДОДАЙТЕ ЦЕ В ViewController.swift
    private lazy var themeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("🌙 Темна", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = UIColor.systemGray6
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(toggleTheme), for: .touchUpInside)
        return button
    }()

    @objc private func toggleTheme() {
        let script = """
        document.body.classList.toggle('dark');
        localStorage.setItem('theme', document.body.classList.contains('dark') ? 'dark' : 'light');
        """
        webView.evaluateJavaScript(script) { _, error in
            if let error = error {
                print("Помилка перемикання теми: \(error)")
            }
        }
    }
}
