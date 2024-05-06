//
//  TodoModel.swift
//  Dooit
//
//  Created by cavID on 01.05.24.
//

import Foundation


struct TodoModel {
    let id = UUID().uuidString
    var isPinned:Bool = false
    var isCompleted:Bool = false
    var title:String
    var subTitle:String
    var category:Category?
}
