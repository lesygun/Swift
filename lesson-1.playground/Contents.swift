import UIKit
// Домашнее задание первого урока
// №1 - решение квадратного уравнения: 4x^2 + 7x + 3 = 0;
var a: Double = 4
var b: Double = 7
var c: Double = 3

let discriminant = (b*b)-(4*a*c)

let x1 = (-b+sqrt(discriminant))/(2*a)

let x2 = (-b-sqrt(discriminant))/(2*a)

print("первый корень: " + String(x1), "; второй корень: "+String(x2))
//№2 - по катетам найти площадь, периметр и гипотенузу треугольника
var katet1: Double = 5
var katet2: Double = 6

let hypotenuse = sqrt((katet1*katet1) + (katet2*katet2))

let perimeter = katet2+katet1+hypotenuse

let area = katet1*katet2/2

print("гипотенуза треугольника: " + String(hypotenuse) + "; периметр равен: " + String(perimeter) + "; площадь равна: " + String(area))

//№3 Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
var amount: Double = 10000
var percent: Double = 7
var years: Int = 0

while years<5{
    years+=1
    amount = amount + amount/100*7
}

print(amount)
