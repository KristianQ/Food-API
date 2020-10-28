//
//  FoodViewModel.swift
//  Food-API
//
//  Created by Emiliano Qaqi on 10/27/20.
//

import SwiftUI

class FoodViewModel: ObservableObject {
    
    
    
    func getFoodData(completion: @escaping ([Food]) -> Void) {
        let url = URL(string: "https://s3-us-west-1.amazonaws.com/net.raquo.images/ContentStub.json")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            do {
                if let data = data {                    
                    if let response = try? JSONDecoder().decode(Root.self, from: data) {
                        DispatchQueue.main.async {
                            completion(response.data!)
                        }
                        return
                    }
                } else {
                    print("No Data")
                }
            }
            
        }.resume()
        
    }
    
}
