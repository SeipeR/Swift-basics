//
//  main.swift
//  Task
//
//  Created by Дамир Доронкин on 24.02.2021.
//

import Foundation

enum CarTypes {
    case sedan
    case coupe
    case sports
    case hatchback
    case truck
}

enum CarModels {
    case audi
    case bmw
    case ford
    case hyundai
    case kia
    case mazda
}

enum CarColors {
    case red
    case green
    case white
    case blue
    case black
    case yellow
}

enum EngineStates {
    case start, stop
}

enum WindowStates {
    case open, close
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
            print("Цвет автомобиля изменён с \(oldValue) на \(color)")
        }
    }
    var isEngineStart: EngineStates {
        willSet {
            if newValue == .start {
                print("Заводим автомобиль")
            } else {
                print("Глушим двигатель")
            }
        }
    }
    var isWindowOpen: WindowStates
    var occupiedTrunkCapacity: UInt32 = 0
    
    mutating func changeOccupiedCapacity(action: TrunkActions, capacity: UInt32) -> UInt32 {
        guard (occupiedTrunkCapacity + capacity) <= trunkCapacity else {
            print("Максимально возможное значение: \(trunkCapacity - occupiedTrunkCapacity). \nВозвращено значение по умолчанию: \(occupiedTrunkCapacity)")
            return occupiedTrunkCapacity
        }
        
        switch action {
            case .load:
                occupiedTrunkCapacity += capacity
            case .unload:
                    occupiedTrunkCapacity -= capacity
        }
        
        return occupiedTrunkCapacity
    }
}

var someCar = Car(type: .sedan, model: .audi, year: 2003, trunkCapacity: 500, color: .black, isEngineStart: .start, isWindowOpen: .open, occupiedTrunkCapacity: 350)

print(someCar.occupiedTrunkCapacity)
someCar.color = .blue
someCar.isEngineStart = .stop
someCar.isEngineStart = .start
someCar.changeOccupiedCapacity(action: .load, capacity: 300)
print(someCar.occupiedTrunkCapacity)
