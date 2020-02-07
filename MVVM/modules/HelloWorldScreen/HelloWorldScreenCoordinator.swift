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
  static func createModule() -> UIViewController & HelloWorldScreenViewProtocol {
    let view = HelloWorldScreenView()
    let viewModel = HelloWorldScreenViewModel()
    view.viewModel = viewModel

    return view
  }
}
