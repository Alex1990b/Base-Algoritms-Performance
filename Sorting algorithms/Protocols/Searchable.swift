//
//  Searchable.swift
//  Swift sorting algorithms
//
//  Created by Oleksandr Bondar on 09.01.2020.
//  Copyright © 2020 alex. All rights reserved.
//

import Foundation

protocol Searchable {
    var name: String! { get  }
    @discardableResult func search<T: Comparable & Hashable>(elements: [T], element: T,
                                                  completion: SortingResult) -> Bool
}

extension Searchable {
    
    var name: String! {
        return String(describing: self)
    }
}
