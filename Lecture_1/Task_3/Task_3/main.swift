//
//  main.swift
//  Task_3 "Поиск суммы вклада"
//
//  Created by Дамир Доронкин on 14.02.2021.
//

import Foundation

print("Программа для поиска суммы вклада")

var initialDeposit: String?
var annualisedRate: String?
var lengthOfDeposit: String?
let numberOfDaysPerYear: Double = 365.0

repeat {
    print("Введите значение начальной суммы вклада:")
    initialDeposit = readLine()
} while Double(initialDeposit!) == nil

repeat {
    print("Введите годовую процентную ставку:")
    annualisedRate = readLine()
} while Double(annualisedRate!) == nil

repeat {
    print("Введите срок вклада (дни):")
    lengthOfDeposit = readLine()
} while Double(lengthOfDeposit!) == nil

let totalDeposit: Double = Double(initialDeposit!)! + ((Double(initialDeposit!)! * Double(annualisedRate!)! * Double(lengthOfDeposit!)! / numberOfDaysPerYear) / 100)
print("Общая сумма вклада равна: \(totalDeposit)")
