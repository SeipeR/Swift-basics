//
//  main.swift
//  Task
//
//  Created by Дамир Доронкин on 01.03.2021.
//

import Foundation

class Car {
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
    
    let model: CarModels
    let year: UInt16
    let trunkCapacity: UInt32
    var color: CarColors {
        didSet {
            print("Цвет автомобиля изменён с \(oldValue.rawValue) на \(color.rawValue)")
        }
    }
    var isEngineStart: EngineStates {
        willSet {
            if newValue == .start {
                print("Заводим автомобиль")
            } else {
                print("Глушим двигатель автомобиля типа")
            }
        }
    }
    var isWindowOpen: WindowStates
    var occupiedTrunkCapacity: UInt32
    init(model: CarModels, year: UInt16, capacity: UInt32, color: CarColors, engineState: EngineStates, windowState: WindowStates, occupiedCapacity: UInt32) {
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

class TruckCar: Car {
    enum TruckCarTypes: String {
        case fuel = "Бензовоз"
        case panel = "Автофургон"
        case bulldozer = "Бульдозер"
    }

    enum CargoTypes: String {
        case fuel = "Топливо"
        case flower = "Цветы"
        case rock = "Камни"
    }
    
    let truckType: TruckCarTypes
    let cargoType: CargoTypes
    var isSemitrailerPulling: Bool
    
    init(truckType: TruckCarTypes, cargoType: CargoTypes, semitrailerPulling: Bool, model: CarModels, year: UInt16, capacity: UInt32, color: CarColors, engineState: EngineStates, windowState: WindowStates, occupiedCapacity: UInt32) {
        self.truckType = truckType
        self.cargoType = cargoType
        isSemitrailerPulling = semitrailerPulling
        
        super.init(model: model, year: year, capacity: capacity, color: color, engineState: engineState, windowState: windowState, occupiedCapacity: occupiedCapacity)
    }
}


class SportCar: Car {
    enum SportCarType: String {
        case sportCar = "Спорткар"
        case superCar = "Суперкар"
        case hyperCar = "Гиперкар"
    }
    
    enum EngineLocation: String {
        case rear = "Заднее расположение двигателя"
        case centre = "Центральное расположение двигателя"
    }
    
    let sportCarType: SportCarType
    let engineLocation: EngineLocation
    let maximumSpeed: UInt16
    var isSpoilerInstalled: Bool
    
    init(type: SportCarType, engineLocation: EngineLocation, maximumSpeed: UInt16, spoiler: Bool,model: CarModels, year: UInt16, capacity: UInt32, color: CarColors, engineState: EngineStates, windowState: WindowStates, occupiedCapacity: UInt32) {
        sportCarType = type
        self.engineLocation = engineLocation
        self.maximumSpeed = maximumSpeed
        isSpoilerInstalled = spoiler
        
        super.init(model: model, year: year, capacity: capacity, color: color, engineState: engineState, windowState: windowState, occupiedCapacity: occupiedCapacity)
    }
}
//func changeOccupiedCapacity(action: TrunkActions, capacity: UInt32) -> UInt32 {
//    switch action {
//        case .load:
//            guard (occupiedTrunkCapacity + capacity) <= trunkCapacity else {
//                print("Максимально возможное значение объёма для погрузки: \(trunkCapacity - occupiedTrunkCapacity). \nВозвращено значение по умолчанию: \(occupiedTrunkCapacity)")
//                return occupiedTrunkCapacity
//            }
//            occupiedTrunkCapacity += capacity
//            print("В автомобиль типа \(type.rawValue) загружено \(capacity)")
//        case .unload:
//            guard capacity <= occupiedTrunkCapacity else {
//                print("Максимально возможное значение объёма для выгрузки: \(occupiedTrunkCapacity). \nВозвращено значение по умолчанию: \(occupiedTrunkCapacity)")
//                return occupiedTrunkCapacity
//            }
//            occupiedTrunkCapacity -= capacity
//            print("Из автомобиля типа \(type.rawValue) выгружено \(capacity)")
//    }
//    print("Текущий занятый объём автомобиля типа \(type.rawValue): \(occupiedTrunkCapacity)")
//    return occupiedTrunkCapacity
//}
//
//var sedan = Car(type: .sedan, model: .audi, year: 2003, capacity: 500, color: .black, engineState: .start, windowState: .open, occupiedCapacity: 350)
//var coupe = Car(type: .coupe, model: .kia, year: 1995, capacity: 750, color: .blue, engineState: .stop, windowState: .close, occupiedCapacity: 460)
//var sports = Car(type: .sports, model: .mazda, year: 2016, capacity: 200, color: .green, engineState: .start, windowState: .close, occupiedCapacity: 50)
//var hatchback = Car(type: .hatchback, model: .hyundai, year: 1999, capacity: 900, color: .yellow, engineState: .stop, windowState: .open, occupiedCapacity: 400)
//var truck = TruckCar(truckType: .bulldozer, cargoType: .rock, semitrailerPulling: true, model: .renault, year: 2006, capacity: 30000, color: .blue, engineState: .start, windowState: .close, occupiedCapacity: 100)
//var cars = [sedan, coupe, sports, hatchback, truck]
//
//sedan.color = .blue
//coupe.isEngineStart = .start
//sedan.isEngineStart = .stop
//trunk.changeOccupiedCapacity(action: .unload, capacity: 351)
//
//func createDescription(array: Array<Car>) {
//    for element in array {
//        print("Описание автомобиля:\nТип автомобиля: \(element.type.rawValue)\nМарка автомобиля: \(element.model.rawValue)\nГод выпуска: \(element.year)\nЦвет автомобиля: \(element.color.rawValue)\nВмещаемый объём груза: \(element.trunkCapacity)\nЗанятый объём: \(element.occupiedTrunkCapacity)\n\(element.isEngineStart.rawValue)\n\(element.isWindowOpen.rawValue)\n\n")
//    }
//}
//
//createDescription(array: cars)
