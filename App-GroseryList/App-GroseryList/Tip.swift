//
//  Tip.swift
//  App-GroseryList
//
//  Created by Manuel Salinas on 1/14/25.
//

import Foundation
import TipKit

struct ButtonTip: Tip {
    var title: Text = Text("Essential Foods")
    var message: Text? = Text("Add some everyday items to the shopping list.")
    var image: Image? = Image(systemName: "info.circle")
}
