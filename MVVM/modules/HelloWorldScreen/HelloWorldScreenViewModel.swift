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
  var randomNumber = PublishSubject<Int>()
  
  func viewDidLoad() {
    log.info("")
    loadNumber()
  }
  
  func refresh() {
    log.info("")
    loadNumber()
  }
  
  func loadNumber() {
    let n = Int.random(in: 1..<1000)
    self.randomNumber.onNext(n)
//    var messages = [String]()
//
//    for _ in 0..<Int.random(in: 1..<10) {
//      messages.append("Hello World")
//    }
//
//    self.messages.onNext(messages)
  }
}
