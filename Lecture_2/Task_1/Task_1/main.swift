//
//  main.swift
//  Task_1 "Нахождение чётных чисел"
//
//  Created by Дамир Доронкин on 17.02.2021.
//

import Foundation

func findRemainderOfDivision (dividend: Int, devisor: Int) -> Int {
    return (dividend % devisor)
}

func isEvenNumber (_ number: Int) {
    if findRemainderOfDivision(dividend: number, devisor: 2) == 0 {
        print("Число \(number) - чётное!")
    } else {
        print("Число \(number) - нечётное!")
    }
}

print(isEvenNumber(100))
print(isEvenNumber(-1))
print(isEvenNumber(197))
print(isEvenNumber(0))
print(isEvenNumber(4))
print(isEvenNumber(-92))
