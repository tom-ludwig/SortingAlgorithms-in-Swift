//
//  SortingAlgorithms.swift
//  SortingAlgorithms
//
//  Created by Tommy Ludwig on 01.06.23.
//

import Foundation

class SortingAlgorithms {
    /// Bubble Sort is typically used for studying sorting rather than used in production code,
    /// and the implementation shown here is not recommended to be copied and pasted into production code under any circumstances!
    func bubbleSort(dataSet: inout [DataModel]) {
        let lastIndex = dataSet.count - 1
        guard lastIndex > 0 else {
            return
        }
        
        for currentIndex in 0..<lastIndex {
            var swapped = false
            
            for comparisonIndex in 0..<lastIndex-currentIndex {
                if dataSet[comparisonIndex].fileURL > dataSet[comparisonIndex + 1].fileURL {
                    dataSet.swapAt(comparisonIndex, comparisonIndex + 1)
                    swapped = true
                }
            }
            if !swapped {
                break
            }
        }
    }
    
    func insertionSort(dataSet: inout [DataModel]) {
        guard dataSet.count > 1 else { return }
        
        for currentIndex in 1..<dataSet.count {
            let key = dataSet[currentIndex]
            var previousIndex = currentIndex - 1
            
            while previousIndex >= 0 && dataSet[previousIndex].fileURL > key.fileURL {
                dataSet[previousIndex + 1] = dataSet[previousIndex]
                previousIndex -= 1
            }
            
            dataSet[previousIndex + 1] = key
        }
    }
    
    func selectionSort(dataSet: inout [DataModel]) {
        for index in 0..<dataSet.count - 1 {
            var minIndex = index
            
            for nextIndex in (minIndex + 1)..<dataSet.count {
                if dataSet[nextIndex].fileURL < dataSet[minIndex].fileURL {
                    minIndex = nextIndex
                }
            }
            
            if minIndex != index {
                dataSet.swapAt(index, minIndex)
            }
        }
    }
    
    func mergeSort(dataSet: [DataModel]) -> [DataModel] {
        guard dataSet.count > 1 else {
            return dataSet
        }
        
        let middleIndex = dataSet.count / 2
        let leftArray = mergeSort(dataSet: Array(dataSet[0..<middleIndex]))
        let rightArray = mergeSort(dataSet: Array(dataSet[middleIndex..<dataSet.count]))
        
        return merge(leftArray, rightArray)
    }
    
    func merge(_ leftArray: [DataModel], _ rightArray: [DataModel]) -> [DataModel] {
        var mergedArray = [DataModel]()
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < leftArray.count && rightIndex < rightArray.count {
            if leftArray[leftIndex].fileURL < rightArray[rightIndex].fileURL {
                mergedArray.append(leftArray[leftIndex])
                leftIndex += 1
            } else {
                mergedArray.append(rightArray[rightIndex])
                rightIndex += 1
            }
        }
        
        mergedArray += Array(leftArray[leftIndex..<leftArray.count])
        mergedArray += Array(rightArray[rightIndex..<rightArray.count])
        
        return mergedArray
    }
    
    func quickSort(dataSet: inout [DataModel], low: Int, high: Int) {
        if low < high {
            let pivotIndex = partition(&dataSet, low: low, high: high)
            quickSort(dataSet: &dataSet, low: low, high: high - 1)
            quickSort(dataSet: &dataSet, low: pivotIndex + 1, high: high)
        }
    }
    
    func partition(_ dataSet: inout [DataModel], low: Int, high: Int) -> Int {
        let pivot = dataSet[high]
        var index = low
        
        for currentIndex in low..<high {
            if dataSet[currentIndex].fileURL <= pivot.fileURL {
                dataSet.swapAt(index, currentIndex)
                index += 1
            }
        }
        
        dataSet.swapAt(index, high)
        
        return index
    }
}
