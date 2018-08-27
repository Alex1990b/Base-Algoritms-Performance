//
//  BubbleSort.swift
//  Sorting algorithms
//
//  Created by Alex on 23.08.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

struct BubbleSort: Sortable {
  
    var name: String! {
        return String(describing: self)
    }
    
    func sort<T>(elements: [T], completion: (Double) -> ()) -> [T] where T : Comparable {
        
        let timer = Timer()
        
        var sortedArray = elements
        
        let count = elements.count - 1
        
        for index1 in 0..<count {
            for index2 in 0..<count - index1 {
                while sortedArray[index2] > sortedArray[index2 + 1] {
                    sortedArray.swapAt(index2, index2 + 1)
                }
            }
        }
        
        completion(timer.stop())
        return sortedArray
    }
}
