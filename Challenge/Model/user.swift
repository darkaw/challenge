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
    var loginProfileImage : UIImage? =  UIImage(named: "user")
    
    var login: Bool? = false
    
    func logout(){
        userName = ""
        name = ""
        lastName = ""
        bio = ""
        //loginProfileImage = UIImage(named: "user")
        login = false
        
        
    }
    func saveData(){
        print(oUser.login)
        let defaults = UserDefaults.standard
        defaults.set(oUser.userName, forKey: "userName")
        defaults.set(oUser.name, forKey: "name")
        defaults.set(oUser.lastName, forKey: "lastName")
        defaults.set(oUser.bio, forKey: "bio")
        defaults.set(oUser.login, forKey: "login")
    }
    
    
    func loadUserData(){
        
        oUser.userName =  UserDefaults.standard.string(forKey: "userName")
        oUser.name =  UserDefaults.standard.string(forKey: "name")
        oUser.lastName =  UserDefaults.standard.string(forKey: "lastName")
        oUser.bio =  UserDefaults.standard.string(forKey: "bio")
        oUser.login =  UserDefaults.standard.bool(forKey: "login")
        print(oUser.login)
       // oUser.profilePic = UserDefaults.standard.string(forKey: "profilePic")
    }
    
}
