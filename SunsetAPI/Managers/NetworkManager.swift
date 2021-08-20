//
//  NetworkManager.swift
//  SunsetAPI
//
//  Created by Bruno Silva on 19/08/21.
//

import Foundation

class NetworkManager {
    
    //MARK: - Variables
    static let shared = NetworkManager()
    private let baseURL = "https://api.sunrise-sunset.org/json"
    
    //MARK: - Init
    private init() {}
    
    //MARK: - Request
    func getInformationAPI(completed: @escaping (Surise?, String?) -> Void) {
        
        let endpoint = baseURL + "?lat=36.7201600&lng=-4.4203400"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "Something wrong happens.. 😖")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(nil, "Uneble to complete.. Check your internet.. 😓")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server. Please try again 😬")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data received from the server is invalid. Please try again 😬")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let sunsetInformation = try decoder.decode(Surise.self, from: data)
                completed(sunsetInformation, nil)
            } catch {
                completed(nil, "The data received from the server is invalid. Please try again 😬")
            }
        }        
        task.resume()
    }
}
