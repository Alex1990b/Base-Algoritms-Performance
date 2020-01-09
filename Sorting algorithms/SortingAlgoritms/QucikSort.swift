//
//  QucikSort.swift
//  Sorting algorithms
//
//  Created by Alex on 27.08.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

struct QucikSort: Sortable {
        
    func sort<T>(elements: [T], completion: SortingResult) -> [T] where T: Comparable {
        
        let timer = Timer()
        
        var sotredArray = elements
        quickSort(array: &sotredArray, startIndex: 0, endIndex: sotredArray.count - 1)
        
        completion(timer.stop())
        return sotredArray
    }
}

private extension QucikSort {
    
    func quickSort<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) {
        if startIndex >= endIndex { return }
        let placedItemIndex = partition(array: &array, startIndex: startIndex, endIndex: endIndex)
        quickSort(array: &array, startIndex: startIndex, endIndex: placedItemIndex - 1)
        quickSort(array: &array, startIndex: (placedItemIndex + 1), endIndex: endIndex)
    }
    
    
    func partition<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) -> Int {
        var q = startIndex
        for index in startIndex..<endIndex {
            if array[index] < array[endIndex] {
                array.swapAt(q, index)
                q += 1
            }
        }
        array.swapAt(q, endIndex)
        
        return q
    }
}
