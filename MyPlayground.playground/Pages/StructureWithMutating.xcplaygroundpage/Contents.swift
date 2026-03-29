struct TableReservation {
  var name: String
  var tableNumber: Int

  mutating func updateBooking(updatedName: String) {
    name = updatedName
  }
}

var johnBooking = TableReservation(name: "John", tableNumber: 1)
print(johnBooking)
johnBooking.updateBooking(updatedName: "Maria")
print(johnBooking)
