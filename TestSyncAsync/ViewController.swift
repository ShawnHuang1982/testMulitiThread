//
//  ViewController.swift
//  TestSyncAsync
//
//  Created by  shawn on 29/03/2017.
//  Copyright © 2017 shawn. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var number1 = 0
    var number2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func buttonSerialAsync1Queue(_ sender: Any) {
        print("1. Serial + Async + only 1 Queue")
        let queue = DispatchQueue(label: "Queue")
        queue.async {
            self.number1 = 0; self.number2 = 0
            for _ in 1...10 {
                self.number1 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("1. number1:\(self.number1), number2:\(self.number2)")
               }
        }
        print("queue.async1")
        queue.async {
            for _ in 1...10 {
                self.number2 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("2. number1:\(self.number1), number2:\(self.number2)")
                }
        }
        print("queue.async2")
    }
    //------------------------------------------
    @IBAction func buttonSerialAsync2Queue(_ sender: Any) {
        print("2. Serial + Async + there're 2 Queue")
        let queue = DispatchQueue(label: "Queue")
        let queue2 = DispatchQueue(label: "Queue2")
        queue.async {
            self.number1 = 0; self.number2 = 0
            for _ in 1...10 {
                self.number1 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("1. number1:\(self.number1), number2:\(self.number2)")
               }
        }
        print("queue.async1")
        queue2.async {
            for _ in 1...10 {
                self.number2 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("2. number1:\(self.number1), number2:\(self.number2)")
                }
        }
        print("queue.async2")
    }
    //------------------------------------------
    @IBAction func buttonSerialSync1Queue(_ sender: Any) {
        print("3. Serial + Sync + only 1 Queue")
        let queue = DispatchQueue(label: "Queue")
        queue.sync {
            self.number1 = 0; self.number2 = 0
            for _ in 1...10 {
                self.number1 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("1. number1:\(self.number1), number2:\(self.number2)")
                }
        }
        print("queue.sync1")
        
        queue.sync {
            for _ in 1...10 {
                self.number2 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("2. number1:\(self.number1), number2:\(self.number2)")
                   }
        }
        print("queue.sync2")
    }
    //------------------------------------------
    @IBAction func buttonSerialSync2Queue(_ sender: Any) {
        print("4. Serial + Sync + there're 2 Queue")
        let queue = DispatchQueue(label: "Queue")
        let queue2 = DispatchQueue(label: "Queue2")
        queue.sync {
            self.number1 = 0; self.number2 = 0
            for _ in 1...10 {
                self.number1 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("1. number1:\(self.number1), number2:\(self.number2)")
                     }
        }
        print("queue.sync1")
        queue2.sync {
            for _ in 1...10 {
                self.number2 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("2. number1:\(self.number1), number2:\(self.number2)")
               }
        }
        print("queue.sync2")
    }
    
    //------------------------------------------
    @IBAction func buttonConcurrentAsync1Queue(_ sender: Any) {
        print("5. Concurrent + Async + only 1 Quere")
        number1 = 0; number2 = 0
        let queue = DispatchQueue(label: "Queue", attributes: DispatchQueue.Attributes.concurrent)
        queue.async {
            for _ in 1...10 {
                self.number1 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("1. number1:\(self.number1), number2:\(self.number2)")
            }
        }
        print("queue.async1")
        queue.async {
            for _ in 1...10 {
                self.number2 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("2. number1:\(self.number1), number2:\(self.number2)")
            }
        }
        print("queue.async2")
    }
    //------------------------------------------
    @IBAction func buttonConcurrentAsync2Queue(_ sender: Any) {
        print("6. Concurrent + Async + there're 2 queue")
        self.number1 = 0; self.number2 = 0
        
        let queue = DispatchQueue(label: "Queue", attributes: DispatchQueue.Attributes.concurrent)
        let queue2 = DispatchQueue(label: "Queue2", attributes: DispatchQueue.Attributes.concurrent)
        queue.async {
            for _ in 1...10 {
                self.number1 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("1. number1:\(self.number1), number2:\(self.number2)")
            }
        }
        print("queue.async1")
        queue2.async {
            for _ in 1...10 {
                self.number2 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("2. number1:\(self.number1), number2:\(self.number2)")
            }
        }
        print("queue.async2")
    }
    //------------------------------------------
    @IBAction func buttonConcurrentSync1Queue(_ sender: Any) {
        print("7. Concurrent + Sync + only 1 queue")
        self.number1 = 0; self.number2 = 0
        let queue = DispatchQueue(label: "Queue", attributes: DispatchQueue.Attributes.concurrent)
        queue.sync {
            for _ in 1...10 {
                self.number1 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("1. number1:\(self.number1), number2:\(self.number2)")
            }
        }
        print("queue.sync1")
        queue.sync {
            for _ in 1...10 {
                self.number2 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("2. number1:\(self.number1), number2:\(self.number2)")
            }
        }
        print("queue.sync2")
    }
    //------------------------------------------
    @IBAction func buttonConcurrentSync2Queue(_ sender: Any) {
        print("8. Concurrent + Sync + there're 2 queue")
        self.number1 = 0; self.number2 = 0
        let queue = DispatchQueue(label: "Queue", attributes: DispatchQueue.Attributes.concurrent)
        let queue2 = DispatchQueue(label: "Queue2", attributes: DispatchQueue.Attributes.concurrent)
        queue.sync {
            
            for _ in 1...10 {
                self.number1 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("1. number1:\(self.number1), number2:\(self.number2)")
            }
        }
        print("queue.sync1")
        queue2.sync {
            for _ in 1...10 {
                self.number2 += 1
                Thread.sleep(forTimeInterval: 0.1)
                print("2. number1:\(self.number1), number2:\(self.number2)")
            }
        }
        print("queue.sync2")
    }
    //------------------------------------------
    @IBAction func buttonAsync2QueueWithEqualPriority(_ sender: Any) {
        print("9.🏀,Async+Queue Qos 🎾 = 🏈")
        self.number1 = 0; self.number2 = 0
        let queue1 = DispatchQueue(label: "Queue1", qos: DispatchQoS.userInitiated)
        let queue2 = DispatchQueue(label: "Queue2", qos: DispatchQoS.userInitiated)
        queue1.async {
            for i in 1..<10 {
                print("🎾\(i)")
            }
        }
        queue2.async {
            for i in 1..<10 {
                print("🏈\(i)")
            }
        }
        
        for i in 1..<10 {
            print("🏀\(i)")
            print("----")
        }
    }
    //------------------------------------------
    @IBAction func buttonAsync2QueueWithDiffPriority(_ sender: Any) {
        print("10. 🏀,Async+Queue Qos 🎾 > 🏈")
        self.number1 = 0; self.number2 = 0
        let queue1 = DispatchQueue(label: "Queue1", qos: DispatchQoS.userInitiated)
        let queue2 = DispatchQueue(label: "Queue2", qos: DispatchQoS.background)
        queue1.async {
            for i in 1..<10 {
                print("🎾\(i)")
            }
        }
        queue2.async {
            for i in 1..<10 {
                print("🏈\(i)")
            }
        }
        for i in 1..<10 {
            print("🏀\(i)")
            print("----")
        }
    }
    //------------------------------------------
    @IBAction func buttonAsync2QueueWithConcurrentEqualPriority(_ sender: Any) {
        print("11. 🏀, Async+QueueConcurrent:🎾,🏈")
        let queue1 = DispatchQueue(label: "Queu1", qos: DispatchQoS.userInitiated, attributes: .concurrent)
        let queue2 = DispatchQueue(label: "Queu2", qos: DispatchQoS.userInitiated, attributes: .concurrent)
        queue1.async {
            for i in 1..<10 {
                print("🎾\(i)")
            }
        }
        queue2.async {
            for i in 1..<10 {
                print("🏈\(i)")
            }
        }
        
        for i in 1..<10 {
            print("🏀\(i)")
            print("----")
        }
    }
    //------------------------------------------
    @IBAction func buttonSetDispathQueueMain(_ sender: Any) {
        print("12. 🏀, Async+QueueMain:🎾,🏈")
        let task1 = {
            for i in 1..<10 {
                print("🎾\(i)")
            }
        }
        let task2 = {
            for i in 1..<10 {
                print("🏈\(i)")
            }
        }
        DispatchQueue.main.async(execute: task1)
        DispatchQueue.main.async(execute: task2)
        for i in 1..<10 {
            print("🏀\(i)")
            print("----")
        }
    }
    //------------------------------------------
    @IBAction func buttonSetDispathQueueGlobal(_ sender: Any) {
        print("13. 🏀, Async+QueueGlobal:🎾,🏈")
        let task1 = {
            for i in 1..<10 {
                print("🎾\(i)")
            }
        }
        let task2 = {
            for i in 1..<10 {
                print("🏈\(i)")
            }
        }
        DispatchQueue.global().async(execute: task1)
        DispatchQueue.global().async(execute: task2)
        for i in 1..<10 {
            print("🏀\(i)")
            print("----")
        }
    }
}

