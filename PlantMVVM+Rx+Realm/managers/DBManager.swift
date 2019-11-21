//
//  DBManager.swift
//  Haulio
//
//  Created by saw pyaehtun on 15/07/2019.
//  Copyright © 2019 Haulio Pte Ltd. All rights reserved.
//

import Foundation
import RealmSwift

enum  ROname : String {
    case PlantRO
    case TipsRo
    case UpdloadedUserRO
}

class DBManager {
    private var   database:Realm
    static let   sharedInstance = DBManager()
    
    private init() {
        database = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    //MARK:- retrieve all from of one model
    func getDataFromDB(roName : ROname) ->   [Object]! {
        switch roName {
        case .PlantRO:
            let results: Results<PlantRO> =   database.objects(PlantRO.self)
            return Array(results)
        case .TipsRo:
            let results: Results<TipsRO> =   database.objects(TipsRO.self)
            return Array(results)
        case .UpdloadedUserRO:
            let results: Results<UploadedUserRO> =   database.objects(UploadedUserRO.self)
            return Array(results)
        }
    }
    
    
    // MARK:- UPDATE
    func update(object : Object, dictiionary : [String : Any?]) {
        do {
            try database.write {
                for (key,value) in dictiionary {
                    object.setValue(value, forKey: key)
                }
            }
        } catch let dberror {
            print("Realm Debug : error occur when updating \(dberror.localizedDescription)")
        }
    }
    
    //MARK: create or insert to database
    func addData(object : Object) {
        do{
            try database.write {
                database.add(object,update: .modified)
                print("completely added . . .")
            }
        } catch {
            print("Realm Debug : error occur when adding \(error)")
        }
    }
    
    func addData(objectArray: [Object])   {
        do{
            try database.write {
                database.add(objectArray, update: .modified)
                print("completely added . . .")
            }
        } catch {
            print("Realm Debug : error occur when adding \(error)")
        }
    }
    
    //MARK:- retrieve by predicate
        func getObjectById(id : String,roName : ROname) -> Object? {
            let predicate = NSPredicate(format: "id == \(id)")
            switch roName {
            case .PlantRO:
                let result = database.objects(PlantRO.self).filter(predicate)
                return result.count > 0 ? result[0] : nil
            case .TipsRo:
                let result = database.objects(TipsRO.self).filter(predicate)
                return result.count > 0 ? result[0] : nil
            case .UpdloadedUserRO:
                let result = database.objects(UploadedUserRO.self).filter(predicate)
                return result.count > 0 ? result[0] : nil
            }
        }
    
    func deleteObjectByID(id : String,roName : ROname) {
        do {
            let realm = try Realm()
            
            var object : Object? = nil
            
            switch roName {
            case .PlantRO:
                object = realm.objects(PlantRO.self).filter("plantId = %@", id).first
            case .TipsRo:
                break
            case .UpdloadedUserRO:
                break
            }

            try! realm.write {
                if let obj = object {
                    realm.delete(obj)
                }
            }
        } catch let error as NSError {
            // handle error
            print("error - \(error.localizedDescription)")
        }
    }
    
    //    func getObjArrayByKey(key : String,property : String,roName : ROname) -> [Object]? {
    //           let predicate = NSPredicate(format: "\(property) == \(key)")
    //
    //           switch roName {
    //           case .MovieRO:
    //               let result = database.objects(MovieRO.self).filter(predicate)
    //               return result.count > 0 ? Array(result) : nil
    //           case .GenreRO:
    //               let result = database.objects(GenreRO.self).filter(predicate)
    //               return result.count > 0 ? Array(result) : nil
    //           case .BookMarkRO:
    //               let result = database.objects(BookMarkRO.self).filter(predicate)
    //               return result.count > 0 ? Array(result) : nil
    //           case .ProductionCompanyRO:
    //               let result = database.objects(ProductionCompanyRO.self).filter(predicate)
    //               return result.count > 0 ? Array(result) : nil
    //           case .CategoryRO:
    //               let result = database.objects(CategoryRO.self).filter(predicate)
    //               return result.count > 0 ? Array(result) : nil
    //           }
    //
    //       }
    //
}

