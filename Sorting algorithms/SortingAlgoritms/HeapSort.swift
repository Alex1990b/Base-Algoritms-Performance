//
//  HeapSort.swift
//  Sorting algorithms
//
//  Created by Alex on 27.08.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

struct HeapSort: Sortable {
    
    func sort<T>(elements: [T], completion: SortingResult) -> [T] where T: Comparable {
        
        let timer = Timer()
        var sortedArray = elements
        
        heapsort(list: &sortedArray)
        
        completion(timer.stop())
        return sortedArray
    }
}

private extension HeapSort {
    
    private func heapsort<T: Comparable>(list: inout [T]) {
        var count = list.count
        
        func shiftDown( list:inout [T], start:Int, end:Int) {
            var root = start
            
            while root * 2 + 1 <= end {
                let child = root * 2 + 1
                var swap = root
                
                if list[swap] < list[child] {
                    swap = child
                }
                
                if child + 1 <= end && list[swap] < list[child + 1] {
                    swap = child + 1
                }
                
                if swap == root {
                    return
                } else {
                    (list[root], list[swap]) = (list[swap], list[root])
                    root = swap
                }
            }
        }
        
        func heapify(list: inout [T], count: Int) {
            var start = (count - 2) / 2
            
            while start >= 0 {
                shiftDown(list: &list, start: start, end: count - 1)
                
                start -= 1
            }
        }
        
        heapify(list: &list, count: count)
        
        var end = count - 1
        
        while end > 0 {
            (list[end], list[0]) = (list[0], list[end])
            
            end -= 1
            
            shiftDown(list: &list, start: 0, end: end)
        }
    }
}
