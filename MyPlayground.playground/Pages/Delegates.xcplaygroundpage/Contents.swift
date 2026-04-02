//protocol Driver {
//    var name: String { get }
//    func driveToDestination(_ destination: String, with food: String)
//}
//
//class DeliveryDriver: Driver {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//    func driveToDestination(_ destination: String, with food: String) {
//        print("\(name) is driving to \(destination) to deliver \(food).")
//    }
//}
//
//class LittleLemon {
//    var deliveryDriver: Driver?
//    func deliverFood(_ food: String, to destination: String) {
//        if let deliveryDriver = deliveryDriver {
//            deliveryDriver.driveToDestination(
//                destination,
//                with: food
//            )
//        } else {
//            print("No delivery driver.")
//        }
//    }
//}
//
//let bob = DeliveryDriver(name: "Bob")
//let littleLemon = LittleLemon()
//littleLemon.deliverFood(
//    "Super Spaghetti",
//    to: "1 Spaghetti Lane"
//)
//littleLemon.deliveryDriver = bob
//littleLemon.deliverFood(
//    "Super Spaghetti",
//    to: "1 Spaghetti Lane"
//)
//protocol Driver {
//    var name: String { get }
//    func driveToDestination(_ destination: String, with food: String)
//}
//
//class DeliveryDriver: Driver {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//    func driveToDestination(_ destination: String, with food: String) {
//        print("\(name) is driving to \(destination) to deliver \(food).")
//    }
//}
//
//class LittleLemon {
//    var deliveryDriver: Driver?
//    func getDriverName() {
//        if let name = deliveryDriver?.name {
//            print("Driver name: \(name)")
//        } else {
//            print("No delivery driver found.")
//        }
//    }
//}
//
//let george = DeliveryDriver(name: "George")
//let littleLemon = LittleLemon()
//littleLemon.getDriverName()
//littleLemon.deliveryDriver = george
//protocol Driver {
//    var name: String { get }
//    func driveToDestination(_ destination: String, with food: String)
//}
//
//class DeliveryDriver: Driver {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//    func driveToDestination(_ destination: String, with food: String) {
//        print("\(name) is driving to \(destination) to deliver \(food).")
//    }
//}
//
//class LittleLemon {
//    var deliveryDriver: Driver?
//    func deliverFood(_ food: String, to destination: String) {
//        if let deliveryDriver = deliveryDriver {
//            deliveryDriver.driveToDestination(
//                destination,
//                with: food
//            )
//        } else {
//            print("No delivery driver.")
//        }
//    }
//}
//
//let george = DeliveryDriver(name: "George")
//let littleLemon = LittleLemon()
//littleLemon.deliveryDriver = george
//littleLemon.deliverFood(
//    "Affogato",
//    to: "1 Affogato Lane"
//)
protocol Driver {
    var name: String { get }
    func driveToDestination(_ destination: String, with food: String)
}

class DeliveryDriver: Driver {
    let name: String
    init(name: String) {
        self.name = name
    }
    func driveToDestination(_ destination: String, with food: String) {
        print("\(name) is driving to \(destination) to deliver \(food).")
    }
}

class LittleLemon {
    var deliveryDriver: Driver?
    func getDriverName() {
        if let name = deliveryDriver?.name {
            print("Driver name: \(name)")
        } else {
            print("No delivery driver found.")
        }
    }
}

let elisa = DeliveryDriver(name: "Elisa")
let littleLemon = LittleLemon()
littleLemon.deliveryDriver = elisa
littleLemon.getDriverName()
