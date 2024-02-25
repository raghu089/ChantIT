//
//  audioPlayer.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 24/02/24.
//

import Foundation
import AVFoundation
import UIKit

class audioPlayer: UIViewController{
    
    var player: AVAudioPlayer?
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        stop()
    }
    
   
    func play(){
        
        let path = Bundle.main.path(forResource: "meditation.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            
            player?.play()
        } catch {
            // couldn't load file :(
            print(error)
        }
        
         //infinite play loop
         player?.numberOfLoops = -1
    }
    
    func stop(){
        player?.stop()
    }
    
    
}
