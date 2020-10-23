//
//  user.swift
//  Challenge
//
//  Created by Darkaw on 23/10/20.
//

import Foundation
import UIKit

class User{
   
    var userName: String? = ""
    var name: String? = ""
    var lastName: String? = ""
    var bio: String? = ""
    var image : Bool? = false
    var login: Bool? = false
    
    func logout(){
        userName = ""
        name = ""
        lastName = ""
        bio = ""
        image = false
        login = false
        
        
    }
    func saveData(){
        let defaults = UserDefaults.standard
        defaults.set(oUser.userName, forKey: "userName")
        defaults.set(oUser.name, forKey: "name")
        defaults.set(oUser.lastName, forKey: "lastName")
        defaults.set(oUser.bio, forKey: "bio")
        defaults.set(oUser.login, forKey: "login")
        defaults.set(oUser.image, forKey: "image")
    }
    
    
    func loadUserData(){
        oUser.userName =  UserDefaults.standard.string(forKey: "userName")
        oUser.name =  UserDefaults.standard.string(forKey: "name")
        oUser.lastName =  UserDefaults.standard.string(forKey: "lastName")
        oUser.bio =  UserDefaults.standard.string(forKey: "bio")
        oUser.login =  UserDefaults.standard.bool(forKey: "login")
        oUser.image =  UserDefaults.standard.bool(forKey: "image")
    }
    
    func saveImage(imageName: String, image: UIImage) {
     guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }

        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return }

        //Checks if file exists, removes it if so.
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }

        }

        do{
            try data.write(to: fileURL)
        }catch let error{
            print("error saving file with error", error)
        }

    }
    
    func loadImageFromDiskWith(fileName: String) -> UIImage? {

      let documentDirectory = FileManager.SearchPathDirectory.documentDirectory

        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)

        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image

        }

        return nil
    }
    
}
