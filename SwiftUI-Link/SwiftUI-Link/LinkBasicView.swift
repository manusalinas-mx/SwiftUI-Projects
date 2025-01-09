//

//
//
//

import SwiftUI

struct LinkBasicView: View {
  var body: some View {
    Link("Go to Apple", destination: URL(string: "https://apple.com")!)
      .font(.largeTitle)
  }
}

#Preview {
    LinkBasicView()
}
