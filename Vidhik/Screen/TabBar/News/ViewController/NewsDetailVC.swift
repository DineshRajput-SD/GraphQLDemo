//
//  NewsDetailVC.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 13/05/24.
//

import UIKit
import WebKit

class NewsDetailVC: UIViewController {
    
    //MARK: =================== IBOutlet Properties ===================
    @IBOutlet weak var newsWebView: WKWebView!
    
    // MARK: =========== Instance Propertirs Base News URL ========================
//    var newsUrl = "http://www.livemint.com/politics/news/lok-sabha-elections-2024-south-indian-actors-allu-arjun-chiranjeevi-konidela-jr-ntr-teja-vote-tollywood-hyderabad-video-11715570325071.html"
    
    var newsUrl: String?
    //MARK: =================== View Controller Life Cycle Method ===================
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        openUrl()
    }
    
    // MARK: =================== Private Methods Open URL ===================
    private func openUrl() {
        newsWebView.navigationDelegate = self
        guard let url = URL(string: newsUrl ?? "") else { return }
        DispatchQueue.main.async {
            self.newsWebView.load(URLRequest(url: url))
        }
    }
    
    // MARK:  ========== IBAction Method ===============
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: ===================  WKNavigationDelegate Methods ===================
extension NewsDetailVC : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Loader.hide()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        Loader.show()
    }
}
