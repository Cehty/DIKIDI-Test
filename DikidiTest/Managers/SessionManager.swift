//
//  SessionManager.swift
//  DikidiTest
//
//  Created by Poet on 20.06.2024.
//

import Foundation
import Alamofire

final class NetworkManager {
    var session: Session = .init(interceptor: Adapter())
}

extension NetworkManager {
    func cancellSession() {
        session.session.getTasksWithCompletionHandler { (sessionDataTask, uploadData, downloadData) in
            sessionDataTask.forEach { $0.cancel() }
            uploadData.forEach { $0.cancel() }
            downloadData.forEach { $0.cancel() }
        }
    }
}

private class Adapter: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        let urlRequest = urlRequest

        completion(.success(urlRequest))
    }
}
