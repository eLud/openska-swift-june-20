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

    class var maxAge: Int {
        return 100
    }

    var age: Int {
        //Observers
        willSet {
            print("The age is \(age), and will be updated to \(newValue)")
        }

        didSet {
            print("The age was \(oldValue), and is now \(age)")
            // We can override the value
//            age = 0
        }
    }

    init?(age: Int) {
        guard age >= 0 else { return nil }
        self.age = age
    }

    convenience init?() {
        self.init(age: 0)
    }
}

class Cat: Animal {

    override class var maxAge: Int {
        15
    }

    var name: String

    //Make the setter private
    private(set) var specie: Specie

    //computed property age (get-only property)
    var humanAge: Int { age * 7 }

    init(name: String) {
        self.name = name
        specie = Specie.unknown

        super.init(age: 0)!
    }


    func eat() {
        specie = .unknown
    }

    func rename(_ name: String) {

        let oldName = name
        self.name = name

        //Defer will be called at the end of the method
        defer {
            //Close file
            self.name = oldName
            //can capture value declared later
            toto = "toto"
        }

        //Open File

        var toto = ""

        guard false else { return }
        guard false else { return }
        guard false else { return }

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

felix.age += 1
felix.humanAge
//felix.humanAge = 14
felix.age
//felix.specie = .unknown

Animal.maxAge
Cat.maxAge

var moi = "Ludovic"

func test(name: inout String) {
    name = "Toto"
}

test(name: &moi)
moi

if let ani = Animal(age: -1) {
    print(ani)
}

enum Specie {
    case unknown
    case maineCoon
    case siamois
}

var aSiamois = Specie.siamois
aSiamois = .maineCoon

//Enum with raw values (Int/Float/Double/String/Character)
enum TransportType: String {
    case bus
    case train
    case car
    case carPool
    case plane
    case rocket
}

TransportType.plane.rawValue
TransportType(rawValue: "bus")

//Associated values
enum TransportStatus {
    case onTime
    case delayed(delay: Int)
    case cancelled(reason: String)
    case unknowed

    init?(customValue: String) {
        if customValue.contains("delayed") {
            self = .delayed(delay: 0)
        } else {
            return nil
        }
    }

    var message: String {
        switch self {
        case .onTime:
            return "On time"
        case .delayed(let delay) where delay > 15:
            return "Delayed by \(delay) minutes"
        case .delayed:
            return "On time"
        case .cancelled(let reason):
            return "Cancelled becaus of \(reason)"
        case .unknowed:
            return "On time"
        }
    }
}

var delayed = TransportStatus.onTime
delayed = .delayed(delay: 15)

//:Error management

//1st level is Optional

enum FileOpenError: Error {
    case noFile
    case notEnoughPermission
    case badFileType(foundType: String)
}

func openFile(at url: URL) throws -> String {

    guard url.absoluteString.contains("toto") else {
        throw FileOpenError.noFile
    }

    let data = try Data(contentsOf: url)
    guard let text = String(data: data, encoding: .utf8) else {
        throw FileOpenError.badFileType(foundType: "png")
    }

    return text
}

//Deal with the error
do {
    try openFile(at: URL(string: "azertyu")!)
} catch FileOpenError.noFile {
    print("No file at URL")
} catch {
    print(error)
}

if let readText = try? openFile(at: URL(string: "azertyu")!) {
    print(readText)
}
