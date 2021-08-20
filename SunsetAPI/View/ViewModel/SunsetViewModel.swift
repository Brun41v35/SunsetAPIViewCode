//
//  SunsetViewModel.swift
//  SunsetAPI
//
//  Created by Bruno Silva on 19/08/21.
//

import Foundation

public class SunsetViewModel {
    
    //MARK: - Request
    func makeRequesting(completed: @escaping (Surise?, String?) -> Void) {
        NetworkManager.shared.getInformationAPI { information, errorMessage in
            guard let information = information else {
                completed(nil, errorMessage)
                return
            }
            completed(information, nil)
        }
    }
}
