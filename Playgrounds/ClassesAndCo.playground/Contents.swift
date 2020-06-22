import UIKit


struct Dog: Hashable {

    var name: String

    func eat() {

    }

    mutating func rename(_ name: String) {
        self.name = name
    }
}

// Classe si héritage, UIKit, ou référence
class Animal {

    var age: Int

    init?(age: Int) {
        guard age >= 0 else { return nil }
        self.age = age
    }

    convenience init?() {
        self.init(age: 0)
    }
}

class Cat: Animal {

    var name: String

    init(name: String) {
        self.name = name
        super.init(age: 0)!
    }


    func eat() {

    }

    func rename(_ name: String) {
        self.name = name
    }

    deinit {
        print("toto")
    }
}

let medor = Dog(name: "Médor")
var brutus = medor
brutus.name = "Brutus"

let felix = Cat(name: "")
felix.name = "Félix"
let giga = felix
giga.name = "Giga"

print(brutus.name)
print(medor.name)

print(felix.name)
print(giga.name)

enum Specie {

}

var moi = "Ludovic"

func test(name: inout String) {
    name = "Toto"
}

test(name: &moi)
moi

if let ani = Animal(age: -1) {
    print(ani)
}
