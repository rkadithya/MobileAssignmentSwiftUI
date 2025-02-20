//
//  ContentViewModel.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation
import Combine


class ContentViewModel : ObservableObject {
    
    @Published var navigateDetail: DeviceData? = nil
    @Published var data : [DeviceData] = []
    var cancellable = Set<AnyCancellable>()


    func fetchAPI(){
        ApiService.shared.fetchDeviceDetails()
            .sink(receiveCompletion: { completion in
                
                switch completion{
                case .failure(let error) :
                    print(error.localizedDescription)
                case .finished :
                    print("success")
                }
                
            }, receiveValue: {[weak self ] data in
                self?.data = data
            })
            .store(in: &cancellable)
    }
    
    
    func navigateToDetail(navigateDetail: DeviceData) {
        self.navigateDetail = navigateDetail
    }
}
