import Foundation

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

protocol Car {
    var model: CarModels { get }
    var year: UInt16 { get }
    var trunkCapacity: UInt32 { get }
    var color: CarColors { get set }
    var isEngineStart: EngineStates { get set }
    var isWindowOpen: WindowStates { get set }
    var occupiedTrunkCapacity: UInt32 { get set }

    func createCarDescription()
}

extension Car {
    mutating func changeOccupiedCapacity(action: TrunkActions, capacity: UInt32) -> UInt32 {
        switch action {
            case .load:
                guard (occupiedTrunkCapacity + capacity) <= trunkCapacity else {
                    print("Максимально возможное значение объёма для погрузки: \(trunkCapacity - occupiedTrunkCapacity). \nВозвращено значение по умолчанию: \(occupiedTrunkCapacity)")
                    return occupiedTrunkCapacity
                }
                occupiedTrunkCapacity += capacity
                print("В автомобиль загружено \(capacity)")
            case .unload:
                guard capacity <= occupiedTrunkCapacity else {
                    print("Максимально возможное значение объёма для выгрузки: \(occupiedTrunkCapacity). \nВозвращено значение по умолчанию: \(occupiedTrunkCapacity)")
                    return occupiedTrunkCapacity
                }
                occupiedTrunkCapacity -= capacity
                print("Из автомобиля выгружено \(capacity)")
        }
        print("Текущий занятый объём автомобиля: \(occupiedTrunkCapacity)")
        return occupiedTrunkCapacity
    }
    
    mutating func changeCarColor(newColor: CarColors) {
        print("Цвет автомобиля изменён с \(color) на \(newColor.rawValue)")
        color = newColor
    }
    
    mutating func changeEngiteState (newEngineState: EngineStates) {
        print(newEngineState.rawValue)
        isEngineStart = newEngineState
    }
    
    mutating func changeWindowState (newWindowState: WindowStates) {
        print(newWindowState.rawValue)
        isWindowOpen = newWindowState
    }
}


