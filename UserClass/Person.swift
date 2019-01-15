//
//  Person.swift
//  Parkflow
//
//  Created by Karl Michel Koerich on 2018-02-06.
//  Copyright © 2018 Hamko. All rights reserved.
//

import Foundation

class Person {
    
    let first_name: String
    let last_name: String
    let email: String
    let password: String
    //let credit_card: CreditCard //https://thinkmobiles.com/blog/how-much-cost-make-app-like-uber/
    //To continue Database coonection: MySql Workbench to Google cloud Database:
    //       https:cloud.google.com/sql/docs/mysql/admin-tools#workbench
    
    init (first_name: String, last_name: String, email: String, password: String){
        
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.password = password
    }
}
