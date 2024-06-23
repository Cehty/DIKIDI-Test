//
//  GetModelService.swift
//  DikidiTest
//
//  Created by Poet on 20.06.2024.
//

import Foundation

actor GetModelService {

    private let network = NetworkManager()
    private let url = URL(string: "https://api-beauty.test.dikidi.ru/home/info")
    
    func getModel() async throws -> ResponseDataModel {
        guard let url else {
            throw BaseErrors.invalidURL
        }

        return try await network.session.request(
            url,
            method: .get,
            headers: ["Authorization": "maJ9RyT4TJLt7bmvYXU7M3h4F797fUKofUf3373foN94q4peAM"]
        ).serializingDecodable(ResponseModel.self).value.data
    }
}

