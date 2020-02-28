//
//  HelloWorldScreenProtocols.swift
//  MVVM
//
//  Created by mhlee on 2020/02/07.
//  Copyright © 2020 mhlee. All rights reserved.
//

import Foundation
import RxSwift

protocol HelloWorldScreenCoordinatorProtocol {
  static func createModule() -> HelloWorldScreenViewProtocol
  
  func presentRandomNumberScreenFrom(_ view: HelloWorldScreenViewProtocol)
}

protocol HelloWorldScreenViewProtocol {
  var viewModel: HelloWorldScreenViewModelProtocol? { get set }
}

protocol HelloWorldScreenViewModelProtocol {
  var coordinator: HelloWorldScreenCoordinatorProtocol? { get set }

  func viewDidLoad()
  func presentRandomNumberScreenFrom(_ view: HelloWorldScreenViewProtocol)
}
