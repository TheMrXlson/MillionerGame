//
//  GameSingleton.swift
//  MillionerGame
//
//  Created by Egor Efimenko on 13.06.2022.
//

import Foundation

class GameSingleton {
    static let shared = GameSingleton()
    
    func getQuestions() -> Questions {
        var question: Questions = []
        switch difficult {
        case .easy:
            question = [
                Question(question: "Что растёт в огороде? ", answers: Answers(a: "A: Лук ", b: "B: Пистолет ", c: "C: Пулемёт", d: "D: Ракета СС-20 "), answer: "A"),
                Question(question: "Какого персонажа нет в известной считалке «На золотом крыльце сидели» ?", answers: Answers(a: "A: Сапожника", b: "B: Кузнеца", c: "C: Короля", d: "D: Портного"), answer: "B"),
                Question(question: "Как называют микроавтобусы, совершающие поездки по определённым маршрутам?", answers: Answers(a: "A: Рейсовка ", b: "B: Путёвка ", c: "C: Курсовка " , d: "D: Маршрутка "), answer: "D")
            ]
            question.append(contentsOf: userQuestions.filter({ $0.difficult == .easy }))
        case .medium :
            question = [
                Question(question: "О чём писал Грибоедов, отмечая, что он «нам сладок и приятен» ?", answers: Answers(a: "A: Дым Отечества", b: "B: Дух купечества ", c: "C: Дар пророчества", d: "D: Пыл девичества"), answer: "A"),
                Question(question: "Какой специалист занимается изучением неопознанных летающих объектов?", answers: Answers(a: "A: Кинолог", b: "B: Уфолог ", c: "C: Сексопатолог ", d: "D: Психиатр "), answer: "B"),
                Question(question: "На что кладут руку члены английского общества лысых во время присяги?", answers: Answers(a: "A: Баскетбольный мяч ", b: "B: Бильярдный шар  ", c: "C: Апельсин" , d: "D: Кокосовый орех"), answer: "B")
            ]
            question.append(contentsOf: userQuestions.filter({ $0.difficult == .medium }))
        case .hard :
            question = [
                Question(question: "Что в России 19 века делали в дортуаре? ", answers: Answers(a: "A: Ели ", b: "B: Спали ", c: "C: Ездили верхом ", d: "D: Купались "), answer: "B"),
                Question(question: "Как Пётр Ильич Чайковский назвал свою серенаду для скрипки с оркестром си-бемоль минор? ", answers: Answers(a: "A: Флегматическая ", b: "B: Меланхолическая ", c: "C: Холерическая ", d: "D: Сангвиническая"), answer: "B"),
                Question(question: "Какого ордена не было у первого советского космонавта Юрия Гагарина? ", answers: Answers(a: "A: «Ожерелье Нила» (Египет) ", b: "B: «Крест Грюнвальда» (Польша) ", c: "C: «Плайя Хирон» (Куба)" , d: "D: «Орден двойного дракона» (Китай)"), answer: "D")
            ]
            question.append(contentsOf: userQuestions.filter({ $0.difficult == .hard }))
        }
        
        if randomQuestions == true {
            return question.shuffled()
        } else {
            return question
        }
    }
    
    private let caretaker = Caretaker()
    
    private(set) var userQuestions: Questions
    private(set) var records: Records
    private(set) var difficult: Difficult = .easy
    private(set) var randomQuestions: Bool = false
    
    init() {
        records = caretaker.retrieveRecords()
        userQuestions = caretaker.retrieveQuestions()
    }
    
    func addRecord(_ record: Record) {
        records.insert(record, at: 0) // в списке рекордов было по порядку сверху
        caretaker.save(records: records)
    }
    func addQuestion(_ question:Question) {
        userQuestions.append(question)
        caretaker.save(questions: userQuestions)
    }
    
    func clearRecords() {
        records = []
        caretaker.save(records: records)
    }
    
    func setDifficult(_ selectDifficult: Difficult) {
        difficult = selectDifficult
    }
    
    func setRandom(_ result: Bool) {
        randomQuestions = result
    }
}
