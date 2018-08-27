//
//  SelectionSort.swift
//  Sorting algorithms
//
//  Created by Alex on 27.08.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

struct SelectionSort: Sortable {
    
    var name: String! {
        return String(describing: self)
    }
    
    func sort<T>(elements: [T], completion: (Double) -> ()) -> [T] where T : Comparable {
    
        let timer = Timer()
        
        var sortedArray = elements
        
        let count = elements.count - 1
        var lowestIndex: Int!
        
        for index1 in 0..<count {
            
            lowestIndex = index1
            
            for index2 in (index1 + 1)..<count {
                if sortedArray[index2] > sortedArray[lowestIndex] {
                    lowestIndex = index2
                }
            }
            
            if index1 != lowestIndex {
                sortedArray.swapAt(index1, lowestIndex)
            }
        }
        
        completion(timer.stop())
        return sortedArray
    }
}
