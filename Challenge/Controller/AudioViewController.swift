//
//  AudioViewController.swift
//  Challenge
//
//  Created by Darkaw on 23/10/20.
//

import UIKit
import AVFoundation


class AudioViewController: UIViewController {

    @IBOutlet weak var viewAnim: UIView!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnUser: UIButton!
    @IBOutlet weak var labelSong_: UILabel!
    @IBOutlet weak var labelUser: UILabel!
    
    var audioPlayer = AVAudioPlayer()

    var playing = false
    let song = "halloween"
    var image:UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelSong_.text = song
        labelUser.text = oUser.userName
        if(oUser.image == true){
            image = oUser.loadImageFromDiskWith(fileName: "profile.png")
            btnUser.setImage(image, for: .normal)
        }else{
            btnUser.setImage(UIImage(named: "user"), for: .normal)
        }
        
       
        
        let sound = Bundle.main.path(forResource:song, ofType:"mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath:sound!))
        }catch{
            print(error)
        }
        
        
    }
    
    
    @IBAction func pressBtnPlay(){
        
        if self.playing == false {
            UIView.animate(withDuration: 0.2, animations: {
                self.viewAnim.backgroundColor = UIColor.black
            }, completion: { _ in
                self.audioPlayer.play()
                self.playing = true
                self.btnPlay.setImage(UIImage(named: "pause"), for: .normal)
            })
           
        }else{
            UIView.animate(withDuration: 0.2, animations: {
                self.viewAnim.backgroundColor = UIColor.red
            }, completion: { _ in
                self.audioPlayer.pause()
                self.playing = false
                self.btnPlay.setImage(UIImage(named: "play"), for: .normal)
                
            })
            
        }
        
        
    }
    
    @IBAction func pressBtnProfile(){
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func pressBtnExit(){
        oUser.logout()
        oUser.saveData()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateUserViewController") as! CreateUserViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
  
    @IBAction func pressBtnPhotos(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
  

}
