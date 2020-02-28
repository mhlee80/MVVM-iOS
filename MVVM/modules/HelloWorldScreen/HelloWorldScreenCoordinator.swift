//
//  HelloWorldScreenCoordinator.swift
//  MVVM
//
//  Created by mhlee on 2020/02/07.
//  Copyright © 2020 mhlee. All rights reserved.
//

import Foundation
import UIKit

class HelloWorldScreenCoordinator: NSObject, HelloWorldScreenCoordinatorProtocol {
  static func createModule() -> HelloWorldScreenViewProtocol {
    let view = HelloWorldScreenView()
    let viewModel = HelloWorldScreenViewModel()
    let coordinator = HelloWorldScreenCoordinator()
    
    view.viewModel = viewModel
    viewModel.coordinator = coordinator

    return view
  }
  
  func presentRandomNumberScreenFrom(_ view: HelloWorldScreenViewProtocol) {
    guard
      let sourceView = view as? UIViewController,
      let viewToPresent = RandomNumberScreenCoordinator.createModule() as? UIViewController else { return }
  
    viewToPresent.modalPresentationStyle = .fullScreen
    sourceView.present(viewToPresent, animated: true, completion: nil)
  }
}
