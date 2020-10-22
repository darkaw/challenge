//
//  Service.swift
//  Challenge
//
//  Created by Darkaw on 22/10/20.
//


import Foundation

class Service: NSObject {
    static let shared = Service()
    
    func fetchPhotos(album:Int, completion: @escaping ([Photo]?, Error?) -> ()) {
        let urlString = "https://jsonplaceholder.typicode.com/albums/\(album)/photos"
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch photo:", err)
                return
            }
            
            guard let data = data else { return }
            do {
                let jsondata = try JSONDecoder().decode([Photo].self, from: data)
                
                DispatchQueue.main.async {
                    completion(jsondata, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
}
