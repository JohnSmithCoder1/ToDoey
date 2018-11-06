//
//  Data.swift
//  ToDoey
//
//  Created by Banana Viking on 11/6/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    //dynamic allows realm to monitor these values for changes even while the app is running
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}
