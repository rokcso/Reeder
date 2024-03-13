//
//  CloudData.swift
//  Reeder
//
//  Created by rokcso on 2024/3/13.
//

import Foundation
import CoreData

struct CloudData {
    static let shared = CloudData()
    
    // 定义一个数据库容器变量，该容器默认为 private 的，同一应用中的不同用户的数据互不共享
    let container: NSPersistentCloudKitContainer
    // 容器初始化
    init(inMemory: Bool = false) {
        // 创建新容器并赋值给 container 变量，Reeder 为数据库名称
        container = NSPersistentCloudKitContainer(name: "Reeder")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { _,_ in })
    }
    
}
