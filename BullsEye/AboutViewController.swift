//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Sascha Sallès on 23/03/2021.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

  @IBOutlet weak var webView: WKWebView!
  override func viewDidLoad() {
    super.viewDidLoad()

    if let url = Bundle.main.url(
        forResource: "BullsEye", withExtension: "html") {
      let request = URLRequest(url: url)
      webView.load(request)
    }
  }

  @IBAction func close() {
    self.dismiss(animated: true, completion: nil)
  }

}
