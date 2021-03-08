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
    
    func changeOccupiedCapacity(action: TrunkActions, capacity: UInt32) -> UInt32 {
        return capacity
    }
    
    func createCarDescription() {
        
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
    
    enum IsSemitrailerPulling: String {
        case installed = "Установлен"
        case notInstalled = "Не установлен"
    }
    
    let truckType: TruckCarTypes
    let cargoType: CargoTypes
    var semitrailer: IsSemitrailerPulling
    
    init(truckType: TruckCarTypes, cargoType: CargoTypes, semitrailer: IsSemitrailerPulling, model: CarModels, year: UInt16, capacity: UInt32, color: CarColors, engineState: EngineStates, windowState: WindowStates, occupiedCapacity: UInt32) {
        self.truckType = truckType
        self.cargoType = cargoType
        self.semitrailer = semitrailer
        
        super.init(model: model, year: year, capacity: capacity, color: color, engineState: engineState, windowState: windowState, occupiedCapacity: occupiedCapacity)
    }
    
    override func changeOccupiedCapacity(action: TrunkActions, capacity: UInt32) -> UInt32 {
        switch action {
            case .load:
                guard (occupiedTrunkCapacity + capacity) <= trunkCapacity else {
                    print("Максимально возможное значение объёма для погрузки: \(trunkCapacity - occupiedTrunkCapacity). \nВозвращено значение по умолчанию: \(occupiedTrunkCapacity)")
                    return occupiedTrunkCapacity
                }
                occupiedTrunkCapacity += capacity
                print("В автомобиль типа \(truckType.rawValue) загружено \(capacity)")
            case .unload:
                guard capacity <= occupiedTrunkCapacity else {
                    print("Максимально возможное значение объёма для выгрузки: \(occupiedTrunkCapacity). \nВозвращено значение по умолчанию: \(occupiedTrunkCapacity)")
                    return occupiedTrunkCapacity
                }
                occupiedTrunkCapacity -= capacity
                print("Из автомобиля типа \(truckType.rawValue) выгружено \(capacity)")
        }
        print("Текущий занятый объём автомобиля типа \(truckType.rawValue): \(occupiedTrunkCapacity)")
        return occupiedTrunkCapacity
    }
    
    override func createCarDescription() {
        print("Описание автомобиля:\nТип грузового автомобиля: \(truckType.rawValue)\nМарка автомобиля: \(model.rawValue)\nГод выпуска: \(year)\nЦвет автомобиля: \(color.rawValue)\nПеревозимый груз: \(cargoType.rawValue)\nИмеется полуприцеп: \(semitrailer.rawValue)\nВмещаемый объём груза: \(trunkCapacity)\nЗанятый объём: \(occupiedTrunkCapacity)\n\(isEngineStart.rawValue)\n\(isWindowOpen.rawValue)\n\n")
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
    
    enum IsSpoilerInstalled: String {
        case installed = "Установлен"
        case notInstalled = "Не установлен"
    }
    
    let sportCarType: SportCarType
    let engineLocation: EngineLocation
    let maximumSpeed: UInt16
    var spoiler: IsSpoilerInstalled
    
    init(type: SportCarType, engineLocation: EngineLocation, maximumSpeed: UInt16, spoiler: IsSpoilerInstalled,model: CarModels, year: UInt16, capacity: UInt32, color: CarColors, engineState: EngineStates, windowState: WindowStates, occupiedCapacity: UInt32) {
        sportCarType = type
        self.engineLocation = engineLocation
        self.maximumSpeed = maximumSpeed
        self.spoiler = spoiler
        
        super.init(model: model, year: year, capacity: capacity, color: color, engineState: engineState, windowState: windowState, occupiedCapacity: occupiedCapacity)
    }
    
    override func changeOccupiedCapacity(action: TrunkActions, capacity: UInt32) -> UInt32 {
        switch action {
            case .load:
                guard (occupiedTrunkCapacity + capacity) <= trunkCapacity else {
                    print("Максимально возможное значение объёма для погрузки: \(trunkCapacity - occupiedTrunkCapacity). \nВозвращено значение по умолчанию: \(occupiedTrunkCapacity)")
                    return occupiedTrunkCapacity
                }
                occupiedTrunkCapacity += capacity
                print("В автомобиль типа \(sportCarType.rawValue) загружено \(capacity)")
            case .unload:
                guard capacity <= occupiedTrunkCapacity else {
                    print("Максимально возможное значение объёма для выгрузки: \(occupiedTrunkCapacity). \nВозвращено значение по умолчанию: \(occupiedTrunkCapacity)")
                    return occupiedTrunkCapacity
                }
                occupiedTrunkCapacity -= capacity
                print("Из автомобиля типа \(sportCarType.rawValue) выгружено \(capacity)")
        }
        print("Текущий занятый объём автомобиля типа \(sportCarType.rawValue): \(occupiedTrunkCapacity)")
        return occupiedTrunkCapacity
    }
    
    override func createCarDescription() {
        print("Описание автомобиля:\nТип спортивного автомобиля: \(sportCarType.rawValue)\nМарка автомобиля: \(model.rawValue)\nГод выпуска: \(year)\nЦвет автомобиля: \(color.rawValue)\nРасположение двигателя: \(engineLocation.rawValue)\nМаксимальная скорость: \(maximumSpeed)\nУстановлен спойлер: \(spoiler.rawValue)\nВмещаемый объём груза: \(trunkCapacity)\nЗанятый объём: \(occupiedTrunkCapacity)\n\(isEngineStart.rawValue)\n\(isWindowOpen.rawValue)\n\n")
    }
}

var truck1 = TruckCar(truckType: .bulldozer, cargoType: .rock, semitrailer: .installed, model: .renault, year: 2006, capacity: 30000, color: .blue, engineState: .start, windowState: .close, occupiedCapacity: 8000)
var truck2 = TruckCar(truckType: .fuel, cargoType: .fuel, semitrailer: .installed, model: .ford, year: 1999, capacity: 20000, color: .black, engineState: .stop, windowState: .open, occupiedCapacity: 0)
var truck3 = TruckCar(truckType: .panel, cargoType: .flower, semitrailer: .notInstalled, model: .renault, year: 2015, capacity: 5000, color: .red, engineState: .start, windowState: .close, occupiedCapacity: 1500)

truck3.createCarDescription()
truck3.color = .green
truck1.changeOccupiedCapacity(action: .unload, capacity: 40000)
truck2.changeOccupiedCapacity(action: .load, capacity: 14030)
truck3.semitrailer = .installed

var sportCar1 = SportCar(type: .sportCar, engineLocation: .centre, maximumSpeed: 250, spoiler: .notInstalled, model: .audi, year: 2018, capacity: 300, color: .yellow, engineState: .stop, windowState: .close, occupiedCapacity: 50)
var sportCar2 = SportCar(type: .superCar, engineLocation: .rear, maximumSpeed: 300, spoiler: .installed, model: .mazda, year: 2020, capacity: 200, color: .black, engineState: .start, windowState: .open, occupiedCapacity: 0)
var sportCar3 = SportCar(type: .hyperCar, engineLocation: .centre, maximumSpeed: 370, spoiler: .installed, model: .bmw, year: 2019, capacity: 50, color: .yellow, engineState: .stop, windowState: .open, occupiedCapacity: 10)

sportCar3.isEngineStart = .start
sportCar2.isWindowOpen = .close
sportCar1.spoiler = .installed
sportCar3.changeOccupiedCapacity(action: .unload, capacity: 10)

var carsList = [truck1, truck2, truck3, sportCar1, sportCar2, sportCar3]

func createDescription(array: Array<Car>) {
    for element in array {
        element.createCarDescription()
    }
}

createDescription(array: carsList)
