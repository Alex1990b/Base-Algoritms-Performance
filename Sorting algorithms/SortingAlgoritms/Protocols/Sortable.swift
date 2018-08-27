//
//  Sortable.swift
//  Sorting algorithms
//
//  Created by Alex on 27.08.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

protocol Sortable {
    var name: String! { get  }
    func sort<T: Comparable>( elements: [T], completion: (_ time: Double) -> ()) -> [T]
}
