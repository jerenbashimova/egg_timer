//
//  ViewController.swift
//  egg_timer
//
//  Created by j.bashimova on 28.06.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTime=["Soft":3,"Medium":5,"Hard":7]
    
    
    
    var timer=Timer()
    var total=0
    var secondPassed=0
   
    @IBAction func hardnessSelected(_ sender: UIButton) {
       
        
        timer.invalidate()
       
        let hardness=sender.currentTitle!
        
        total=eggTime[hardness]!
        
        progressBar.progress=0.0
        
        secondPassed=0
        
        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self,selector: #selector(updateTimer),userInfo: nil,repeats: true)
    }
         @objc func updateTimer(){
            if secondPassed<total{
               
                secondPassed+=1
                progressBar.progress=Float(secondPassed)/Float(total)
               
            }else{
                timer.invalidate()
                titleLabel.text="DONE!"
                let url = Bundle.main.url(forResource:"alarm_sound", withExtension: "mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
                        
            }
        }
   
}

