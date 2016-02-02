//
//  Team.swift
//  scout-viewer-2015-iOS
//
//  Created by Samuel Resendez on 1/23/16.
//  Copyright © 2016 Citrus Circuits. All rights reserved.
//

import UIKit

class Team: NSObject, Objectable {
    func toObject() -> NSDictionary {
        return self.dictionaryWithValuesForKeys(["name", "number", "calculatedData"])
    }
    var name = String()
    var number = -1
    var calculatedData = CalculatedTeamData()

}
