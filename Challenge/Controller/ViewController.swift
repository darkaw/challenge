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
    
    @IBAction func pressBtnClose(){
        dismiss(animated: true, completion: nil)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //  SOLUTION FOR SLOW
        collectionViewPhotos.deselectItem(at: indexPath, animated: false)
        let photo = indexPath.row
        
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = (storyboard.instantiateViewController(withIdentifier: "PhotoViewController") as? PhotoViewController)!
        vc.photo = photosArray[photo]
        self.present(vc, animated: true)
            
                
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let noOfCellsInRow = 2

              let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

              let totalSpace = flowLayout.sectionInset.left
                  + flowLayout.sectionInset.right
                  + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

              let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

              return CGSize(width: size, height: size)
       }
    
}

