//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//枚举和结构体---------------
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack , Queen , King
    func simpleDesciption() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
let jack = Rank.Jack
let jackRawValue = jack.rawValue

//默认情况下，Swift 按照从 0 开始每次加 1 的方式为原始值进行赋值，不过你可以通过显式赋值进行改变。在 上面的例子中， Ace 被显式赋值为 1，并且剩下的原始值会按照顺序赋值。你也可以使用字符串或者浮点数作为 枚举的原始值。使用 rawValue 属性来访问一个枚举成员的原始值。
//使用 init?(rawValue:) 初始化构造器在原始值和枚举值之间进行转换。
if let convertedRank = Rank(rawValue: 11) {
    //log "jack"
    let threDesription = convertedRank.simpleDesciption()
}

//枚举的成员值是实际值，并不是原始值的另一种表达方法。实际上，如果没有比较有意义的原始值，你就不需要提供原始值。
//注意，有两种方式可以引用 Hearts 成员:给 hearts 常量赋值时，枚举成员 Suit.Hearts 需要用全名来引用，因 为常量没有显式指定类型。在 switch 里，枚举成员使用缩写 .Hearts 来引用，因为 self 的值已经知道是一个 it 。已知变量类型的情况下你可以使用缩写。
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
            case .Spades:
                return "spades"
            case .Hearts:
                return "hearts"
            case .Diamonds:
                return "diamonds"
            case .Clubs:
                return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

//
enum ServerResponse {
    case Result(String, String)
    case Failure(String)
}
let success = ServerResponse.Result("6.00am", "9.00pm")
let failure = ServerResponse.Failure("Out of cheese")
switch success {
case let .Result(sunrise,sunset):
    let serverResonse = "\(sunrise) \(sunset)"
case let .Failure(message):
    let serverResonse = "\(message)"
}

//
struct Card {
    var rank : Rank
    var suit : Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDesciption()), \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = (threeOfSpades.simpleDescription())



//枚举和结构体---------------



//: [Next](@next)
