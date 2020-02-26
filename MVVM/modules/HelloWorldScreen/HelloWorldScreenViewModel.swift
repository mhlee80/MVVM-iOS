//
//  HelloWorldScreenViewModel.swift
//  MVVM
//
//  Created by mhlee on 2020/02/05.
//  Copyright © 2020 mhlee. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HelloWorldScreenViewModel: NSObject, HelloWorldScreenViewModelProtocol {
  var messages = PublishSubject<[String]>()
  
  func viewDidLoad() {
    log.info("")
    loadMessages()
  }
  
  func refresh() {
    log.info("")
    loadMessages()
  }
  
  func loadMessages() {
    var messages = [String]()
    
    for _ in 0..<Int.random(in: 1..<10) {
      messages.append("Hello World")
    }
    
    self.messages.onNext(messages)
  }
}
