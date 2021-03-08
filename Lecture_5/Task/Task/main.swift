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

    func createShortCarDescription()
}

extension Car {
    mutating func changeOccupiedCapacity(action: TrunkActions, capacity: UInt32) -> UInt32 {
        switch action {
            case .load:
                guard (occupiedTrunkCapacity + capacity) <= trunkCapacity else {
                    print("Максимально возможное значение объёма для погрузки: \(trunkCapacity - occupiedTrunkCapacity). \nВозвращено значение по умолчанию: \(occupiedTrunkCapacity)\n")
                    return occupiedTrunkCapacity
                }
                occupiedTrunkCapacity += capacity
                print("В автомобиль загружено \(capacity)")
            case .unload:
                guard capacity <= occupiedTrunkCapacity else {
                    print("Максимально возможное значение объёма для выгрузки: \(occupiedTrunkCapacity). \nВозвращено значение по умолчанию: \(occupiedTrunkCapacity)\n")
                    return occupiedTrunkCapacity
                }
                occupiedTrunkCapacity -= capacity
                print("Из автомобиля выгружено \(capacity)\n")
        }
        print("Текущий занятый объём автомобиля: \(occupiedTrunkCapacity)\n")
        return occupiedTrunkCapacity
    }
    
    mutating func changeCarColor(newColor: CarColors) {
        print("Цвет автомобиля изменён с \(color.rawValue) на \(newColor.rawValue)\n")
        color = newColor
    }
    
    mutating func changeEngiteState (newEngineState: EngineStates) {
        print("\(newEngineState.rawValue)\n")
        isEngineStart = newEngineState
    }
    
    mutating func changeWindowState (newWindowState: WindowStates) {
        print("\(newWindowState.rawValue)\n")
        isWindowOpen = newWindowState
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

    var model: CarModels
    var year: UInt16
    var trunkCapacity: UInt32
    var color: CarColors
    var isEngineStart: EngineStates
    var isWindowOpen: WindowStates
    var occupiedTrunkCapacity: UInt32
    let truckType: TruckCarTypes
    let cargoType: CargoTypes
    var semitrailer: IsSemitrailerPulling

    init(truckType: TruckCarTypes, cargoType: CargoTypes, semitrailer: IsSemitrailerPulling, model: CarModels, year: UInt16, trunkCapacity: UInt32, color: CarColors, engineState: EngineStates, windowState: WindowStates, occupiedCapacity: UInt32) {
        self.truckType = truckType
        self.cargoType = cargoType
        self.semitrailer = semitrailer
        self.model = model
        self.year = year
        self.trunkCapacity = trunkCapacity
        self.color = color
        isEngineStart = engineState
        isWindowOpen = windowState
        occupiedTrunkCapacity = occupiedCapacity
    }

    func createShortCarDescription() {
        print("\(truckType.rawValue) \(model.rawValue)")
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

    var model: CarModels
    var year: UInt16
    var trunkCapacity: UInt32
    var color: CarColors
    var isEngineStart: EngineStates
    var isWindowOpen: WindowStates
    var occupiedTrunkCapacity: UInt32
    let sportCarType: SportCarType
    let engineLocation: EngineLocation
    let maximumSpeed: UInt16
    var spoiler: IsSpoilerInstalled

    init(type: SportCarType, engineLocation: EngineLocation, maximumSpeed: UInt16, spoiler: IsSpoilerInstalled,model: CarModels, year: UInt16, trunkCapacity: UInt32, color: CarColors, engineState: EngineStates, windowState: WindowStates, occupiedCapacity: UInt32) {
        sportCarType = type
        self.engineLocation = engineLocation
        self.maximumSpeed = maximumSpeed
        self.spoiler = spoiler
        self.model = model
        self.year = year
        self.trunkCapacity = trunkCapacity
        self.color = color
        isEngineStart = engineState
        isWindowOpen = windowState
        occupiedTrunkCapacity = occupiedCapacity
    }

    func createShortCarDescription() {
        print("\(sportCarType.rawValue) \(model.rawValue)")
    }
}
