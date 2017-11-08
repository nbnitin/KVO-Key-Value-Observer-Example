//
//  Configuration.swift
//  practise
//
//  Created by Umesh Chauhan on 07/11/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class ConfigurationManager: NSObject {
    
  @objc dynamic var configuration : Configuration
   
    
    lazy private var dateFormatter : DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return df
    }()
    
    var createdAt: String  {
        return dateFormatter.string(from: configuration.createdAt)
    }
    
    var updatedAt: String  {
        return dateFormatter.string(from: configuration.createdAt)
    }
    
    init(withConfiguration configuration : Configuration) {
        self.configuration = configuration
        super.init()
    }
    
    func updateConfiguration(){
        configuration.updatedAt = Date()
    }
}
