//
//  Item.swift
//  ToDoey
//
//  Created by Banana Viking on 11/9/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var itemDescription = ""
    @objc dynamic var isChecked = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
