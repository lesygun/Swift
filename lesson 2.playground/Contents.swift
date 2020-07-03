import UIKit

// 1.    Написать функцию, которая определяет, четное число или нет.
var a = 10

func even() {
    if a%2==0 {
        print("Число четное")
    }
    else {
        print("Число нечетное")
    }
}

even()

// 2.    Написать функцию, которая определяет, делится ли число без остатка на 3.
var b = 18

func third() {
    if b%3==0 {
        print("Число ",b, " делится на 3 без остатка")
    }
    else {
        print ("Остаток от деления числа ",b," на 3 равен: ", b%3)
    }
}
third()

// 3.    Создать возрастающий массив из 100 чисел
var increasingArray = [Int]()

for i in 1...100{
    increasingArray.append(i)
}

//4.    Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for items in increasingArray{
    if items%2==0 {
        increasingArray.remove(at: increasingArray.firstIndex(of: items)!) // Почему просит поставить здесь восклицательный знак
        continue
    }
    if items%3 != 0 {
        increasingArray.remove(at: increasingArray.firstIndex(of: items)!)
    }
}
print(increasingArray)

//5.Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов
var numbersFibonachi = [0,1]
var number: Int = 0
func createFibonachiNumbers() {
    for _ in 1...100 {
        number = numbersFibonachi.last! + numbersFibonachi[numbersFibonachi.count-2] // Почему здесь опять требует вопросительные или восклицательные знаки?
        numbersFibonachi.append(number)
    }
}



