//
//  ViewController.swift
//  RandomStoicQuotes
//
//  Created by Salih Yusuf Göktaş on 12.04.2023.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var quoteLabel: UILabel!
	
	@IBOutlet weak var authorLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	@IBAction func randomQuoteButton(_ sender: Any) {
		let url = URL(string: "https://stoic-quotes.com/api/quote")!
		let task = URLSession.shared.dataTask(with: url) { (data : Data?, response : URLResponse?, error : Error?) in
			if let error = error{
				print(error)
				return
			}
			let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String : String]
			print(json)
			DispatchQueue.main.async {
				self.quoteLabel.text = json["text"]
				self.authorLabel.text = json["author"]
			}
		}
		task.resume()
	}
	
}
