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
