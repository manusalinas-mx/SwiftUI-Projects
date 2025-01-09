//

//
//
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      LinkBasicView()
        .tabItem {
          Image(systemName: "1.circle")
          Text("Basic Link")
        }
      
      LinkButtonStyleView()
        .tabItem {
          Image(systemName: "2.circle")
          Text("Button Style Link")
        }
      
      LinkCustomView()
        .tabItem {
          Image(systemName: "3.circle")
          Text("Custom Link")
        }
    }
  }
}

#Preview {
    ContentView()
}
