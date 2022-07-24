import UIKit

var greeting = "Hello, playground"

var array = [3, 98, 1]

func bubbleSort<T>(_ array: inout [T]) where T: Comparable {
    guard array.count >= 2 else { return }
    
    for i in 0..<array.count - 1 {
//        let index = array.count - i
        
        for j in 0..<array.count - i - 1 {
            let current = array[j]
            let next = array[j + 1]
            
            if current > next {
                array[j] = next
                array[j + 1] = current
            }
        }
    }
}

func bubbleSortByRayWenderlich<T>(_ array: inout [T]) where T: Comparable {
    guard array.count >= 2 else { return }
    
    for end in (0..<array.count).reversed() {
        var swapped = false
        
        for current in 0..<end {
            if array[current] > array[current + 1] {
                array.swapAt(current, current + 1)
                swapped = true
            }
        }
        if !swapped {
            return
        }
    }
}

bubbleSortByRayWenderlich(&array)
//bubbleSort(&array)
