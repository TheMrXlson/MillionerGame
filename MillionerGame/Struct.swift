//
//  Struct.swift
//  MillionerGame
//
//  Created by Egor Efimenko on 10.06.2022.
//

import Foundation

enum Difficult: Codable {
    case easy, medium, hard
}

struct Question: Codable {
    var question: String
    var answers: Answers
    var answer: String
    var difficult: Difficult?
}

struct Answers: Codable {
    var a: String
    var b: String
    var c: String
    var d: String
    
}

struct Record: Codable {
    let date: Date
    let score: Int
    let difficult: String
}

typealias Questions = [Question]
typealias Records = [Record]
