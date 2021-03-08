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

//    func changeOccupiedCapacity(action: TrunkActions, capacity: UInt32) -> UInt32

    func createCarDescription()
}
