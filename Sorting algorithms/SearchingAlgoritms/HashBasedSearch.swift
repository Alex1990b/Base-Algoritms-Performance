//
//  Hash-BasedSearch.swift
//  Swift sorting algorithms
//
//  Created by Oleksandr Bondar on 09.01.2020.
//  Copyright © 2020 alex. All rights reserved.
//

import Foundation

struct HashBasedSearch: Searchable {
    
    func search<T>(elements: [T], element: T, completion: (Double) -> ()) -> Bool where T: Comparable & Hashable {
        
        var hasValue = false
        var hashTable = HashTable<Int, T>(capacity: elements.count)
        
        // extra time to create hash table 0(n)
        elements.forEach {
            hashTable.updateValue($0, forKey: $0.hashValue)
        }
        
        let timer = Timer()
        
        hasValue = hashTable.value(forKey: element.hashValue) != nil
        
        completion(timer.stop())
        return hasValue
    }
}


//https://github.com/raywenderlich/swift-algorithm-club/blob/master/Hash%20Table/HashTable.playground/Sources/HashTable.swift

//        Average Worst-Case
// Space:   O(n)     O(n)
// Search:  O(1)     O(n)
// Insert:  O(1)     O(n)
// Delete:  O(1)     O(n)

struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]
    
    /// The number of key-value pairs in the hash table.
    private(set) public var count = 0
    
    /// A Boolean value that indicates whether the hash table is empty.
    public var isEmpty: Bool { return count == 0 }
    
    /**
     Create a hash table with the given capacity.
     */
    public init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeatElement([], count: capacity))
    }
    
    /**
     Accesses the value associated with
     the given key for reading and writing.
     */
    public subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        }
        set {
            if let value = newValue {
                updateValue(value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }
    
    /**
     Returns the value for the given key.
     */
    public func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil  // key not in hash table
    }
    
    /**
     Updates the value stored in the hash table for the given key,
     or adds a new key-value pair if the key does not exist.
     */
    @discardableResult public mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        // Do we already have this key in the bucket?
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index][i].value = value
                return oldValue
            }
        }
        
        // This key isn't in the bucket yet; add it to the chain.
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    /**
     Removes the given key and its
     associated value from the hash table.
     */
    @discardableResult public mutating func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        // Find the element in the bucket's chain and remove it.
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        return nil  // key not in hash table
    }
    
    /**
     Removes all key-value pairs from the hash table.
     */
    public mutating func removeAll() {
        buckets = Array<Bucket>(repeatElement([], count: buckets.count))
        count = 0
    }
    
    /**
     Returns the given key's array index.
     */
    private func index(forKey key: Key) -> Int {
        return abs(key.hashValue % buckets.count)
    }
}

extension HashTable: CustomStringConvertible {
    /// A string that represents the contents of the hash table.
    public var description: String {
        let pairs = buckets.flatMap { b in b.map { e in "\(e.key) = \(e.value)" } }
        return pairs.joined(separator: ", ")
    }
    
    /// A string that represents the contents of
    /// the hash table, suitable for debugging.
    public var debugDescription: String {
        var str = ""
        for (i, bucket) in buckets.enumerated() {
            let pairs = bucket.map { e in "\(e.key) = \(e.value)" }
            str += "bucket \(i): " + pairs.joined(separator: ", ") + "\n"
        }
        return str
    }
}
