//
//  ViewController.swift
//  InspoBox
//
//  Created by Lisa J on 4/19/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var randomInspirationButton: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    var randomQuote = [quotesArr]()
    var categories = ["inspire","management",
        "sports","life", "funny","love","art"]
    var selectedCategory = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        }
    
    private func loadRandomQuote() {
        let url = "http://quotes.rest/qod.json?category=\(selectedCategory)"
        let completion = {(onlineQuote: [quotesArr]) in
            self.randomQuote = onlineQuote
            self.textView.text = "\(self.randomQuote[0].quote) -\(self.randomQuote[0].author)"
            print(self.randomQuote)
        }
        QuoteAPIClient.manager.getQuote(url: url, completionHandler: completion, errorHandler: {print($0)})
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) {alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func sendMessageButtonPressed(_ sender: Any) {
        let message = Message(message: textView.text)
        DatabaseService.manager.addMessage(messageToSave: message)
        textView.resignFirstResponder()
        showAlert(title: "Message Sent", message: "Message has been sent to InspoBox!")
        print("senddd")
    }
    
    @IBAction func randomInspirationMessagePressed(_ sender: UIButton) {
        print("random inspo")
        textView.resignFirstResponder()
        loadRandomQuote()
    }
    
    
}
extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        "inspire","management",
//        "sports","life", "funny","love","art"
        switch row {
        case 0:
            selectedCategory = "inspire"
            print(selectedCategory)
        case 1:
            selectedCategory = "management"
            print(selectedCategory)
        case 2:
            selectedCategory = "sports"
            print(selectedCategory)
        case 3:
            selectedCategory = "life"
            print(selectedCategory)
        case 4:
            selectedCategory = "funny"
            print(selectedCategory)
        case 5:
            selectedCategory = "love"
            print(selectedCategory)
        case 6:
            selectedCategory = "art"
            print(selectedCategory)
        default:
            print("over 6")
        }
    }
}

