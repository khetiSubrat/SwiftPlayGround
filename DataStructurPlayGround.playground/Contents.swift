import UIKit

var str = "Hello, playground"

// Stack
class Stack {
    var items: [Int]?
    var top = -1
    
     func push(data: Int) {
        top = top + 1
        self.items?.append(data)
       
    }
    func pop() {
        self.items?.removeLast()
    }
}

let s = Stack()
s.push(data: 5)
s.push(data: 7)
s.pop()
s.push(data: 10)

// LinkedList
class Node {
    var data: Int?
    var next: Node?
    init(data: Int) {
        self.data = data
    }
}

class LinkedList {
    var head: Node?
    var tail: Node?
    var top: Node?
    var prev: Node?
    func createNode(data: Int)-> Node {
        return Node(data: data)
    }
    
    func appendNode(data: Int) {
        let node = createNode(data: data)
        top = node
        if (head == nil) {
            head = node
        } else {
            var current = head
            while current?.next != nil {
                prev = current
                current = current?.next
            }
            current?.next = node
            top = current
        }
    }
    
    func printLinkedList() {
        var c = head
        while c != nil {
            print("The data is \(String(describing: c?.data))")
            c  = c?.next
        }
    }
    
    func appendAfter(data: Int) {
        var c = head
        while c?.data != data {
            c = c?.next
        }
        let node = Node(data: 9)
        node.next = c?.next
        c?.next = node
    }
    
    func appendBefor(data: Int) {
        let node = createNode(data: 10)
        var c = head
        while c?.next != nil {
            tail = c
            c = c?.next
        }
    }
    
    func reverse() {
        var current: Node?
        var next: Node?
        var prev: Node?
        
        current = head
        if (current != nil) {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
    }
    
}

var linkedList = LinkedList()
linkedList.appendNode(data: 5)
linkedList.appendNode(data: 6)
linkedList.appendNode(data: 7)
linkedList.appendNode(data: 8)
linkedList.appendAfter(data: 6)
linkedList.reverse()
linkedList.printLinkedList()

var linkedList1 = LinkedList()
linkedList.appendNode(data: 1)
linkedList.appendNode(data: 2)
linkedList.appendNode(data: 3)
linkedList.appendNode(data: 4)

var linkedList2 = LinkedList()
linkedList.appendNode(data: 5)
linkedList.appendNode(data: 6)
linkedList.appendNode(data: 7)
linkedList.appendNode(data: 8)



func mergeLinkedList(l1: LinkedList, l2:LinkedList) {
    
}


class NodeT {
    var data: Int?
    var leftNode: NodeT?
    var rightNode: NodeT?
    init(data: Int) {
        self.data = data
        self.leftNode = nil
        self.rightNode = nil
    }
}

class Tree {
    var root: NodeT?
    
    init() {
        self.root = nil
    }
    
    func newTNode(data: Int)-> NodeT {
        return NodeT(data: data)
    }
    
    func createNode(data: Int)-> NodeT {
        if (root == nil) {
            return newTNode(data: data)
        } else {
            let value  = root?.data
            if (data > value!) {
                root?.leftNode = createNode(data: value!)
                let v = root?.leftNode
                return v!
            } else {
                root?.rightNode = createNode(data: value!)
                let v = root?.rightNode
                return v!
            }
        }
        
        return root!
    }
    
    func printInorder(_ root:NodeT?) {
        if self.root == nil {
            return
        }
        printInorder(self.root?.leftNode)
        print("The value of Tree \(String(describing: self.root?.data))")
        printInorder(self.root?.rightNode)
    }
    
}



var tree = Tree()
tree.root = tree.createNode(data: 1)
tree.root?.leftNode = tree.createNode(data:2)
tree.root?.rightNode = tree.createNode(data:2)
tree.printInorder(tree.root)

// Stack with LinkedList

class LinkedListStack {
    var data: Int?
    var next: LinkedListStack?
    init(_ data: Int) {
        self.data = data
        self.next = nil
    }
}

class StackLinkedList {
    var item: LinkedListStack?
    var prev: LinkedListStack?
    var top: LinkedListStack?
    
    func push(data: Int) {
        var linkedList = LinkedListStack(data)
        if (item == nil) {
            item = linkedList
        } else {
            var ptr = item
            while (ptr!.next != nil) {
                prev = ptr
                ptr = ptr?.next
            }
            ptr?.next = linkedList
            top = ptr?.next
        }
    }
    
    func printTheItem() {
        var ptr = item
        while (ptr != nil) {
            print(ptr?.data)
            ptr = ptr?.next
        }
    }
    
    func pop() {
        var ptr = item
        while ptr?.next != nil {
            prev = ptr
            ptr = ptr?.next
        }
        prev?.next = nil
    }
}

var stack = StackLinkedList()
stack.push(data: 5)
stack.push(data: 6)
stack.push(data: 7)
stack.push(data: 8)
stack.push(data: 9)
stack.push(data: 10)
stack.pop()
stack.pop()
stack.pop()
stack.printTheItem()

print("**************")
// Queue using Stack

/*struct Queue {
    var stack1: Stack?
    var stack2: Stack?
    var front = 0
    var rear = 0
    
    init() {
        self.stack1 = Stack()
    }
    
    func enQueue(_ data: Int) {
        self.stack1?.push(data: data)
    }
    
    func deQueue(_ data: Int) {
        if let stack =  self.stack1 {
            var count  =  stack.top
            while count >= 0 {
                if let stack2 = self.stack2 {
                    stack2.push(data: stack.items![count])
                    count = count + 1
                }
            }
            
            count = self.stack2!.top + 1
            //while count >=0 {
                
            //}
            
        }
        
        
    }
}*/



// Binary Search

func binarySearch(_ array:[Int], _ item: Int)->Int {
    var low = 0
    var high = array.count - 1
    
    while low < high {
        let mid =  (low + high) / 2
        
        if array[mid] == item {
            return mid
        } else {
            if array[mid] > item {
                high = mid - 1
            } else if array[mid] < item {
                low  = mid + 1
            }
        }
    }
    
    return -1
}

let v = binarySearch([1, 2, 3, 4, 5], 78)
print("The position is \(v)")

// Queue (First In and First Out)

struct Queue {
    var qArray = [Int]()
    var rear = 0
    var front = 0
    
    mutating func enQueue(data: Int) {
        qArray.insert(data, at: 0)
        
    }
    mutating func deQueue()-> Int {
        let va = qArray.popLast()
        qArray.removeLast()
        
        return va!
    }
}


var queue = Queue()
queue.enQueue(data: 1)
queue.enQueue(data: 2)
queue.enQueue(data: 3)
queue.enQueue(data: 4)
queue.enQueue(data: 5)
print("The deque element is \(queue.deQueue())")
queue.enQueue(data: 6)
queue.enQueue(data: 7)
queue.enQueue(data: 8)
print("The deque element is \(queue.deQueue())")

for i in  queue.qArray {
    print(i)
}


