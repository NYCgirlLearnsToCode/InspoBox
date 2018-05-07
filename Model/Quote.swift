//
//  Quote.swift
//  InspoBox
//
//  Created by Lisa J on 4/24/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

struct Quote : Codable {
    let contents: QuotesWrapper
}
struct QuotesWrapper: Codable {
    let quotes: [quotesArr]
}
struct quotesArr: Codable {
    let quote: String
    let author: String
}
