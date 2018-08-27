//
//  ViewController.swift
//  Sorting algorithms
//
//  Created by Alex on 23.08.18.
//  Copyright © 2018 alex. All rights reserved.
//

import UIKit


final class SortViewController: UIViewController {
    
    @IBOutlet private weak var sortTableView: UITableView!
    
    private var testArray = [Int]()
    private var sortedArray = [Int]()
    private var sortStrategy: Sortable!
    private var dataSource =  [(name: String, time: Double)]()
    private let numbers = 100000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testArray = (0...numbers).map{ _ in Int(arc4random_uniform(UInt32(numbers))) }
        
        sortStrategy = BubbleSort()
         // Best-Case Complexity: О(n) Worst-Case Complexity: О(n^2)
        performSorting()
        
        sortStrategy = InsertionSort()
         // Best-Case Complexity: О(n) Worst-Case Complexity: О(n^2)
        performSorting()
        
        sortStrategy = SelectionSort()
         // Best-Case Complexity: O(n2) Worst-Case Complexity: О(n^2)
        performSorting()
        
        sortStrategy = MergeSort()
         // Best-Case Complexity: O(n log(n)) Worst-Case Complexity: O(n log(n))
        performSorting()
        
        sortStrategy = HeapSort()
         // Best-Case Complexity: O(n log(n)) Worst-Case Complexity: O(n log(n))
        performSorting()
        
        sortStrategy = QucikSort()
         // Best-Case Complexity: O(n log(n)) Worst-Case Complexity: O(n2)
        performSorting()
        
    
        sortStrategy = NativeSwiftSort()
        performSorting()
    }
}

private extension SortViewController {
    func performSorting() {
        sortedArray = sortStrategy.sort(elements: testArray) { [weak self] time in
            dataSource.append((name: sortStrategy.name, time: time))
            self?.sortTableView.reloadData()
        }
    }
}

extension SortViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let data = dataSource[indexPath.row]
        cell.textLabel?.text = data.name + "  -  " + String(Float(data.time)) + " seconds"
    
        return cell
    }
}


