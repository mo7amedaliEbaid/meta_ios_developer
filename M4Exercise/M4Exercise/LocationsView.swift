import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model:Model
    @State private var isReady = false

    var body: some View {
        ZStack {
            VStack {
                LittleLemonLogo()
                    .padding(.top, 50)

                Text(model.displayingReservationForm ? "Reservation Details" :
                        "Select a location")
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)

                NavigationView {
                    List(model.restaurants, id: \.self) { restaurant in
                        NavigationLink(destination: ReservationForm(restaurant)) {
                            RestaurantView(restaurant)
                        }
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }
                .opacity(isReady ? 1 : 0)
            
                .onDisappear {
                    if model.tabBarChanged { return }
                    // this changes the phrase from "Select a location"
                    // to "RESERVATION"
                    model.displayingReservationForm = true
                }
                .frame(maxHeight: .infinity)
                // SwiftUI has this space between the title and the list
                // that is amost impossible to remove without incurring
                // into complex steps that run out of the scope of this
                // course, so, this is a hack, to bring the list up
                // try to comment this line and see what happens.
                .padding(.top, -10)
                // makes the list background invisible, default is gray
                .scrollContentBackground(.hidden)
                .onAppear {
                    // Give the NavigationView one run-loop tick to lay out,
                    // then fade it in so users never see a blank white flash.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                        withAnimation(.easeIn(duration: 0.2)) {
                            isReady = true
                        }
                    }
                }
            }

            // Spinner shown during the brief layout moment
            if !isReady {
                VStack(spacing: 12) {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(1.4)
                    Text("Loading locations…")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(28)
                .background(.regularMaterial)
                .cornerRadius(16)
                .shadow(radius: 8)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}
