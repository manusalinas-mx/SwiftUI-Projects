//

//
//
//

import SwiftUI

struct LinkCustomView: View {
  var body: some View {
    Link(destination: URL(string: "https://apple.com")!) {
      HStack(spacing: 16) {
        Image(systemName: "apple.logo")
        Text("Apple Store")
      }
      .font(.largeTitle)
      .foregroundColor(.white)
      .padding()
      .padding(.horizontal)
      .background (
        Capsule()
          .fill(Color.blue)
      )
    }
  }
}

#Preview {
    LinkCustomView()
}
