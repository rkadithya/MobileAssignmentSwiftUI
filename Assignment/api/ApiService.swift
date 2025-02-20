//
//  ApiService.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation
import Combine

class ApiService : NSObject {
    static let shared = ApiService()
    
    func fetchDeviceDetails() -> AnyPublisher<[DeviceData],Error> {
        guard let url = URL(string: "https://api.restful-api.dev/objects")
        else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.cachePolicy = .returnCacheDataElseLoad
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [DeviceData].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()

    }
}
