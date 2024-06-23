//
//  MainViewModel.swift
//  DikidiTest
//
//  Created by Poet on 20.06.2024.
//

import Foundation
import SwiftUI

@Observable
class MainViewModel {
	var text = ""
	var vipViewModels = [VipViewModel]()
	var shareViewModels = [ShahreViewModel]()
	var example = ""
		
	func loadView() async {
		do {
			let service = GetModelService()
			let model = try await service.getModel()
			await MainActor.run { [weak self] in
				self?.setupSections(with: model)
			}
		} catch {
			print(error)
		}
	}

	func setupSections(with model: ResponseDataModel) {
		setupVip(model.blocks.vip)
		setupShare(model.blocks.shares)
		setupExample(model.blocks.examples2)
	}
	
	func setupVip(_ vip: [VipModel]) {
		let lastModelId = vip.last?.id
		vipViewModels = vip.map {
			let isShowDivider = vipViewModels.count != 1 && $0.id != lastModelId
			return VipViewModel(for: $0, isShowDivider: isShowDivider)
		}
	}
	
	func setupShare(_ share: SharesModel) {
		shareViewModels = share.list.map { ShahreViewModel(image: $0.companyImage, icon: $0.icon, name: $0.name, timeStop: $0.publicTimeStop.beforeMonthYear, discountValue: $0.discountValue, companyName: $0.companyName, comanyAddress: $0.getAddress(), view: $0.view) }
	}
	
	func setupExample(_ example: String) {
		print("\(example)")
		self.example = example
	}
}
