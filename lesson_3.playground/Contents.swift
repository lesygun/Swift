import UIKit

enum Engine: String {
    case on = "Двигатель запущен"
    case off = "Двигатель заглушен"
}

enum WindowsState: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}


struct PassengerCar {
    var model: String
    var manufactureYear: Int
    var trankVolume: Double
    var launchEngine: Engine{
        willSet {
            if newValue == .on {
                print("Двигатель сейчас запустится")
            } else {
                print("Двигатель сейчас будет выключен")
            }
        }
    }
    var window: WindowsState {
        willSet {
            if newValue == .open {
                print("Окна сейчас откроются")
            } else {
                print("Окна сейчас закроются")
            }
        }
    }
    var loadTrankVolume: Double
    
    mutating func loadCurrentCargo (cargo: Double) {
        loadTrankVolume += cargo
    }
    mutating func uploadCurrentCargo (cargo: Double) {
        loadTrankVolume += cargo
    }
    
}
struct CargoCar {
    var model: String
    var manufactureYear: Int
    var bodyVolume: Double
    var launchEngine: Engine{
        willSet {
            if newValue == .on {
                print("Двигатель сейчас запустится")
            } else {
                print("Двигатель сейчас будет выключен")
            }
        }
    }
    var window: WindowsState {
        willSet {
            if newValue == .open {
                print("Окна сейчас откроются")
            } else {
                print("Окна сейчас закроются")
            }
        }
    }
    var loadBodyVolume: Double
    
    mutating func loadCurrentCargo (cargo: Double) {
        loadBodyVolume += cargo
    }
    mutating func uploadCurrentCargo (cargo: Double) {
        loadBodyVolume += cargo
    }
    
}


var honda = PassengerCar(model: "Honda", manufactureYear: 2005, trankVolume: 500.0, launchEngine: .off, window: .close, loadTrankVolume: 0)

honda.launchEngine = .on
honda.window = .open
honda.loadCurrentCargo(cargo: 300)
print(honda.loadTrankVolume)

var zil = CargoCar(model: "ЗИЛ", manufactureYear: 1990, bodyVolume: 2000.0, launchEngine: .off, window: .close, loadBodyVolume: 0.0)

zil.launchEngine = .on
zil.window = .open
zil.loadCurrentCargo(cargo: 1000)
zil.uploadCurrentCargo(cargo: 200)
print(zil.loadBodyVolume)





