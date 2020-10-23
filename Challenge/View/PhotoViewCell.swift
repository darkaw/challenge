//
//  PhotoViewCell.swift
//  Challenge
//
//  Created by Darkaw on 22/10/20.
//

import UIKit

class PhotoViewCell: UICollectionViewCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var img: CustomImageView!
    
   func configureWithItem(item: Photo) {
    labelTitle?.text = item.title
       
    
    if let url = URL(string: item.thumbnailUrl){
        img.loadImage(from: url)
    }
      
   }

}
