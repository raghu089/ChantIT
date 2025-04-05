//
//  Constants.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 08/09/23.
//

import Foundation
import UIKit


struct Constants {
    
    // MARK: - Navigation Support
    // Only if I am using different storyboard
    
    static let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    
    // MARK: - Colors
    
    static let AppBlackConstant = "AppBlackConstat"
    static let backGround = "backGround"
    static let blackDarkLight = "blackDarkLight"
    static let orange = "Orange"
    static let orangeWhite = "orangeWhite"
    
    
    // MARK: - Button Names
    //Home
    static let japaMandala = "Japa Mandala"
    static let dhyana = "Dhyana"
    
    //JapaMandalaHV
    static let twentyOne = "21"
    static let oneHEight = "108"
    static let history = "History"
    
    //MantraAdd
    static let continueBtn = "Continue"  //common
    static let skipBtn = "Skip"
    
    //meditationHome
    static let setBtn = "Set"
    
    
    // MARK: - ViewControllers
    static let japaMandalaVC = "JapaMandalaHViewController"
    static let meditaionHomeVC = "meditaionHomeViewController"
    static let historyVC = "HistoryViewController"
    static let mantraDetailsVC = "MantraAddingViewController"
    static let meditationTimerVC = "MeditationTimerViewController"
    static let JMHomeVC = "JMHomeViewController"
    static let historyDetailsVC = "HistoryDetailsViewController"
    static let resultVC = "ResultViewController"
    
    //MARK: - Entity names (Core Data)
    
    static let dhyanaEntity = "DhyanaEntity"
    static let JapaEntity = "JapaMandalaEntity"

    // Testing

    var number = 40

    
}
