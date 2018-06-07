//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//函数------------------------

//1.使用 func 来声明一个函数，使用名字和参数来调用函数。使用 -> 来指定函数返回值的类型
func greet (person : String, day: String) -> String{
    return "Hello \(person),today id \(day)"
}
print(greet(person: "Bob", day: "Tuesday"))

//2.默认情况下，函数使用它们的参数名称作为它们参数的标签，在参数名称前可以自定义参数标签，或者使用 _ 表示不使用参数标签。
func luck (_ person : String , day :String) -> String{
    return "Hello \(person) ,today is \(day)"
}
print(luck("John", day: "Wednesday"))

//3.使用元组来让一个函数返回多个值。该元组的元素可以用名称或数字来表示。
func calculateStatics (scores : [Int]) -> (min: Int, max:Int ,sum:Int){
    print(scores)
    var a = scores[0]
    var b = scores[1]
    var c = scores[2]
    return (a , b , c)
}
let statistics = calculateStatics(scores: [5,233,5236,898,11])
print(statistics.min,statistics.max,statistics.sum)

//4.函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式
func sumOf (numbers: Int...){
    print(numbers)
}
sumOf(numbers:42,22,4,66)

//5.函数key嵌套，
func returnFiften() -> Int{
    var y = 10
    func add(){
        y += 5
    }
    add()
    return y
}
returnFiften()

//6.函数是第一等类型，这意味着函数可以作为另一个函数的返回值。
func makeIncrementer() -> ((Int) -> Int){
    func addOne(number : Int) -> Int{
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//7.函数也可以当做参数传入另一个函数。
//  condition : (Int) -> Bool
func hasAnyMatches(list : [Int] , condition : (Int) -> Bool) -> Bool{
    for item in list{
        //函数condition返回bool
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number : Int) -> Bool{
    print(number)
    return number < 10
}
var numbers = [20,19,3,66]
hasAnyMatches(list: numbers, condition: lessThanTen)

//8.用 {} 来创建 一个匿名闭包
numbers.map({
    (tag : Int) -> Int in
    let result = 3*tag
    return result
})
print(numbers)

//9.有很多种创建更简洁的闭包的方法。如果一个闭包的类型已知，比如作为一个回调函数，你可以忽略参数的类型和返回值。单个语句闭包会把它语句的值当做结果返回。
let mappedNumbers = numbers.map({
    number in 3*number
})
print(mappedNumbers)

//10.你可以通过参数位置而不是参数名字来引用参数——这个方法在非常短的闭包中非常有用。当一个闭包作为最后一个参数传给一个函数的时候，它可以直接跟在括号后面。当一个闭包是传给函数的唯一参数，你可以完全忽略括号。
let sortedNumbers = numbers.sort{ $0 > $1}
print(sortedNumbers)


//函数------------------------


//: [Next](@next)
