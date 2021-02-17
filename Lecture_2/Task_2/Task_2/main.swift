//
//  main.swift
//  Task_2 "Определение делимости числа на 3"
//
//  Created by Дамир Доронкин on 17.02.2021.
//

import Foundation

func findRemainderOfDivision (dividend: Int, devisor: Int) -> Int {
    return (dividend % devisor)
}

func isSplitByThreeWithoutRemainder (_ number: Int) {
    let a = findRemainderOfDivision(dividend: number, devisor: 3)
    if a == 0 {
        print("Число \(number) делится на 3 без остатка!")
    } else {
        print("Число \(number) не делится на 3 без остатка! Остаток от деления: \(a)")
    }
}

print(isSplitByThreeWithoutRemainder(1))
print(isSplitByThreeWithoutRemainder(3))
print(isSplitByThreeWithoutRemainder(0))
print(isSplitByThreeWithoutRemainder(-4))
print(isSplitByThreeWithoutRemainder(-9))
print(isSplitByThreeWithoutRemainder(27))
print(isSplitByThreeWithoutRemainder(100))
