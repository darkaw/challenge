//
//  PhotoViewCell.swift
//  Challenge
//
//  Created by Darkaw on 22/10/20.
//

import UIKit

class PhotoViewCell: UICollectionViewCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    
   func configureWithItem(item: Photo) {
    labelTitle?.text = item.title
       
       let pictureURL = URL(string: item.thumbnailUrl)!
       let pictureData = NSData(contentsOf: pictureURL as URL)
       let image = UIImage(data: pictureData! as Data)
      
       img.image = image
   }

}
