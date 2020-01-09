//
//  Timer.swift
//  Sorting algorithms
//
//  Created by Alex on 27.08.18.
//  Copyright © 2018 alex. All rights reserved.
//

import CoreFoundation

final class Timer {
    
    private let startTime: CFAbsoluteTime
    private var endTime: CFAbsoluteTime?
    
    private var duration: CFAbsoluteTime? {
        if let endTime = endTime {
            return Double(endTime - startTime)
        } else {
            return nil
        }
    }
    
    init() {
        startTime = CFAbsoluteTimeGetCurrent()
    }
    
    func stop() -> CFAbsoluteTime {
        endTime = CFAbsoluteTimeGetCurrent()
        
        return duration!
    }
}
