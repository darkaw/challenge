//
//  ViewController.swift
//  Challenge
//
//  Created by Darkaw on 22/10/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionViewPhotos:UICollectionView!
    var photosArray = [Photo]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewPhotos.delegate = self
        collectionViewPhotos.dataSource = self
        initialSetup()
        fetchData(album: 1)
    }
    
    fileprivate func initialSetup(){
        
    }

    fileprivate func fetchData(album:Int) {
        Service.shared.fetchPhotos(album: album) { (Photo, error) in
            if let err = error {
                print("Failed to fetch product:", err)
                return
            }
            self.photosArray = Photo ?? []
            self.collectionViewPhotos.reloadData()
        }
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewPhotos.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PhotoViewCell
        
        let photo = photosArray[indexPath.row]
        cell.configureWithItem(item: photo)
        return cell
    }
    
    
}

