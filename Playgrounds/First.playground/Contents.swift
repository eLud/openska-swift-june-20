import UIKit

//: Variables

var version: Float = 5.2
var another = 5.04676435745867

let result = Double(version) + another

let a = 5
let b = 2

let c = Double(a) / Double(b)

//: String

let hello = "Hello"
let languageName = "Swift"

var helloAgain = hello + " " + languageName

//Interpolation
let complete = "\(helloAgain) \(version)"

let char: Character = "B"

let firstString = " Mâcon Test Toto "
let second = "Maçon"

//Useful to compare
let toCompare = firstString.folding(options: [.caseInsensitive, .diacriticInsensitive], locale: .current)

let splitted = firstString.split(separator: " ", omittingEmptySubsequences: false)
let components = firstString.components(separatedBy: " ")

let test = splitted.first!
String(test)

let sub = components[2..<components.count]
sub.startIndex

Array(sub)[0]

//: Collections

let array = ["Paris", 42] as [Any]

var vide1 = [String]()
var vide2: [String] = []
var vide3 = Array<String>()

vide1.append(contentsOf: ["A", "b"])
vide1 = vide1 + ["C", "D"]
vide1.append("Toto")

vide1.insert("E", at: 5)
//vide1.removeAll(keepingCapacity: true)

//Intervalles
0...4 //0 à 4 inclu
0..<4 //0 à 4 exclu

let six: UInt = 6
...six

vide1[2...]
vide1[0...3] = ["Hello"]
vide1

var array2: [String] = Array(repeating: "", count: 200)
array2.reserveCapacity(300)

//Dictionaires

var dico: [String:String] = ["clé":"valeur", "clé2":"valeur2"]
var dico2: Dictionary<String, String> = ["clé":"valeur", "clé2":"valeur2"]
//valeurs : tout ce que tu veux
//clés : uniquement des types "Hashable" (protocole)

var dicoVide: [String:Int] = [:]

let value = dico["clé"]

//Affectation
dico["clé3"] = "valeur"
dico["clé3"] = "nouvelle valeur"
dico.updateValue("valeur", forKey: "clé4")
dico.updateValue("valeur2", forKey: "clé4")

//Suppresion
dico.removeValue(forKey: "clé4")
dico["clé4"] = nil

if dico["clé3"] ==  nil {

}

//Recuperer en tableau
let keys = [String](dico.keys)
let values = [String](dico.values)

let dicoGrouped = Dictionary(grouping: ["Allo", "Avion", "Bateau"]) { (element) in
    element.prefix(2)
}
dicoGrouped


//Set
//Element Hashable
var cities: Set<String> = ["Paris", "Lyon", "Marseille"]
var otherCities: Set<String> = []

otherCities.insert("Paris")
otherCities.insert("Paris")
otherCities.insert("Nantes")

otherCities.count

cities.union(otherCities)
cities.intersection(otherCities)
cities.subtracting(otherCities)
otherCities.symmetricDifference(cities)

cities.contains("Paris")

//tri avec un operateur
vide1.sorted(by: <)

vide1.sorted(by: test)

func test(x: String, y: String) -> Bool {
    return true
}

//Boucles

while false {

}

repeat {

} while false

for i in 0...10 where i.isMultiple(of: 2) {

}

for i in stride(from: 0, to: 10, by: 0.5) {
    print(i)
}

for truc in vide1 {
    print(truc)
}

vide1

for (index, element) in vide1.enumerated() {
    print(element)
    print(index)
}

for truc in dicoGrouped {
    truc.value
}

dicoGrouped.forEach { print($0) }
cities.forEach { (str) in

}

//:Conditions

switch "kjfgskdjgf" {
case "fvf", "utu", "ljg;,nb,":
    print("youhou")
    fallthrough
case "ruyu":
    break
default:
    ()
}

func test(truc: Bool) {

    //Truc DOIT etre true
    guard truc else { return }

    if truc {

    } else {

    }
}

//: Optionals

enum Optionel<Wrapped> {
    case none
    case some(Wrapped)

//    func unwrap() -> Wrapped {
//
//    }
}

//Une string optionnelle
var optString: String? = "azertyuiop"

let lowString = optString?.lowercased()

if optString != nil {
    print(optString!)
    print(optString!)
}

if let optString = optString {
    print(optString)
}

guard let optString = optString else { fatalError() }
print(optString)

let serverURL = URL(string: "https://server.com/v1")!

var ageStr = "20"
let age = Int(ageStr) ?? 0

let textField = UITextField()

//guard let str = textField.text, !str.isEmpty, let age = Int(str), age > 20 else { fatalError() }

//:Fonctions

func unNom() {

}
unNom()

struct Aliment {}

let pizza = Aliment()

func eat(_ aliment: Aliment, with friend: String? = nil, at: Date = Date()) {
    print(aliment)
    print(friend)
}

func eat(_ aliment: String, with friend: String? = nil, at: Date = Date()) {
    print(aliment)
    print(friend)
}

eat(pizza)
eat(pizza, with: "Robert")
eat(pizza, with: "Ami")
eat(pizza, with: nil)
eat(pizza, with: "toto")

func simple() -> (message: String, code: Int, isOk: Bool) {
    return ("", 0, false)
}

let simpleReturn = simple()
simpleReturn.isOk

//func request(_ url: URL) -> (data: Data, code: Int, error: NSError?){
//
//}

var ratio: (x: Int, y: Int) = (1, 5)
func dowith(ratio: (Int, Int)) {

}

func varFunc<T>(numbers: T...) {
    print(numbers)
}

varFunc(numbers: 0,8,7,56)

struct Vector2<T: SignedNumeric&Equatable> {
    var x: T
    var y: T

    mutating func add(otherVector: Vector2) -> Vector2 {
        x += otherVector.x
        y += otherVector.y

        return self
    }
}

var myV = Vector2(x: 5, y: 0)
//myV.add(otherVector: Vector2(x: 0.5, y: 2.7))
