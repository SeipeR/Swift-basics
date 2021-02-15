//
//  main.swift
//  Task_1 "Решить квадратное уравнение"
//
//  Created by Дамир Доронкин on 14.02.2021.
//

import Foundation

print("Программа для решения квадратного уравнения типа: a(x^2) + bx + c = 0")

var a: String?
var b: String?
var c: String?
var x1: Double
var x2: Double

repeat {
    print("Введите значение коэффициента a:")
    a = readLine()
} while Double(a!) == nil

repeat {
    print("Введите значение коэффициента b:")
    b = readLine()
} while Double(b!) == nil

repeat {
    print("Введите значение коэффициента c:")
    c = readLine()
} while Double(c!) == nil
print("Решение уравнения: \(a!)(x^2) + \(b!)x + \(c!) = 0")

let discriminant: Double = pow(Double(b!)!,2) - (4 * Double(a!)! * Double(c!)!)
print("Дискриминат уравнения равен: \(discriminant)")

if discriminant < 0{
    print("Уравнение не имеет корней!")
} else if discriminant == 0 {
    print("Уравнение имеет единственный корень!")
    x1 = (-(Double(b!)!)) / (2 * Double(a!)!)
    print ("Корень уравнения: \(x1)")
} else {
    print("Уравнение имеет два корня")
    x1 = ((-(Double(b!)!)) + sqrt(discriminant)) / (2 * Double(a!)!)
    x2 = ((-(Double(b!)!)) - sqrt(discriminant)) / (2 * Double(a!)!)
    print("Корни уравнения: \(x1) и \(x2)")
}
