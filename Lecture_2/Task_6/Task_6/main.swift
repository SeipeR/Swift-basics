//
//  main.swift
//  Task_6 "Создание массива, заполненного простыми числами"
//
//  Created by Дамир Доронкин on 17.02.2021.
//

import Foundation

func searchPrimeNumbers (finiteNumber: Int) -> Array<Int> {
    var array = [Bool]()
    var finishArray = [Int]()
    
    for _ in (1...finiteNumber) {
        array.append(true)
    }
    
    for i in (2...Int((Double(finiteNumber)).squareRoot())) {
        if (array[i]) {
            for j in stride (from: (i * i), to: finiteNumber, by: i) {
                array[j] = false
            }
        }
    }
    
    for i in (2..<finiteNumber) {
        if array[i] {
            finishArray.append(i)
        }
    }
    
    return finishArray
}

print(searchPrimeNumbers(finiteNumber: 100))
