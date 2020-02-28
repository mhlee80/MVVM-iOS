//
//  RandomNumberScreenCoordinator.swift
//  MVVM
//
//  Created by mhlee on 2020-02-28.
//  Copyright © 2020 mhlee. All rights reserved.
//

import Foundation
import UIKit

class RandomNumberScreenCoordinator: NSObject, RandomNumberScreenCoordinatorProtocol {
  static func createModule() -> RandomNumberScreenViewProtocol {
    let view = RandomNumberScreenView()
    let viewModel = RandomNumberScreenViewModel()
    let coordinator = RandomNumberScreenCoordinator()
    
    view.viewModel = viewModel
    viewModel.coordinator = coordinator

    return view
  }
  
  func dismiss(_ view: RandomNumberScreenViewProtocol) {
    if let v = view as? UIViewController {
      v.dismiss(animated: true, completion: nil)
    }
  }
}
