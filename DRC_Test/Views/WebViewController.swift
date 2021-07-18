//
//  WebViewController.swift
//  DRC_Test
//
//  Created by Nihal Khokhari on 18/07/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let thisUrl = urlString {
            webView.load(NSURLRequest(url: NSURL(string: thisUrl)! as URL) as URLRequest)
        }
    }
}
