//
//  QuoteAPIClient.swift
//  InspoBox
//
//  Created by Lisa J on 4/25/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

class QuoteAPIClient {
    private init(){}
    static let manager = QuoteAPIClient()
    func getQuote(url: String, completionHandler: @escaping ([quotesArr]) -> Void, errorHandler: @escaping (Error) -> Void) {
        let urlString = url
        guard let url = URL(string: urlString) else {return}
        let request = URLRequest(url:url)
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let quote = try JSONDecoder().decode(Quote.self, from: data)
                //decode everything (outmost layer)                                 from: data)
                
                let results = quote.contents.quotes
                //bc it's in an array wrapper
                completionHandler(results)
                //pass in the info you want
            } catch let error{
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: completion, errorHandler: errorHandler)
    }
}
