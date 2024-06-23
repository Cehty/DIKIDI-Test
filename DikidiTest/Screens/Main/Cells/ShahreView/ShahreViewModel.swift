//
//  MainViewModel.swift
//  DikidiTest
//
//  Created by Poet on 20.06.2024.
//

import Foundation
import SwiftUI

@Observable
class ShahreViewModel: Identifiable {
    var id = UUID()
    var image: String
    var icon: String
    var name: String
    var timeStop: String
    var discountValue: String
    var companyName: String
    var comanyAddress: String
    var view: String
    
    
    init(image: String, icon: String, name: String, timeStop: String, discountValue: String, companyName: String, comanyAddress: String, view: String) {
        self.image = image
        self.icon = icon
        self.name = name
        self.timeStop = timeStop
        self.discountValue = discountValue
        self.companyName = companyName
        self.comanyAddress = comanyAddress
        self.view = view
    }
}
