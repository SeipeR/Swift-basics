//
//  main.swift
//  Task_2 "Поиск площади, периметра и гипотенузы прямоугольного треугольника"
//
//  Created by Дамир Доронкин on 14.02.2021.
//

import Foundation

print("Программа для поиска площади, периметра и гипотенузы прямоугольного треугольника")

var a: String?
var b: String?

repeat {
    print("Введите значение катета прямоугольного треугольника a:")
    a = readLine()
} while Double(a!) == nil

repeat {
    print("Введите значение катета прямоугольного треугольника b:")
    b = readLine()
} while Double(b!) == nil

let square: Double = (Double(a!)! * Double(b!)!) / 2
print("Площадь прямоугольного треугольника равна: \(square)")

let c = sqrt((pow(Double(a!)!, 2)) + (pow(Double(b!)!, 2)))
print("Гипотенуза прямоугольного треугольника равна: \(c)")

let perimeter: Double = Double(a!)! + Double(b!)! + c
print("Периметр прямоугольного треугольника равен: \(perimeter)")
