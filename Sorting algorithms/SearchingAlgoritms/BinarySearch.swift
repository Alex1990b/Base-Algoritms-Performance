//
//  BinarySearch.swift
//  Swift sorting algorithms
//
//  Created by Oleksandr Bondar on 09.01.2020.
//  Copyright © 2020 alex. All rights reserved.
//

import Foundation

// Works only when collection is ordered

struct BinarySearch: Searchable {
    
    func search<T>(elements: [T], element: T, completion: (Double) -> ()) -> Bool where T: Comparable {
        
        let timer = Timer()
        
        var hasValue = false
        var left = 0
        var right = elements.count - 1
        
        while left <= right && !hasValue  {
            
            let middle = Int(floor(Double(left + right) / 2.0))
            
            if elements[middle] < element {
                left = middle + 1
            } else if elements[middle] > element {
                right = middle - 1
            } else {
                hasValue = true
            }
        }
        
        completion(timer.stop())
        return hasValue
    }
}
