//
//  DataBaseManger.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 25/02/24.
//

import UIKit
import CoreData


class DataBaseManger {
    
    private var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    
    func updateJapaData(_ japaModel: japaMandalaModel){
        //creating new row
        let japaMandalaEntity = JapaMandalaEntity(context: context)
        
        japaMandalaEntity.date = japaModel.date
        japaMandalaEntity.mantra = japaModel.mantra
        japaMandalaEntity.setDetails = "\(Int(japaModel.NumberOfSets ?? 0)) * \(Int(japaModel.mantraSet ?? 0)) "
        japaMandalaEntity.count = japaModel.count
        
        save()
        
    }
    
    func fetchJapaDetails() -> [JapaMandalaEntity]{
        
        var JapaEntity: [JapaMandalaEntity] = []
        
        do {
            JapaEntity = try context.fetch(JapaMandalaEntity.fetchRequest())
        }catch{
            print("error in loading Data")
        }
        
        return JapaEntity
    }
    
    
    private func save(){
        do {
            try context.save()
            print("Data Saved")
        }catch{
            print("Faild to save data")
        }
    }
    
    
    func clerJapaData(entity: JapaMandalaEntity){
        context.delete(entity)
        save()
    }
    
    
    
}
