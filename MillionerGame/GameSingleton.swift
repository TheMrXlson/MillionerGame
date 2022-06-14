//
//  GameSingleton.swift
//  MillionerGame
//
//  Created by Egor Efimenko on 13.06.2022.
//

import Foundation

struct Record: Codable {
    let date: Date
    let score: Int
}

class GameSingleton {
    static let shared = GameSingleton()
    
    let questions: Questions = [
        Question(question: "О чём писал Грибоедов, отмечая, что он «нам сладок и приятен» ?", answers: Answers(a: "A: Дым Отечества", b: "B: Дух купечества ", c: "C: Дар пророчества", d: "D: Пыл девичества"), answer: "A"),
        Question(question: "Какого персонажа нет в известной считалке «На золотом крыльце сидели» ?", answers: Answers(a: "A: Сапожника", b: "B: Кузнеца", c: "C: Короля", d: "D: Портного"), answer: "B"),
        Question(question: "На что кладут руку члены английского общества лысых во время присяги?", answers: Answers(a: "A: Баскетбольный мяч ", b: "B: Бильярдный шар  ", c: "C: Апельсин" , d: "D: Кокосовый орех"), answer: "B")
    ]
    
    private let recordsCaretaker = RecordsCaretaker()
    
    private(set) var records: [Record] = []
    
    init() {
        records = recordsCaretaker.retrieveRecords()
    }
    
    func addRecord(_ record: Record) {
        records.append(record)
        recordsCaretaker.save(records: records)
    }
    
    func clearRecords() {
        records = []
        recordsCaretaker.save(records: records)
    }
}
