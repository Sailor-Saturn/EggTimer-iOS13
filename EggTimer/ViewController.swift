//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var secondsRemaining = 60
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        default:
//            print(hardTime)
//        }
        let hardness = sender.currentTitle!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if(secondsPassed < totalTime){
            secondsPassed += 1
            
            let percentageProgress : Float = Float(secondsPassed)/Float(totalTime)
           
            progressBar.progress = percentageProgress
            
            
        } else {
            timer.invalidate()
            titleLabel.text = "ACABOU TIRA A PANELA DO FOGÃO"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                        player = try! AVAudioPlayer(contentsOf: url!)
                        player.play()
        }
    }
    
    
}
