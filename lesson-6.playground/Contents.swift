import UIKit

protocol Weightable{
    var weight: Double {get}
    
}

class Car: Weightable {
    var model: String
    var manufactureYear: Int
    var amountOfDoor: Int
    var weight: Double
    
    init(model: String, manufactureYear: Int, amountOfDoor: Int, weight: Double) {
        self.model = model
        self.manufactureYear = manufactureYear
        self.amountOfDoor = amountOfDoor
        self.weight = weight
    }
}

class TrankCar: Weightable {
    var volume: Double
    var WIN: Int
    var type: String
    var weight: Double
    
    init(volume: Double, WIN: Int, type: String, weight: Double) {
        self.volume = volume
        self.WIN = WIN
        self.type = type
        self.weight = weight
    }
}

struct Queue <T: Weightable> {
    private var items: [T] = []
    mutating func push(_ element: T){
        items.append(element)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    func heavyCar (clousure: (Double) -> Bool) -> Int {
        var count = 0
        for element in items{
            if clousure(element.weight) {
                count += 1
            }
        }
        return count
    }
}

let car1 = Car(model: "Mercedes", manufactureYear: 1990, amountOfDoor: 4, weight: 1000)
let car2 = Car(model: "BMW", manufactureYear: 2000, amountOfDoor: 5, weight: 2000)
let car3 = Car(model: "Audi", manufactureYear: 2010, amountOfDoor: 6, weight: 3000)
let trank1 = TrankCar(volume: 2000.0, WIN: 1234234, type: "Trunk", weight: 3000)

var queueCar = Queue<Car>()
var queueTrankCar = Queue <TrankCar>()

queueCar.push(car1)
queueCar.push(car2)
queueCar.push(car3)

queueCar.heavyCar(clousure: <#T##(Double) -> Bool#>)

var current = {(weight: Double) -> Bool in return weight>100}
current(car1.weight)



