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
  static func createModule() -> UIViewController & HelloWorldScreenViewProtocol
}

protocol HelloWorldScreenViewProtocol {
  var viewModel: HelloWorldScreenViewModelProtocol? { get set }
}

protocol HelloWorldScreenViewModelProtocol {
  var messages: PublishSubject<[String]> { get }
  func viewDidLoad()
  func refresh()
}
