//
//  SequentialSearch.swift
//  Swift sorting algorithms
//
//  Created by Oleksandr Bondar on 09.01.2020.
//  Copyright © 2020 alex. All rights reserved.
//

import Foundation

struct SequentialSearch: Searchable {
    
    func search<T>(elements: [T], element: T, completion: (Double) -> ()) -> Bool where T: Comparable {
        
        let timer = Timer()
        var hasValue = false
        
        elements.forEach {
            if $0 == element {
                hasValue = true
            }
        }
                
        completion(timer.stop())
        return hasValue
    }
}
