//
//  ImageDetailView.swift
//  NavigationSplitView
//
//  Created by Manuel Salinas on 10/04/25.
//

import SwiftUI

struct ImageDetailView: View {
    let icon: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
        }
        .padding(.all, 100)
    }
}


#Preview {
    ImageDetailView(icon: "balloon")
}
