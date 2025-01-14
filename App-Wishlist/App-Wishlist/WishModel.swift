//
//  WishModel.swift
//  App-Wishlist
//
//  Created by Manuel Salinas on 1/13/25.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title: String

    init(title: String) {
        self.title = title
    }
}
