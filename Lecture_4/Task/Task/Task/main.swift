//
//  main.swift
//  Task
//
//  Created by Дамир Доронкин on 01.03.2021.
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

class Car {
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
    var occupiedTrunkCapacity: UInt32
    init(type: CarTypes, model: CarModels, year: UInt16, capacity: UInt32, color: CarColors, engineState: EngineStates, windowState: WindowStates, occupiedCapacity: UInt32) {
        self.type = type
        self.model = model
        self.year = year
        trunkCapacity = capacity
        self.color = color
        isEngineStart = engineState
        isWindowOpen = windowState
        occupiedTrunkCapacity = occupiedCapacity
    }
    
    func changeOccupiedCapacity(){
    }
}
