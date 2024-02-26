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
    
   
    
    func playMusic(){
        
        let path = Bundle.main.path(forResource: "meditation.mp3", ofType:nil)!
        play(path)
        //infinite play loop
        player?.numberOfLoops = -1
        
    }
    
    func playtimeAlert(){
        
        let path = Bundle.main.path(forResource: "3sec.mp3", ofType:nil)!
        play(path)
        
    }
    
    
    func play(_ path: String){
        
         let url = URL(fileURLWithPath: path)
         
         do {
             player = try AVAudioPlayer(contentsOf: url)
             
             player?.play()
         } catch {
             // couldn't load file :(
             print(error)
         }
         
          
     }
    
    func stop(){
        player?.stop()
    }
    
    
}
