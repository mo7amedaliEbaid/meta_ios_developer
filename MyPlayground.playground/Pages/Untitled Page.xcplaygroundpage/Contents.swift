
class Wallet {
    let dollars: Double
    init(_ dollars: Double) {
        self.dollars = dollars
    }
}
let strings = [
    "coffee",
    "coffee",
    "smoothie",
    "smoothie",
    "smoothie",
    "blueberries"
]
print(Set(strings))
protocol Book {
    var title: String { get }
    func share()
}
protocol FoodDelivery {
    func deliverFood()
}
struct Car: FoodDelivery {
    func deliverFood() {
        print("Deliver food by car")
    }
}
class Restaurant {
    var delegate: FoodDelivery?
    func delegateDelivery() {
        if let delegate = delegate {
            delegate.deliverFood()
            return
        }
        print("No delegate found.")
    }
}
let restaurant = Restaurant()
restaurant.delegate = Car()
restaurant.delegateDelivery()
//let berries = [
//    "strawberry",
//    "blueberry",
//    "grape",
//    "goji"
//]
//let result = berries
//    .map { "healthy \($0)\n" }
//    .filter { $0.count > 5 }
//    .reduce("Berries:\n") { $0 + $1 }
//print(result)
class Berry {
}
class Blueberry: Berry {
}
class Strawberry: Berry {
}
let berries = [Berry(), Blueberry(), Strawberry()]
for berry in berries {
    if berry is Berry {
        print("Berry")
    }
    if berry is Blueberry {
        print("Blueberry")
    }
    if berry is Strawberry {
        print("Strawberry")
    }
}
