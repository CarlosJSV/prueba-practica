//
//  GraphEntity.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//

import Foundation

struct Report: Codable {
    let data: [Test]
}

// MARK: - Datum
struct Test: Codable {
    let question: String
    let answer: [Answer]
    
    enum CodingKeys: String, CodingKey {
        case question = "pregunta"
        case answer = "values"
    }
}

// MARK: - Value
struct Answer: Codable {
    let label: String
    let value: Int
}
