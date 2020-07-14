import UIKit


protocol Car {
    var model: String{get set}
    func actionDoor()
    func actionWindow()
    func launchEngine()
}

enum OpenClose{
        case open, close
    }

enum OnOff{
        case on, off
    }

extension Car {
    func actionDoor(_ condition: OpenClose){
        switch condition{
        case .close:
            print("Машина закрыта")
        case .open:
            print("Машина открыта")
        }
    }
    func actionWindow(_ condition: OpenClose){
        switch condition{
        case .close:
            print("Окна машины закрыты")
        case .open:
            print("Окна машины открыты")
        }
    }
    func launchEngine(_ condition: OnOff){
           switch condition{
           case .on:
               print("Машина заведена")
           case .off:
               print("Машина заглушена")
           }
       }
}

class SportCar: Car{
    var hatchState: OpenClose = .close
    
    func actionHatch(_ condition: OpenClose){
        switch condition{
        case .close: print("Крыша закрыта")
        case .open: print("Крыша открыта")
        }
    }
}

class TunkCar: Car{
    func openTunk(){
        print("tunk is open")
    }
    func closeTunk(){
        print("tunk is closed")
    }
}

extension SportCar: CustomStringConvertible{
    var description: String{
        return "Ваша крыша/(hatchState)"
    }
}

extension TunkCar: CustomStringConvertible{
    var description: String{
        return model
    }
}
 
var sportCar1 = SportCar()

var tunkCar1 = TunkCar()

/*protocol Car {
    var engineState: OnOff { get set }
    var doorState: OpenClose{get set}
    var windowState: OpenClose{get set}
    mutating func openDoor()
    mutating func closeDoor()
    mutating func openWindow()
    mutating func closeWindow()
    mutating func startEngine()
    mutating func stopEngine()
}

enum OpenClose{
    case open, close
}

enum OnOff{
    case on, off
}
extension Car{
    mutating func openDoor(){
        doorState = .open
    }
    mutating func closeDoor(){
        doorState = .close
    }
    mutating func openWindow(){
        windowState = .open
    }
    mutating func closeWindow(){
        windowState = .close
    }
    mutating func startEngine(){
        engineState = .on
    }
    mutating func stopEngine(){
        engineState = .off
    }
}

class SportCar: Car {
    var
}*/
