//
//  PhotoViewController.swift
//  Challenge
//
//  Created by Darkaw on 22/10/20.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet weak var img:CustomImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    var photo:Photo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelTitle.text = photo!.title
        if let url = URL(string: photo!.url){
            img.loadImage(from: url)
        }
    }
    
    
    @IBAction func pressBtnClose(){
        dismiss(animated: true, completion: nil)
    }
   
}
