//
//  NativeSearch.swift
//  Swift sorting algorithms
//
//  Created by Oleksandr Bondar on 09.01.2020.
//  Copyright © 2020 alex. All rights reserved.
//

import Foundation

struct NativeSearch: Searchable {
    
    func search<T>(elements: [T], element: T, completion: (Double) -> ()) -> Bool where T: Comparable {
        
        let timer = Timer()
        let hasValue = elements.contains(element)
                
        completion(timer.stop())
        return hasValue
    }
}
