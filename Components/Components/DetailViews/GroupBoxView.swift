//
//  GroupBoxView.swift
//  Components
//
//  Created by Manuel Salinas on 11/21/23.
//

import SwiftUI

struct GroupBoxView: View {
    var title: String?

    @State private var username = ""
    @State private var password = ""

    var body: some View {

        VStack {
            GroupBox {
                Text("Login")
                
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            .font(.title2)
            .padding(.horizontal)
            .modifier(CustomNavigationBarStyle(title: title))

            Spacer()
                .frame(height: 20)

            Group {
                Text(username)
                Text(password)
            }

            Spacer()
        }
    }
}

#Preview {
    GroupBoxView()
}
