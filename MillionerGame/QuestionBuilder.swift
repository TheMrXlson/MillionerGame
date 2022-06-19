//
//  QuestionBuilder.swift
//  MillionerGame
//
//  Created by Egor Efimenko on 19.06.2022.
//

import Foundation

class QuestionBuilder {
    private(set) var questionText: String = ""
    private(set) var answerA: String = ""
    private(set) var answerB: String = ""
    private(set) var answerC: String = ""
    private(set) var answerD: String = ""
    private(set) var rightAnswer: String = ""
    private(set) var difficult: Difficult = .easy
    
    func build() -> Question {
        return Question(question: questionText, answers: Answers(a: answerA, b: answerB, c: answerC, d: answerD), answer: rightAnswer, difficult: difficult)
    }
    
    func setQuestionText(_ question: String) {
        self.questionText = question
    }
    
    func setAnswerA(_ answer: String) {
        self.answerA = answer
    }
    
    func setAnswerB(_ answer: String) {
        self.answerB = answer
    }
    
    func setAnswerC(_ answer: String) {
        self.answerC = answer
    }
    
    func setAnswerD(_ answer: String) {
        self.answerD = answer
    }
    
    func rightAnswer(_ answer: String) {
        self.rightAnswer = answer
    }
    
    func setDifficult(_ difficult: Difficult) {
        self.difficult = difficult
    }
}
