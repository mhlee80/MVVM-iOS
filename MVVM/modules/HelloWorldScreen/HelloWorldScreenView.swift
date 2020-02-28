//
//  HelloWorldScreenView.swift
//  MVVM
//
//  Created by mhlee on 2020/02/05.
//  Copyright © 2020 mhlee. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa

class HelloWorldScreenView: UIViewController, HelloWorldScreenViewProtocol {
  private var disposeBag = DisposeBag()
  
  var viewModel: HelloWorldScreenViewModelProtocol? {
    didSet {
      setupBind()
    }
  }
      
  private lazy var textLabel: UILabel = {
    let v = UILabel()
    v.backgroundColor = .white
    v.textColor = .black
    v.font = .systemFont(ofSize: 48)
    v.text = "Hello World"
    return v
  }()
    
  private lazy var presentButton: UIButton = {
    let v = UIButton()
    v.backgroundColor = .white
    v.layer.borderWidth = 1
    v.layer.borderColor = UIColor.black.cgColor
    v.setTitleColor(.black, for: .normal)
    v.titleLabel?.font = .systemFont(ofSize: 20)
    v.setTitle("present random number", for: .normal)
    return v
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
        
    view.backgroundColor = .white

    view.addSubview(textLabel)
    view.addSubview(presentButton)
    
    textLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

    presentButton.snp.makeConstraints { make in
      make.top.equalTo(textLabel.snp.bottom).offset(10)
      make.size.equalTo(CGSize(width: 250, height: 30))
      make.centerX.equalTo(textLabel)
    }
    
    DispatchQueue.main.async { [weak self] in
      self?.viewModel?.viewDidLoad()
    }
  }
  
  private func setupBind() {
    disposeBag = DisposeBag()
        
    presentButton.rx.tap.subscribe(onNext: { [weak self] in
        self?.viewModel?.presentRandomNumberScreenFrom(self!)
    }).disposed(by: disposeBag)
  }
}
