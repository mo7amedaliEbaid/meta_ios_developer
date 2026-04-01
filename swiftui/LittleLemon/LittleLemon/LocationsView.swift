import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model:Model
    var body: some View {
        VStack {
            LittleLemonLogo()
        
            Text(model.reservation.restaurant.city.isEmpty ? "Select a location" : "Reservation Details") //2
            .padding([.leading, .trailing], 40)
            .padding([.top, .bottom], 8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)


            NavigationView {
                List(model.restaurants, id: \.self) { restaurant in //3
                    NavigationLink(destination: ReservationForm(restaurant)) {
                        RestaurantView(restaurant)
                    }
                }
                .listStyle(.plain)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}
