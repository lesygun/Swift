import UIKit

enum Engine: String {
    case on = "Двигатель запущен"
    case off = "Двигатель заглушен"
}

enum WindowsState: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}

enum CurrentCargo {
    case load (_ cargo: Double)
    case upload (_ cargo: Double)
}

class Car {
    var model: String
    var manufactureYear: Int
    var trankVolume: Double
    var currentTrankVolume: Double = 0.0
    var window: WindowsState = .close
    var launchEngine: Engine = .off{
        willSet {
            if newValue == .on {
                print("Двигатель сейчас запустится")
            } else {
                print("Двигатель сейчас будет выключен")
            }
        }
    }
    
    func doWindow (stats: WindowsState) {
        switch stats {
        case .close:
            self.window = .close
            print("windows is closed")
        case .open:
            self.window = .open
            print("windows is open")
        }
    }
    
    func doCargo (cargo: CurrentCargo) {
        switch cargo {
        case let .load(cargo):
            currentTrankVolume += cargo
            print("Ваш багажник заполнена на \(currentTrankVolume) из \(trankVolume).")
        case let .upload(cargo):
            currentTrankVolume -= cargo
            print("Ваш багажник заполнена на \(currentTrankVolume) из \(trankVolume).")
        }
            
    }
    
    init (model: String, manufactureYear: Int, trankVolume: Double){
    self.model = model
    self.manufactureYear = manufactureYear
    self.trankVolume = trankVolume
    }
}

class TrunkCar: Car{
    enum AWD{
        case on, off
    }
    
    var wheels: Int
    var color: UIColor
    var numberOfGears: Int
    var wheelsDrive: AWD = .off
    
    override func doCargo(cargo: CurrentCargo) {
        switch cargo {
        case let .load(cargo):
            currentTrankVolume += cargo
            print("Ваш кузов заполнена на \(currentTrankVolume) из \(trankVolume).")
        case let .upload(cargo):
            currentTrankVolume -= cargo
            print("Ваш кузов заполнена на \(currentTrankVolume) из \(trankVolume).")
        }
    }
    
    func actionAWD(awd: AWD){
        switch awd{
        case .off:
            print("Полный привод выключен")
        case .on:
            print("Полный привод включен")
        }
    }
    
    init(model: String, manufactureYear: Int, trankVolume: Double, wheels: Int, color: UIColor, numberOfGears: Int) {
        self.wheels=wheels
        self.color=color
        self.numberOfGears=numberOfGears
        super.init(model: model, manufactureYear: manufactureYear, trankVolume: trankVolume)
    }
}

class SportCar: Car{
    enum HatchState{
        case open, close
    }
    
    var maxSpeed: Int
    var doorCount: Int
    var wheelSize: Double
    var hatchState: HatchState = .close
    
    override func doCargo(cargo: CurrentCargo) {
        print("В ваш багажник поместиться только обувь для гольфа")
    }
    
    func actionHatch(hatchStat: HatchState){
        switch hatchStat{
        case .close:
            self.hatchState = .close
            print("Ваш люк закрыт")
        case .open:
            self.hatchState = .open
            print("Ваш люк открыт")
        }
        
    }
    
    init(model: String, manufactureYear: Int, trankVolume: Double, maxSpeed: Int, doorCount: Int, wheelSize: Double) {
        self.maxSpeed = maxSpeed
        self.doorCount = doorCount
        self.wheelSize = wheelSize
        super.init (model: model, manufactureYear: manufactureYear, trankVolume: trankVolume)
    }
}

var car1 = Car(model: "Mercedes", manufactureYear: 2012, trankVolume: 2000.0)

car1.launchEngine = .on
car1.doCargo(cargo: .load(1000))
car1.doWindow(stats: .open)

var trunk1 = TrunkCar(model: "Kamaz", manufactureYear: 2005, trankVolume: 10000.0, wheels: 8, color: .green, numberOfGears: 10)

trunk1.actionAWD(awd: .on)
trunk1.doCargo(cargo: .load(5000))
trunk1.launchEngine = .on

var sportcar1 = SportCar(model: "Lambo", manufactureYear: 2019, trankVolume: 10, maxSpeed: 300, doorCount: 2, wheelSize: 24.5)

sportcar1.doCargo(cargo: .load(200))
sportcar1.actionHatch(hatchStat: .open)
sportcar1.doWindow(stats: .open)







