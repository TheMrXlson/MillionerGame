//
//  Caretaker.swift
//  MillionerGame
//
//  Created by Egor Efimenko on 13.06.2022.
//

import Foundation

class Caretaker {
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let recordsKey = "records"
    private let questionsKey = "userQuestions"
    
    func save(records: Records) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.set(data, forKey: recordsKey)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> Records {
        guard let data = UserDefaults.standard.data(forKey: recordsKey) else {
            return []
        }
        
        do {
            return try decoder.decode(Records.self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
    func save(questions: Questions) {
        do {
            let data = try encoder.encode(questions)
            UserDefaults.standard.set(data, forKey: questionsKey)
        } catch {
            print(error)
        }
    }
    
    func retrieveQuestions() -> Questions {
        guard let data = UserDefaults.standard.data(forKey: questionsKey) else {
            return []
        }
        
        do {
            return try decoder.decode(Questions.self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
