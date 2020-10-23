//
//  CustomImageView.swift
//  Challenge
//
//  Created by Darkaw on 22/10/20.
//

import UIKit

class CustomImageView: UIImageView {
    func loadImage(from Url: URL){
        image = nil
        let task = URLSession.shared.dataTask(with: Url){ (data, response, error) in
            guard let data = data,
                  let newImage = UIImage(data: data)
            else{
                print("Couldn't load from URL: \(Url)")
                return
            }
            
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
        task.resume()
    }
}
