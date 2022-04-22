//
//  Task.swift
//  eduFlix
//
//  Created by Reya 14.04.22.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}

//
