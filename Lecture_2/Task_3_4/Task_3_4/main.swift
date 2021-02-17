//
//  main.swift
//  Task_3_4 "Создание массива и удаление элементов из него"
//
//  Created by Дамир Доронкин on 17.02.2021.
//

import Foundation

func findRemainderOfDivision (dividend: Int, devisor: Int) -> Int {
    return (dividend % devisor)
}

func isEvenNumber (_ number: Int) -> Bool {
    if findRemainderOfDivision(dividend: number, devisor: 2) == 0 {
        //print("Число \(number) - чётное!")
        return true
    } else {
        //print("Число \(number) - нечётное!")
        return false
    }
}

func isSplitByThreeWithoutRemainder (_ number: Int) -> Bool {
    let a = findRemainderOfDivision(dividend: number, devisor: 3)
    if a == 0 {
        //print("Число \(number) делится на 3 без остатка!")
        return true
    } else {
        //print("Число \(number) не делится на 3 без остатка! Остаток от деления: \(a)")
        return false
    }
}

func createIncreasingNumberArray (countOfElement: Int) -> Array<Int> {
    var array = [Int]()
    for i in (1...countOfElement) {
        array.append(i)
    }
    return array
}


// Задание 4. Вариант 1 (С помощью ранее созданных функций)
func deleteElementOfArray (_ array: Array<Int>, condition:(_ number: Int) -> Bool) -> Array<Int> {
    var a = [Int]()
    for element in array {
        if !condition(element) {
            a.append(element)
        }
    }
    return a
}

var startArray = createIncreasingNumberArray(countOfElement: 100)
var tempArray = deleteElementOfArray(startArray, condition: isEvenNumber)
var endArray = deleteElementOfArray(tempArray, condition: isSplitByThreeWithoutRemainder)
print(endArray)


//Задание 4. Вариант 2 (С помощью указания условий)
func deleteElementOfArrayAlternate (_ array: Array<Int>) -> Array<Int> {
    var a = [Int]()
    for element in array {
        if ((element % 2) != 0) && ((element % 3) != 0){
            a.append(element)
        }
    }
    return a
}

print(deleteElementOfArrayAlternate(startArray))
