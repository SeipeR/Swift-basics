//
//  main.swift
//  Task_5 "Создание массива, содержащего числа Фибоначчи"
//
//  Created by Дамир Доронкин on 17.02.2021.
//

import Foundation

func createFibonacciArray (arrayLength: Int) -> Array<Int> {
    var array = [Int]()
    
    for i in (0..<arrayLength) {
        switch i {
            case 0:
                array.append(i)
            case 1:
                array.append(i)
            default:
                array.append(array[i-2] + array[i-1])
        }
    }
    
    return array
}

print(createFibonacciArray(arrayLength: 50))
