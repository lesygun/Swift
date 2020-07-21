import UIKit

//1.    Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызовы и обработать результат метода при помощи конструкции if let или guard let.
enum ListOfError: Error{
    case notEnoughMoney(moneyNeed: Int)
    case dontHaveSuchProduct
    case thisProductIsGone
}

struct Food {
    var name: String
    var costs: Int
    var count: Int
}
class Delivery {
    var product = ["Borsch": Food(name: "Borsch", costs: 300, count: 1), "Schnitzel": Food(name: "Schnitzel", costs: 400, count: 3), "Dumplings": Food(name: "Dumplings", costs: 350, count: 0), "Juliene": Food(name: "Juliene", costs: 500, count: 2)]
    
    var paid = 0
    
    func offer (_ foodName: String) -> (String?, ListOfError?) {
        guard let food = product[foodName] else{
            return (nil, ListOfError.dontHaveSuchProduct)
        }
        guard food.count > 0 else {
            return (nil, ListOfError.thisProductIsGone)
        }
        guard food.costs<=paid else{
            return (nil, ListOfError.notEnoughMoney(moneyNeed: food.costs - paid))
        }
        
        paid -= food.costs
        var newFood = food
        newFood.count -= 1
        product[foodName] = newFood
        
        return (newFood.name, nil)
    }
}

var delivery1 = Delivery()
delivery1.paid = 350
delivery1.offer("Snickers")
print(delivery1.offer("Juliene"))
delivery1.offer("Borsch")
print(delivery1.offer("Dumplings"))

// 2.    Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws функций. Вызовите их и обработайте результат вызова при помощи конструкции try/ catch

enum SomeErrors: Error{
    case notEnoughMoney(moneyNeeded: Int)
    case dontHaveSuchProduct
    case thisProductIsGone
}

struct FoodName {
    var name: String
    var costs: Int
    var count: Int
}
class DeliveryNumber {
    var product = ["Borsch": FoodName(name: "Borsch", costs: 300, count: 1), "Schnitzel": FoodName(name: "Schnitzel", costs: 400, count: 3), "Dumplings": FoodName(name: "Dumplings", costs: 350, count: 0), "Juliene": FoodName(name: "Juliene", costs: 500, count: 2)]
    
    var pay = 0
    
    func customOffer (_ foodName: String) throws -> String {
        guard let food = product[foodName] else{
            throw SomeErrors.dontHaveSuchProduct
        }
        guard food.count > 0 else {
            throw SomeErrors.thisProductIsGone
        }
        guard food.costs<=pay else{
            throw SomeErrors.notEnoughMoney(moneyNeeded: food.costs - pay)
        }
        
        pay -= food.costs
        var newFood = food
        newFood.count -= 1
        product[foodName] = newFood
        
        return (newFood.name)
    }
}

let delivery2 = DeliveryNumber()
delivery2.pay = 400

do {
    try delivery2.customOffer ("Borsch")
} catch SomeErrors.dontHaveSuchProduct{
    print("Нет такого товара на складе")
} catch SomeErrors.thisProductIsGone{
    print("Товар закончился на складе")
} catch SomeErrors.notEnoughMoney(let moneyNeeded){
    print("Для покупки товара недостаточно /(moneyNeeded) денег")
} catch let error {
    print (error.localizedDescription)
}
