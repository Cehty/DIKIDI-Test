//
//  MainViewModel.swift
//  DikidiTest
//
//  Created by Poet on 20.06.2024.
//

import Foundation
import SwiftUI

@Observable
class VipViewModel: Identifiable {
    var id: String
    var image: String
    var name: String
    var categories: [String]
    var isShowDivider: Bool
    
    init(for model: VipModel,
		 isShowDivider: Bool) {
		self.id = model.id
		self.image = model.image.origin
		self.name = model.name
		self.categories = model.categories
		self.isShowDivider = isShowDivider
	}
}
