//
//  ReceipeViewModel.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 11/07/24.
//

import Foundation

class ReceipeViewModel:ObservableObject{
    
    let baseUrl = "https://api.edamam.com/api/recipes/v2"
    static let apiKey = "97fab8c969adb738f07580c787f2d9c1"
    static let apiId = "7b93b135"
    static let type = "public"
    static let time = "100%2B"
    
    //    let url = URL(string: "https://api.edamam.com/api/recipes/v2?type=public&q=salad&app_id=7b93b135&app_key=97fab8c969adb738f07580c787f2d9c1&time=100%2B")
    
    enum MyError:Error{
        case failedToGetReceipe
    }
    
    func fetchReceipe(for query:String) async -> ReceipeModel? {
        guard var urlComponents = URLComponents(string: baseUrl) else {
            return nil
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "type", value: ReceipeViewModel.type),
            URLQueryItem(name: "q", value: query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)),
            URLQueryItem(name: "app_key", value: ReceipeViewModel.apiKey),
            URLQueryItem(name: "app_id", value: ReceipeViewModel.apiId),
        ]
        
        guard let url = urlComponents.url else {
            return nil
        }
        do{
            print("url - \(url)")
            let (data,_) = try await URLSession.shared.data(from: url)
            let receipe = try? JSONDecoder().decode(ReceipeModel.self, from: data)
            return receipe
        }catch{
            print("erroe")
            return nil
        }
    }
}
