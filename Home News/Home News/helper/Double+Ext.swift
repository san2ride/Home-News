//
//  Double+Ext.swift
//  Home News
//
//  Created by Jason Sanchez on 10/1/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import Foundation

extension Double {
    var currencyFormatter: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(from: NSNumber(value: self))!
    }
}
