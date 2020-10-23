//
//  CompleteProfileViewController.swift
//  Challenge
//
//  Created by Darkaw on 23/10/20.
//

import UIKit

class CompleteProfileViewController: UIViewController {
    @IBOutlet weak var textViewBio: UITextView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!

  
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textViewBio.layer.borderColor = UIColor.lightGray.cgColor
        self.textViewBio.layer.borderWidth = 1
        // Do any additional setup after loading the view.
    }
    @IBAction func pressBtnNext(){
        oUser.name = txtName.text
        oUser.lastName = txtLastName.text
        oUser.bio = textViewBio.text!
        oUser.login = true
        oUser.saveData()
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AudioViewController") as! AudioViewController
        vc.modalPresentationStyle = .fullScreen 
        self.present(vc, animated: true, completion: nil)
        
    }
}
