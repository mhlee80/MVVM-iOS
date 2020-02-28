//
//  RandomNumberScreenProtocols.swift
//  MVVM
//
//  Created by mhlee on 2020-02-28.
//  Copyright © 2020 mhlee. All rights reserved.
//

import Foundation
import RxSwift

protocol RandomNumberScreenCoordinatorProtocol {
  static func createModule() -> RandomNumberScreenViewProtocol
  func dismiss(_ view: RandomNumberScreenViewProtocol)
}

protocol RandomNumberScreenViewProtocol {
  var viewModel: RandomNumberScreenViewModelProtocol? { get set }
}

protocol RandomNumberScreenViewModelProtocol {
  var coordinator: RandomNumberScreenCoordinator? { get set }
  var randomNumber: PublishSubject<Int> { get }
  
  func viewDidLoad()
  func refresh()
  func dismiss(_ view: RandomNumberScreenViewProtocol)
}
