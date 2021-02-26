//
//  main.swift
//  Task
//
//  Created by Дамир Доронкин on 24.02.2021.
//

import Foundation

enum CarTypes: String {
    case sedan = "Седан"
    case coupe = "Купе"
    case sports = "Спортивный"
    case hatchback = "Хэтчбек"
    case trunk = "Грузовой"
}

enum CarModels: String {
    case audi = "Audi"
    case bmw = "BMW"
    case ford = "Ford"
    case hyundai = "Hyundai"
    case kia = "Kia"
    case mazda = "Mazda"
    case renault = "Renault"
}

enum CarColors: String {
    case red = "Красный"
    case green = "Зелёный"
    case white = "Белый"
    case blue = "Голубой"
    case black = "Чёрный"
    case yellow = "Жёлтый"
}

enum EngineStates: String {
    case start = "Автомобиль заведён"
    case stop = "Автомобиль заглушен"
}

enum WindowStates: String {
    case open = "Окна автомобиля открыты"
    case close = "Окна автомобиля закрыты"
}

enum TrunkActions {
    case load, unload
}

struct Car {
    let type: CarTypes
    let model: CarModels
    let year: UInt16
    let trunkCapacity: UInt32
    var color: CarColors {
        didSet {
            print("Цвет автомобиля типа \(type.rawValue) изменён с \(oldValue.rawValue) на \(color.rawValue)")
        }
    }
    var isEngineStart: EngineStates {
        willSet {
            if newValue == .start {
                print("Заводим автомобиль типа \(type.rawValue)")
            } else {
                print("Глушим двигатель автомобиля типа \(type.rawValue)")
            }
        }
    }
    var isWindowOpen: WindowStates
    var occupiedTrunkCapacity: UInt32 = 0
    
    mutating func changeOccupiedCapacity(action: TrunkActions, capacity: UInt32) -> UInt32 {
        switch action {
            case .load:
                guard (occupiedTrunkCapacity + capacity) <= trunkCapacity else {
                    print("Максимально возможное значение объёма для погрузки: \(trunkCapacity - occupiedTrunkCapacity). \nВозвращено значение по умолчанию: \(occupiedTrunkCapacity)")
                    return occupiedTrunkCapacity
                }
                occupiedTrunkCapacity += capacity
                print("В автомобиль типа \(type.rawValue) загружено \(capacity)")
            case .unload:
                guard capacity <= occupiedTrunkCapacity else {
                    print("Максимально возможное значение объёма для выгрузки: \(occupiedTrunkCapacity). \nВозвращено значение по умолчанию: \(occupiedTrunkCapacity)")
                    return occupiedTrunkCapacity
                }
                occupiedTrunkCapacity -= capacity
                print("Из автомобиля типа \(type.rawValue) выгружено \(capacity)")
        }
        print("Текущий занятый объём автомобиля типа \(type.rawValue): \(occupiedTrunkCapacity)")
        return occupiedTrunkCapacity
    }
}

var sedan = Car(type: .sedan, model: .audi, year: 2003, trunkCapacity: 500, color: .black, isEngineStart: .start, isWindowOpen: .open, occupiedTrunkCapacity: 350)
var coupe = Car(type: .coupe, model: .kia, year: 1995, trunkCapacity: 750, color: .blue, isEngineStart: .stop, isWindowOpen: .close)
var sports = Car(type: .sports, model: .mazda, year: 2016, trunkCapacity: 200, color: .green, isEngineStart: .start, isWindowOpen: .close, occupiedTrunkCapacity: 50)
var hatchback = Car(type: .hatchback, model: .hyundai, year: 1999, trunkCapacity: 900, color: .yellow, isEngineStart: .stop, isWindowOpen: .open, occupiedTrunkCapacity: 400)
var trunk = Car(type: .trunk, model: .renault, year: 2007, trunkCapacity: 15000, color: .white, isEngineStart: .stop, isWindowOpen: .open, occupiedTrunkCapacity: 9000)

var cars = [sedan, coupe, sports, hatchback, trunk]

sedan.color = .blue
coupe.isEngineStart = .start
sedan.isEngineStart = .stop
trunk.changeOccupiedCapacity(action: .unload, capacity: 351)

func createDescription(array: Array<Car>) {
    for element in array {
        print("Описание автомобиля:\nТип автомобиля: \(element.type.rawValue)\nМарка автомобиля: \(element.model.rawValue)\nГод выпуска: \(element.year)\nЦвет автомобиля: \(element.color.rawValue)\nВмещаемый объём груза: \(element.trunkCapacity)\nЗанятый объём: \(element.occupiedTrunkCapacity)\n\(element.isEngineStart.rawValue)\n\(element.isWindowOpen.rawValue)\n\n")
    }
}

createDescription(array: cars)
