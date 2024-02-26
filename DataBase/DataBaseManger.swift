//
//  DataBaseManger.swift
//  ChantIT
//
//  Created by Bitjini Apps and More on 25/02/24.
//

import UIKit
import CoreData


final class DataBaseManger {
    
    static let shared = DataBaseManger()
    
    private init(){}
    
    private var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    //Upadating Japa value
    func updateJapaData(_ japaModel: japaMandalaModel){
        //creating new row
        let japaMandalaEntity = JapaMandalaEntity(context: context)
        
        japaMandalaEntity.date = japaModel.date
        japaMandalaEntity.mantra = japaModel.mantra
        japaMandalaEntity.setDetails = "\(Int(japaModel.NumberOfSets ?? 0)) * \(Int(japaModel.mantraSet ?? 0)) "
        japaMandalaEntity.count = japaModel.count
        
        save()
        
    }
    
    //Updating dhyana value
    func updateDhyanaData(_ dhyanaModel: Dhyana){
        //creating new row
        let dhyanaEntity = DhyanaEntity(context: context)
        
        dhyanaEntity.time = dhyanaModel.time
        dhyanaEntity.date = dhyanaModel.date
        dhyanaEntity.taget = dhyanaModel.taget
        
        save()
        
    }
    
    //fetching japa details
    func fetchJapaDetails() -> [JapaMandalaEntity]{
        
        var JapaEntity: [JapaMandalaEntity] = []
        
        do {
            JapaEntity = try context.fetch(JapaMandalaEntity.fetchRequest())
        }catch{
            print("error in loading Data")
        }
        
        return JapaEntity
    }
    
    //fetching dhyana details
    func fetchDhyanaDetails() -> [DhyanaEntity]{
        
        var dhyanaEntity: [DhyanaEntity] = []
        
        do {
            dhyanaEntity = try context.fetch(DhyanaEntity.fetchRequest())
        }catch{
            print("error in loading Data")
        }
        
        return dhyanaEntity
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
    
    func clerDhyanaData(entity: DhyanaEntity){
        context.delete(entity)
        save()
    }
    
    func deleteAllData(_ entityName: String){
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(deleteRequest)
        }catch{
            print("Error in deleting")
        }
        save()
    }
    
}
