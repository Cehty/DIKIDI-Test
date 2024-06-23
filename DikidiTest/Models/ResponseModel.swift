//
//  RequestModel.swift
//  DikidiTest
//
//  Created by Poet on 20.06.2024.
//

import Foundation
import SwiftUI

struct ResponseModel: Codable {
    let data: ResponseDataModel
}

struct ResponseDataModel: Codable {
    let title: String
    let image: String
    let catalogCount: String
    let blocks: BlocksModel
    let order: [String]
	var position: CGPoint? = nil
    
    enum CodingKeys: String, CodingKey {
        case title, image, blocks, order
        case catalogCount = "catalog_count"
    }
}

struct BlocksModel: Codable {
    let vip: [VipModel]
    let shares: SharesModel
    let examples: String
	let examples2: String
    let catalog: [CatalogModel]
}

struct CatalogModel: Codable {
    let id: String
    let name: String
    let image: ImageModel?
    let street: String
    let house: String
    let rating: Float
    let isMaster: Bool
    let award: String?
    let vipTariff: Bool
    let currency: CurrencyModel?
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, street, house, rating, isMaster, award, currency
        case vipTariff = "vip_tariff"
    }
}

struct ScheduleModel: Codable {
    let day: String
    let workFrom: String
    let workTo: String
    
    enum CodingKeys: String, CodingKey {
        case day
        case workFrom = "work_from"
        case workTo = "work_to"
    }
}

struct CurrencyModel: Codable {
    let id: String
    let title: String
    let abbr: String
}

struct SharesModel: Codable {
    let list: [SharesList]
    let count: String
}

struct SharesList: Codable {
    let id: String
    let name: String
    let timeStart: Date
    let timeStop: Date
    let publicTimeStart: Date
    let publicTimeStop: Date
    let discountValue: String
    let view: String
    let usedCount: String
    let companyId: String
    let icon: String
    let companyName: String
    let companyStreet: String
    let companyHouse: String
    let companyImage: String
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.view = try container.decode(String.self, forKey: .view)
        self.icon = try container.decode(String.self, forKey: .icon)
        let timeStart = try container.decode(String.self, forKey: .timeStart)
        self.timeStart = AppDateFormatter.shared.date(from: timeStart, dateFormat: .yyyyMMdd_HHmmss)!
        let timeStop = try container.decode(String.self, forKey: .timeStop)
        self.timeStop = AppDateFormatter.shared.date(from: timeStop, dateFormat: .yyyyMMdd_HHmmss)!
        let publicTimeStart = try container.decode(String.self, forKey: .publicTimeStart)
        self.publicTimeStart = AppDateFormatter.shared.date(from: publicTimeStart, dateFormat: .yyyyMMdd_HHmmss)!
        let publicTimeStop = try container.decode(String.self, forKey: .publicTimeStop)
        self.publicTimeStop = AppDateFormatter.shared.date(from: publicTimeStop, dateFormat: .yyyyMMdd_HHmmss)!
        self.discountValue = try container.decode(String.self, forKey: .discountValue)
        self.usedCount = try container.decode(String.self, forKey: .usedCount)
        self.companyId = try container.decode(String.self, forKey: .companyId)
        self.companyName = try container.decode(String.self, forKey: .companyName)
        self.companyStreet = try container.decode(String.self, forKey: .companyStreet)
        self.companyHouse = try container.decode(String.self, forKey: .companyHouse)
        self.companyImage = try container.decode(String.self, forKey: .companyImage)
        
    }
	
	init() {
		self.id = "1500"
		self.name = "Poryadok"
		self.view = "53"
		self.icon = "https://f1.test.dikidi.ru/c1/v11/26c0tveok9.jpg"
		self.timeStart = Date()
		self.timeStop = Date()
		self.publicTimeStart = Date()
		let publicTimeStop = "2024-06-22 23:59:59"
		self.publicTimeStop = AppDateFormatter.shared.date(from: publicTimeStop, dateFormat: .yyyyMMdd_HHmmss)!
		self.discountValue = "35"
		self.usedCount = "23"
		self.companyId = ""
		self.companyName = "On The Style"
		self.companyStreet = "Большая Филёвская"
		self.companyHouse = "23, к 4"
		self.companyImage = "https://f1.test.dikidi.ru/c1/v11/788s4h7oob.jpg?size=q"
	}
    
    enum CodingKeys: String, CodingKey {
        case id, name, view, icon
        case timeStart = "time_start"
        case timeStop = "time_stop"
        case publicTimeStart = "public_time_start"
        case publicTimeStop = "public_time_stop"
        case discountValue = "discount_value"
        case usedCount = "used_count"
        case companyId = "company_id"
        case companyName = "company_name"
        case companyStreet = "company_street"
        case companyHouse = "company_house"
        case companyImage = "company_image"
    }
    
    func getAddress() -> String {
        var address = "\(companyStreet)"
        if companyHouse != "" {
            address += ", \(companyHouse)"
        }
        return address
    }
}


struct VipModel: Codable {
    let id: String
    let image: ImageModel
    let name: String
    let categories: [String]
    let award: String?
    let vipTariff: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, image, name, categories, award
        case vipTariff = "vip_tariff"
    }
}

struct ImageModel: Codable {
    let thumb: String
    let origin: String
}
