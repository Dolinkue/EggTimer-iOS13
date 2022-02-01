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
    
    var eggTimes = ["Soft": 5, "Medium": 15,"Hard":18]
    
    var player: AVAudioPlayer!
    var timer = Timer()
    var totalTime =  0
    var secondsPassed = 0
    
    
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        barpro.progress = 0.0
        secondsPassed = 0
        titulo.text = hardness
        
        
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            
            if secondsPassed < totalTime {
            
                barpro.progress = Float(secondsPassed)/Float(totalTime)
                
                secondsPassed += 1
                
                } else {
                    Timer.invalidate()
                    self.titulo.text = "DONE!"
                    barpro.progress = 1.0
                    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                                player = try! AVAudioPlayer(contentsOf: url!)
                                player.play()
                    
                
                }
            
        
    }
}
    @IBOutlet weak var titulo: UILabel!
    
    @IBOutlet weak var barpro: UIProgressView!
    
        
    
    
    
    
    
    
}
