import UIKit

// variables
var greeting = "Hello, playground"
var age = 20
age = 30

// constants
let newAge = 40
//newAge = 50 // cannot asign to a constant

// data types
var stringType: String = "Hello 1"
var intType: Int = 20
var doubleType: Double = 20.0
var boolType: Bool = true
var booleanType: Bool = true

var arrayType: [Int] = [1, 2, 3]
var emptyStringArray: [String] = []
var stringArray: [String] = ["a", "b", "c", "d"]
var dictionaryType: [String: Int] = ["key1": 1, "key2": 2, "key3": 3]

if newAge > 30 {
    let message: String = "You are old"
}

var element2 = stringArray[1]

var favoriteGenres: Set<String> = ["Rock", "Country", "Jazz"]
favoriteGenres.insert("Classical")
print("Favorite Genres: \(favoriteGenres)")

var popularGenres: Set<String> = ["Rock", "Pop", "Jazz", "Indie", "Metal"]
print("Popular Genres: \(popularGenres)")

let intersection: Set<String> = favoriteGenres.intersection(popularGenres)
print("Intersection: \(intersection)")

let union: Set<String> = favoriteGenres.union(popularGenres)
print("Union: \(union)")

for (key, value) in dictionaryType {
    print("\(key): \(value)")
}

for element in stringArray {
    print(element)
}

for index in 1...5 {
    print(index)
}

var square = 10
var diceRoll = 0

while square > diceRoll {
    print(diceRoll)
    diceRoll += 1
}

let day = "Monday"

// if-else statements
if day == "Monday" {
    print("It's Monday")
} else if day == "Tuesday" {
    print("It's Tuesday")
} else if day == "Wednesday" {
    print("It's Wednesday")
} else if day == "Thursday" {
    print("It's Thursday")
} else if day == "Friday" {
    print("It's Friday")
} else {
    print("It's not a weekday")
}

// switch case
switch day {
case "Monday":
    print("It's Monday")
case "Tuesday":
    print("It's Tuesday")
case "Wednesday":
    print("It's Wednesday")
case "Thursday":
    print("It's Thursday")
case "Friday":
    print("It's Friday")
default :
    print("It's not a weekday")
}


func printSomething(text: String) {
    print(text)
}

printSomething(text: "This is something!")

func printSomethingElse(thisIsUserName name:String) -> String {
    return "Hello \(name)"
}

let returnedValue = printSomethingElse(thisIsUserName: "John")
print(returnedValue)

var reallyLongString = "lorem ipsm"

enum CompassPoint {
    case north
    case south
    case east
    case west
}

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

var someResolution = Resolution()
someResolution.width = 1280
someResolution.height = 720

var videoMode = VideoMode()
videoMode.resolution = someResolution
videoMode.interlaced = true
videoMode.frameRate = 60.0
videoMode.name = "Some Video Mode"

print(videoMode.resolution.height)


class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func printInfo() {
        print("Name: \(name)\n Age: \(age)")
    }
}

var sandaru = Person(name: "Sandaru", age: 23)
var kusal = Person(name: "Kusal", age: 24)

sandaru.printInfo()
kusal.printInfo()

var sandaru_clone = sandaru
sandaru_clone.name = "NOT Sandaru"

sandaru.printInfo()
sandaru_clone.printInfo()

//var sandaru_carbon = Person()
//sandaru_carbon.name = "CARBON Sandaru"
//
//sandaru.printInfo()
//sandaru_clone.printInfo()
//sandaru_carbon.printInfo()

//if (sandaru == sandaru_clone) {
//    print("asndoisadjk")
//}


class Student: Person {
    var course: String
    
    init(name: String, age: Int, course: String) {
        self.course = course
        super.init(name: name, age: age)
    }
    
    override func printInfo() {
        super.printInfo()
        print("Course: \(course)")
    }
}

var sandaru_student = Student(name: "Sandaru Student", age: 23, course: "Swift")
sandaru_student.printInfo()

func unwrapOptional() {
    var name: String?
//    name = "Hello world!"
    
    guard let unwrappedName = name else {
        print("failure")
        return
    }
    
    print(unwrappedName)
    
}


unwrapOptional()

// ------------------------------------------------------------------
// ! is called forced unwrapping

var name: String?
name = "Hello world!"

print(name!) // if name is null it will throw a fatal error (Unexpectedly found nil while unwrapping an Optional value)
