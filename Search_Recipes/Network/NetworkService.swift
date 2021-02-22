//
//  Network Services.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//


import Alamofire

class NetworkService {
    
    static let shared = NetworkService()
    
    private let baseURL = "https://api.edamam.com/search"
    
    func searchMovies(with query: String, onSuccess: @escaping ([SearchRecipe]) -> Void, onError: @escaping (String) -> Void) {
        let queryEncoded = query.urlEncode()
        let searchRequest = baseURL + "?q=\(queryEncoded)&"
        sendRequest(for: searchRequest, onSuccess: onSuccess, onError: onError)
    }
    
    func loadImage(imagePath: String?, onSuccess: @escaping (UIImage?) -> Void) {
        guard let path = imagePath else { return}
        let request = AF.request(path)
        request.responseData { response in
            guard let data = response.value else { return }
            let image = UIImage(data: data)
            onSuccess(image)
        }
    }
    
    private func sendRequest(for requestString: String, onSuccess: @escaping ([SearchRecipe]) -> Void, onError: @escaping (String) -> Void){
        let requestWithKey = requestString+"app_id=6714eaca&app_key=14c29486254b3ec45cddfb2d19e2e42c"
        AF.request(requestWithKey).responseJSON { response in
            do {
                let recipes = try JSONDecoder().decode(Recipes.self, from: response.data!)
                onSuccess(recipes.hits)
            } catch {
                onError("Not Found")
            }
        }
    }
}
