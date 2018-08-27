//
//  InsertionSort.swift
//  Sorting algorithms
//
//  Created by Alex on 27.08.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

struct InsertionSort: Sortable {
    var name: String! {
        return String(describing: self)
    }
    
    func sort<T>(elements: [T], completion: (Double) -> ()) -> [T] where T : Comparable {
        
        let timer = Timer()
        var sortedArray = elements
        let count = elements.count
        
        for index1 in 1..<count {
            
            var index = index1
            let temp = sortedArray[index1]
            
            while index > 0 && temp < sortedArray[index - 1] {
                
                sortedArray.swapAt(index, index - 1)
                index -= 1
            }
        }
        
        completion(timer.stop())
        return sortedArray
    }
    
    
}
