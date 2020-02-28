//
//  RandomNumberScreenViewModel.swift
//  MVVM
//
//  Created by mhlee on 2020-02-28.
//  Copyright © 2020 mhlee. All rights reserved.
//

import Foundation
import RxSwift

class RandomNumberScreenViewModel: NSObject, RandomNumberScreenViewModelProtocol {
  var coordinator: RandomNumberScreenCoordinator?
  var randomNumber = PublishSubject<Int>()
  
  func viewDidLoad() {
    log.info("")
    loadNumber()
  }
  
  func refresh() {
    log.info("")
    loadNumber()
  }
  
  private func loadNumber() {
    let n = Int.random(in: 1..<1000)
    self.randomNumber.onNext(n)
  }
    
  func dismiss(_ view: RandomNumberScreenViewProtocol) {
    coordinator?.dismiss(view)
  }
}
