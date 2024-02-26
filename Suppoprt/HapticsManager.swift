//
//  HapticsManager.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 26/02/24.
//

import UIKit

final class HapticsManager {
    
    static let shered = HapticsManager()
    
    private init(){}
    
    public func selectionVibration(){
        DispatchQueue.main.async {
            let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
            selectionFeedbackGenerator.prepare()
            selectionFeedbackGenerator.selectionChanged()
        }
    }
    
    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType){
        
        let notificationGenerator = UINotificationFeedbackGenerator()
        notificationGenerator.prepare()
        notificationGenerator.notificationOccurred(type)
    }
    
    
}
