//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        //基本数据 --------------------
        //let 声明常量，var 声明变量
        
        let width = 1
        let height = 2
        let string = "今天 是不是"
       
        //声明一个类型为 String ，名字为 welcomeMessage 的变量。
        var welcomeMessage: String
        welcomeMessage = "Hello"
        
        //你可以在一行中定义多个同样类型的变量，用逗号分割，并在最后一个变量名之后添加类型标注:
        var red, green, blue: Double
        
        //把整形转字符串 两种方法
        let totle = string + String(width)
        let apples = "i like \(width + height) zz"
        
        //数组
        var shoppingList = ["a","b","c",]
        shoppingList[1] = "B"
        print(shoppingList)
        
        //空数组
        let emptyArray = [String]()
        //空字典
        let emptyDic = [String:Float]()

        //字典
        var occupations = ["key1":"a","key2":"b","key3":"c",]
        occupations["key4"] = "d"
        print(occupations)
        
        //循环语句 for
        let individualScores = [2,3,1,4,6,38]
        var num = 0
        for score in individualScores {
            num += 1
            print(num,"=",score)
        }
        
        let interestingNumbers = ["Prime" : [2,3,1,4,6],
                                "Fibonacci" : [1,1,3,5,2,22],
                                "Square" : [2,5,11,55],
                            ]
        
        //打印key value
        for (kind,numbers) in interestingNumbers {
            print(kind,numbers)
        }
        
        //switch 支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等。
        //运行 switch 中匹配到的子句之后，程序会退出 switch 语句，并不会继续向下运行，所以不需要在每个子句结尾 写 break 。
        let vegetable = "red pepper"
        switch vegetable {
        case "celery":
            print("celery")
        case "cucumber","watercress":
            print("")
        case let x where x.hasSuffix("pepper") :
            print("is it a spicy \(x)?")
        default:
            print("other")
        }
        
        //while
        var n = 2
        while n < 50 {
            n = n*2
        }
        print(n)
        
        //repeat while
        var m = 2
        repeat {
            m = m*2
        }while m < 50
        print(m)
        
        //循环中使用 ..< 来表示范围,使用 ..< 创建的范围不包含上界，如果想包含的话需要使用 ... 。
        var total = 0
        for i in 0..<4 {
            total += i
        }
        print(total)
        //基本数据 --------------------

        //在同一行内写多条独立的语句时 使用分号；
        let cat = "?"; print(cat) // 输出 "?"

        //元组
        // http404Error 的类型是 (Int, String)，值是 (404, "Not Found")
        let http404Error = (404,"Not Found")
        let (statusCode,statusMessage) = http404Error
        print("The status code is \(statusCode)")
        print("The status message is \(statusMessage)")
        //如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线( _ )标记:
        let (justTheStatusCode, _) = http404Error
        //此外，你还可以通过下标来访问元组中的单个元素，下标从零开始:
        print(http404Error.0,http404Error.1)
        
        
        
        
        
        
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Swift"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
