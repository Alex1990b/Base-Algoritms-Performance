//
//  MergeSort.swift
//  Sorting algorithms
//
//  Created by Alex on 27.08.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

struct MergeSort: Sortable {
    
    var name: String! {
        return String(describing: self)
    }
    
    func sort<T>(elements: [T], completion: (Double) -> ()) -> [T] where T : Comparable {
        
        
        let timer = Timer()
        guard elements.count > 1 else { return elements }
        
        let sortedArray = mergeSort(elements)
        
        completion(timer.stop())
        return sortedArray
    }
    
  private  func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        
        return merge(leftArray, rightArray)
    }

   private func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        
        var orderedArray: [T] = []
        
        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            
            if leftElement < rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                orderedArray.append(rightElement)
                rightIndex += 1
            } else {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }
        
        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
        
        return orderedArray
    }
    
    
}
