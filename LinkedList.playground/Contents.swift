import UIKit

//public class Node<Value> {
//    public var value: Value
//    public var next: Node?
//    public var count: Int {
//        var count = 1
//        var nextNode = next
//        while nextNode != nil {
//            count += 1
//            nextNode = nextNode?.next
//        }
//        return count
//    }
//
//    public init(value: Value, next: Node? = nil) {
//        self.value = value
//        self.next = next
//    }
//}
//
//extension Node: CustomStringConvertible {
//    public var description: String {
//        if let next = next {
//            return "\(value) -> \(next)"
//        }
//        return "\(value)"
//    }
//}
//
//let node1 = Node(value: 1)
//let node2 = Node(value: 2)
//let node3 = Node(value: 3)
//node1.next = node2
//node2.next = node3
//print(node1)
//node1.count
//
//public struct LinkedList<Value> {
//    public var head: Node<Value>?
//    public var tail: Node<Value>?
//
//    public init() {}
//
//    public var isEmpty: Bool {
//        head == nil
//    }
//
//    public mutating func push(_ value: Value) {
//        head = Node(value: value, next: head)
//        if tail == nil {
//            tail = head
//        }
//    }
//}
//
//extension LinkedList: CustomStringConvertible {
//    public var description: String {
//        guard let head = head else {
//            return "Empty list"
//        }
//        return String(describing: head)
//    }
//}
//
//var list = LinkedList<Int>()
//
//list.head = node1
//list.push(45)
//list.push(4)
//list.description

//struct LinkedList<T> {
//    var head: LinkedListNode<T>
//
//    init(head: LinkedListNode<T>) {
//        self.head = head
//    }
//}
//
//indirect enum LinkedListNode<T> {
//    case value(element: T, next: LinkedListNode<T>)
//    case end
//}
//
//let elementFourth = LinkedListNode.value(element: "4", next: .end)
//let elementThird = LinkedListNode.value(element: "3", next: elementFourth)
//let elementSecond = LinkedListNode.value(element: "2", next: elementThird)
//let elementFirst = LinkedListNode.value(element: "1", next: elementSecond)
//
//let list = LinkedList(head: elementFirst)
//
//extension LinkedList: Sequence {
//
//    func makeIterator() -> LinkedListIterator<T> {
//        LinkedListIterator(current: head)
//    }
//
//}
//
//struct LinkedListIterator<T>: IteratorProtocol {
//
//    var current: LinkedListNode<T>
//
//    mutating func next() -> T? {
//        switch current {
//        case .value(element: let element, next: let next):
//            current = next
//            return element
//        case .end:
//            return nil
//        }
//    }
//
//}
//
//list.contains("5")
//
//for element in list {
//    print(element)
//}

class ListNode {
    var value: Int
    var next: ListNode?
    
    init(value: Int, next: ListNode?) {
        self.value = value
        self.next = next
    }
}

let thirdNode = ListNode(value: 8, next: nil)
let secondNode = ListNode(value: 3, next: thirdNode)
let firstNode = ListNode(value: 1, next: secondNode)

func printNode(head: ListNode?) {
    var currentNode = head
    while currentNode != nil {
        print(currentNode?.value ?? 0)
        currentNode = currentNode?.next
    }
}

//printNode(head: firstNode)

func reverseList1(head: ListNode?) -> ListNode? {
    var current = head
    var next: ListNode?
    var prev: ListNode?
    
    while current != nil { // 1             // 2
        next = current?.next // next = 2    // 3
        current?.next = prev // nil         // 1
        prev = current // 1
        current = next // 2
    }
    
    return prev
}

//reverseList1(head: firstNode)
//thirdNode.next?.value

func reverseList(head: ListNode?) -> ListNode? {
    var currentNode = head
    var nextNode: ListNode?
    var previousNode: ListNode?
    
    while currentNode != nil {
        nextNode = currentNode?.next
        currentNode?.next = previousNode
        previousNode = currentNode
        currentNode = nextNode
    }
    
    return previousNode
}


func mergeTwoLinkedLists(firstList: ListNode?, secondList: ListNode?) -> ListNode? {
    guard firstList != nil else { return secondList }
    guard secondList != nil else { return firstList }
    
    let mockHead = ListNode(value: 0, next: nil)
    var l1 = firstList
    var l2 = secondList
    var endSortedList: ListNode? = mockHead
    
    while l1 != nil && l2 != nil {
        if l1!.value <= l2!.value {
            endSortedList?.next = l1
            l1 = l1!.next
        } else {
            endSortedList?.next = l2
            l2 = l2!.next
        }
        endSortedList = endSortedList?.next
    }
    endSortedList?.next = l1 == nil ? l2 : l1
    return mockHead.next
}


let node6 = ListNode(value: 10, next: nil)
let node5 = ListNode(value: 9, next: node6)
let node4 = ListNode(value: 6, next: node5)

let test = mergeTwoLinkedLists(firstList: firstNode, secondList: node4)
printNode(head: test)


public class Node<Value> {
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
        
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> \(String(describing: next))"
    }
    
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print(node1)

public struct LinkedList<T> {
    
    public var head: Node<T>?
    public var tail: Node<T>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public mutating func push(_ value: T) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: T) {
        if isEmpty {
            push(value)
        } else {
            tail?.next = Node(value: value, next: nil)
            tail = tail?.next
        }
    }
    
    public func node(at index: Int) -> Node<T>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode?.next != nil {
            if currentIndex == index {
                return currentNode
            } else {
                currentNode = currentNode?.next
                currentIndex += 1
            }
        }
        return nil
    }
    
    public mutating func insert(_ value: T, after node: Node<T>) {
        guard tail !== node else {
            append(value)
            return
        }
        
        node.next = Node(value: value, next: node.next)
    }
    
    public mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    public mutating func removeLast() -> T? {
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
    }
    
    public mutating func remove(after node: Node<T>) -> T? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
        
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "List is Empty"
        }
        return String(describing: head)
    }
    
}

var list = LinkedList<Int>()
list.push(3)
list.push(5)
list.push(7)

list.append(100)
list.tail

list.node(at: 2)

let node = list.node(at: 1)
list.insert(555, after: node!)
list.pop()
list
list.removeLast()
list
