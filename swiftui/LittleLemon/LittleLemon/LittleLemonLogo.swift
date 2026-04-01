import SwiftUI

struct LittleLemonLogo: View {
    var body: some View {
        HStack {
            Image("littleLemon")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 60)
          
                
        }
    }
}

struct LittleLemonLogo_Previews: PreviewProvider {
    static var previews: some View {
        LittleLemonLogo()
    }
}


