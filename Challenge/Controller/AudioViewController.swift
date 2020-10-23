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
    @IBOutlet weak var labelSong: UILabel!
    
    var audioPlayer = AVAudioPlayer()

    var playing = false
    let song = "halloween"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelSong.text = song
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
  

}
