import UIKit

// Multithreading: Doing multiple asys tasks

// 1.GCD - Grand Central Dispatch
// 2.Operation and Operation Queues
// 3.Swift Concurrency - ios 13.0 Await-Async
// 4.NSTHread/Thread
// 5.DispatchQueues
// 6.PerformSelector
// 7.Libraries - Combine
// third party - PromiseKit, RXSwift, AsyncDisplayKit

// 1.GCD -- FIFO (First in First Out)
// Tasks are added in to queue and then GCD picks the oldest task and execute it first
// 3 Types of Queue:
// Main Queue - Anything related to UI
// Serial Queues or Custom Queues
// Global Queues

//Main Queue

DispatchQueue.main.async {
    print("Don't put too many things in here")
}

//Serial Queues/Custom Queues
let serialqueue = DispatchQueue(label: "com.multuthreading.serialqueue")

serialqueue.async {
    let basket = [5]
    for item in basket {
        print(item)
    }
}

serialqueue.async {
    print("This is a serial queue")
}

//Global queue
DispatchQueue.global(qos: .background).async {
    print("Task started")
    var x = 0
    if x < 5 {
        x += 1
        print(x)
    }
    print("Task finished")
}

DispatchQueue.global(qos: .background).async {
    print("Task started")
    var y = 10
    if y < 15 {
        y += 1
        print(y)
    }
    print("Task finished")
}
