//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var eggTimes = ["Soft": 3, "Medium": 5,"Hard":8]
    var timer = Timer()
    
    
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            if self.eggTimes[hardness]! > 0 {
                print ("\(String(describing: self.eggTimes[hardness]!)) seconds")
                self.eggTimes[hardness]! -= 1
                } else {
                    Timer.invalidate()
                    self.titulo.text = "done"
                }
            
        
    }
}
    @IBOutlet weak var titulo: UILabel!
    
      
    
}
