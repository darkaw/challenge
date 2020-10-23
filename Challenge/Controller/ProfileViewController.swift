//
//  ProfileViewController.swift
//  Challenge
//
//  Created by Darkaw on 23/10/20.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var labelUser: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelBio: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelUser.text = oUser.userName
        labelName.text = oUser.name! + " " + oUser.lastName!
        labelBio.text = oUser.bio
        if(oUser.image == true){
            imgUser.image = oUser.loadImageFromDiskWith(fileName: "profile.png")
        }else{
            imgUser.image = UIImage(named: "user")
        }
    }
    
    @IBAction func pressBtnClose(){
        dismiss(animated: true, completion: nil)
    }


}
