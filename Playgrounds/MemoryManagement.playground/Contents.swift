import UIKit

class Human {
    var firstName: String

    weak var father: Human?
    var son: Human?

    init(name: String) {
        firstName = name
    }

    deinit {
        print("Deinited \(firstName)")
    }
}

var me: Human? = Human(name: "Ludovic")
var son: Human? = Human(name: "Ludovic's son")

me?.son = son
son?.father = me

var otherMe = son

me = nil
son = nil
otherMe = nil


class Client {

    var name: String
    var creditCard: CreditCard?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Deinited \(name)")
    }
}

class CreditCard {
    unowned let owner: Client
    let number: String

    init(owner: Client, number: String) {
        self.owner = owner
        self.number = number
    }

    deinit {
        print("Deinited \(number)")
    }
}


var clientA: Client? = Client(name: "A")

clientA?.creditCard = CreditCard(owner: clientA!, number: "A1B2C3")

clientA = nil

print("End")
