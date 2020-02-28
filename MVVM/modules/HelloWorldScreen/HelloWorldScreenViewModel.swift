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
  var coordinator: HelloWorldScreenCoordinatorProtocol?
  
  func viewDidLoad() {
    log.info("")
  }
  
  func presentRandomNumberScreenFrom(_ view: HelloWorldScreenViewProtocol) {
    coordinator?.presentRandomNumberScreenFrom(view)
  }
}
