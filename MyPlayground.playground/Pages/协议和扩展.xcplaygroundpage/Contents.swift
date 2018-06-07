//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//协议和扩展------------------

//声明协议
protocol ExampleProtocol {
    var simpleDescription : String {get}
    mutating func adjust()
}

//类、枚举和结构体都可以实现协议。
//注意声明 SimpleStructure 时候 mutating 关键字用来标记一个会修改结构体的方法。 SimpleClass 的声明不需要 标记任何方法，因为类中的方法通常可以修改类属性(类的性质)。
class SimpleClass : ExampleProtocol {
    //初始化
    var simpleDescription : String = "a very simple class"
    var anotherProperty : Int = 8900
    func adjust() {
        //字符串拼接
        simpleDescription += " now 100% adjusted"
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure : ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " adjusted"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//扩展 extension
//使用 extension 来为现有的类型添加功能，比如新的方法和计算属性。你可以使用扩展在别处修改定义，甚至是 从外部库或者框架引入的一个类型，使得这个类型遵循某个协议。
extension Int : ExampleProtocol {
    var simpleDescription : String {
        return "the number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

//
let protocolValue : ExampleProtocol = a
print(protocolValue.simpleDescription)
//print(protocolValue.anotherProperty)

//错误处理 采用 Error 协议的类型来表示错误。
enum PrinterError : Error {
    case OutOfPager
    case NoToner
    case OnFire
}

//使用 throw 来抛出一个错误并使用 throws 来表示一个可以抛出错误的函数。如果在函数中抛出一个错误，这个函 数会立刻返回并且调用该函数的代码会进行错误处理。
func send(job : Int , toPrinter printerName : String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.NoToner
    }
    return "Job sent"
}

//有多种方式可以用来进行错误处理。一种方式是使用 do-catch 。在 do 代码块中，使用 try 来标记可以抛出错误 的代码。在 catch 代码块中，除非你另外命名，否则错误会自动命名为 error 。
do {
    let printerResponse = try send(job: 1030, toPrinter: "Bin Sheng")
    print(printerResponse)
} catch {
    print(error)
}

//可以使用多个 catch 块来处理特定的错误。参照 switch 中的 case 风格来写 catch 。
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.OnFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

//另一种处理错误的方式使用 try? 将结果转换为可选的。如果函数抛出错误，该错误会被抛弃并且结果为 ni l 。否则的话，结果会是一个包含函数返回值的可选值。
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

//使用 defer 代码块来表示在函数返回前，函数中最后执行的代码。无论函数是否会抛出错误，这段代码都将执 行。使用 defer ，可以把函数调用之初就要执行的代码和函数调用结束时的扫尾代码写在一起，虽然这两者的执 行时机截然不同。
var fridgeIsOpen = false
let fridgeContent = ["milk","eggs","leftovers",]
func fridgeContains(_ food : String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    //数组中是否包含food字符串
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)



//协议和扩展------------------

//: [Next](@next)
