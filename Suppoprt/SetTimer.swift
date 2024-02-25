//
//  SetTimer.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 25/02/24.
//

import Foundation


class SetTimer{
    
    func secondsToHourMinuteSecond(_ seconds: Int) -> (Int, Int, Int){
        return ((seconds/3600), ((seconds % 3600)/60) , ((seconds % 3600)%60))
    }
    
    func hourMinuteSecToSeconds(_ hour: Int,_ minutes: Int,_ sec: Int) -> Int{
        return (hour*3600) + (minutes*60) + sec
    }
    
    func makeTimeString(_ hour: Int, _ minute: Int, _ second: Int) -> String{
        
        var timeString = ""
        timeString += String(format: "%02d", hour)
        timeString += " : "
        timeString += String(format: "%02d", minute)
        timeString += " : "
        timeString += String(format: "%02d", second)
        
        return timeString
        
    }
    
}
