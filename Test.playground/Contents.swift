import UIKit
//
//var greeting = "this is a quotation \tHello, playground\\"
//
//var a = 5
//var b = 8
//
//let c = a
//
//a = b
//b = c
//
//print("a is \(a)\nb is \(b)")
//
//let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
//
////The number of letters in alphabet equals 26
//let firstLetter = alphabet[Int.random(in: 0...25)]
//let secondLetter = alphabet[Int.random(in: 0...25)]
//let thirdLetter = alphabet.randomElement()
//let fourthLetter = alphabet.randomElement()
//let fifthLetter = alphabet.randomElement()
//let sixthLetter = alphabet.randomElement()
//
//let password = firstLetter + secondLetter
////+ secondLetter + thirdLetter + fourthLetter + fifthLetter + sixthLetter
//
//print(password)
//
//
//func sayHello() {
//    for _ in 1...4 {
//        print("Hello")
//    }
//}
//
//sayHello()
//
//func loveCalculate() {
//    var loveScore = Int.random(in: 0...100)
//    print(loveScore)
//    loveScore = 80
//    switch loveScore {
//    case 81...100:
//        print("You love each other like Kanye loves Kanye")
//    case 41...80:
//        print("You go together like Coke and Mentos")
//    default:
//        print("You'll be forever alone")
//    }
//}
//
//loveCalculate()
//
//
//func isLeap(year: Int) {
//    if year % 4 == 0 && year % 100 != 0 || year % 400 == 0{
//        print("YES")
//    } else {
//        print("NO")
//    }
//}
//
//isLeap(year: 2000)
//
//
//var studentsAndScores = ["Amy": 88, "James": 55, "Helen": 99]
//
//func highestScore(scores: [String: Int]) {
//
//    //Write your code here.
//    var maximumScore = studentsAndScores.values.first ?? 0
//    for score in studentsAndScores.values {
//        if score > maximumScore {
//            maximumScore = score
//        }
//        //  print(maximum(students))
//
//
//    }
//}
//
//highestScore(scores: studentsAndScores)



// -------------------------------------

func calculate(first: Int, second: Int, operation: (Int, Int) -> Int) {
    operation(first, second)
}

func add(one: Int, two: Int) -> Int {
    one + two
}



calculate(first: 9, second: 9) { $0 * $1 }

calculate(first: 34, second: 5) { first, second in
    first / second
}


let array = [6, 2, 3, 4, 7, 11]

let stringArray = array.map { "\($0)"}
print(stringArray)
print(array.map({ (n1) in
    n1 + 1
}
               ))

//var now = Date().timeIntervalSince1970
//let nowPlusOne = now + 1
//
//while now < nowPlusOne {
//    print(now)
//    now = Date().timeIntervalSince1970
//    print("waiting")
//    print(now)
//}

//func fibonacci(n: Int) {
//    var fiboArray = [0, 1]
//    for number in 2...n - 1 {
//        let newElement = fiboArray[number - 1] + fiboArray[number - 2]
//        fiboArray.append(newElement)
//    }
//    print(fiboArray)
//
//
//    }
//fibonacci(n: 2)

func fibonacci(n: Int) {
    var n1 = 0
    var n2 = 1
    
    if n == 0 {
        print("Invalid input")
    } else if n == 1 {
        print(n1)
    } else if n == 2 {
        print(n1, n2)
    } else {
        var array = [n1, n2]
        for number in 2..<n {
            let n3 = n1 + n2
            array.append(n3)
            n1 = n2
            n2 = n3
        }
        print(array)
    }
}
fibonacci(n: 5)


class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Human: Animal {
    func code() {
        print("Typing away...")
    }
}

class Fish: Animal {
    func breatheUnderWater() {
        print("Breathing under water")
    }
}


let angela = Human(name: "Angela Yu")
let jack = Human(name: "Jack Bauer")
let nemo = Fish(name: "Nemo")

let neighbours: [Any] = [angela, jack, nemo]
if neighbours[2] is Human {
    print("1-st neighbour is a Human")
}

func findNemo(from animals: [Any]) {
    if let indexOfNemo = animals.firstIndex { $0 is Fish } {
        print("Nemo is located at index \(indexOfNemo)")
    } else {
        print("There is no fish")
    }
    
    //    for animal in animals {
    //        if animal is Fish {
    //            print("Found nemo at index ")
    //        }
    //    }
}

findNemo(from: neighbours)



let numbers = [1, 2, 3, 4, 7, 10]

let result = numbers.map { $0 * 10
}

print(numbers)

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var result = [Int]()
    for i in 0..<nums.count {
        for j in (i + 1)..<nums.count {
            if nums[j] + nums[i] == target {
                result.append(i)
                result.append(j)
            }
        }
    }
    return result
}
twoSum(numbers, 15)


let s = "MCMLXLV"
//func romanToInt(_ s: String) -> Int {
//    let dictionary = [
//        "I" : 1,
//        "V" : 5,
//        "X" : 10,
//        "L" : 50,
//        "C" : 100,
//        "D" : 500,
//        "M" : 1000
//    ]
//
//    let reversedString = s.reversed()
//    for symbol in reversedString {
//        switch symbol {
//        case "I":
//            number
//        }
//    }
//}

let defaults = UserDefaults.standard

defaults.set(true, forKey: "MusicOn")
defaults.set("Abgela", forKey: "PlayerName")
defaults.set(Date(), forKey: "AppLastOpenedByUser")
let appLastOpen = defaults.object(forKey: "AppLastOpenedByUser")
defaults.set(numbers, forKey: "Numbers")
let newNumbers = defaults.array(forKey: "Numbers") as! [Int]
defaults.
