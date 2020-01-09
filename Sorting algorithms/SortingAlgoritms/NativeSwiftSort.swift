//
//  NativeSwiftSort.swift
//  Sorting algorithms
//
//  Created by Alex on 27.08.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

struct NativeSwiftSort: Sortable {
        
    func sort<T>(elements: [T], completion: SortingResult) -> [T] where T: Comparable {
        
        let timer = Timer()
        var sortedArray = elements
        
        sortedArray.sort{  $0 > $1 }
        
        completion(timer.stop())
        return sortedArray
    }
}
