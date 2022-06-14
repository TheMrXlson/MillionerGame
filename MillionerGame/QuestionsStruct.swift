//
//  QuestionStruct.swift
//  MillionerGame
//
//  Created by Egor Efimenko on 10.06.2022.
//

import Foundation

struct Question: Codable {
    
    var question: String
    var answers: Answers
    var answer: String
}

struct Answers: Codable {
    var a: String
    var b: String
    var c: String
    var d: String
    
}
typealias Questions = [Question]
