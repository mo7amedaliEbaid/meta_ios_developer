struct Order {
    let price: Int
    let location: String
}
  
func totalRevenueOf(orders: [Order],  location: String) -> Int {
    let ordersAtLocation = orders.filter { $0.location == location }
    print(ordersAtLocation)
    let orderPrices = ordersAtLocation.map { $0.price }
    print(orderPrices)
    return orderPrices.reduce(0) { $0 + $1 }
}
  
let orders = [
    Order(price: 24, location: "New York"),
    Order(price: 37, location: "San Francisco"),
    Order(price: 101, location: "New York"),
]
  
//let result = totalRevenueOf(orders: orders, location: "New York")
//print(result)
func sum(n: Int) -> Int {
    if n == 0 {
        return 0
    }
    return n + sum(n: n - 1)
}
let result = sum(n: 6)
print(result)
