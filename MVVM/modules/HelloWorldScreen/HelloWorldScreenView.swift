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
      
  private lazy var numberLabel: UILabel = {
    let v = UILabel()
    v.backgroundColor = .white
    v.textColor = .black
    v.font = .systemFont(ofSize: 48)
    return v
  }()
  
  private lazy var refreshButton: UIButton = {
    let v = UIButton()
    v.backgroundColor = .white
    v.layer.borderWidth = 1
    v.layer.borderColor = UIColor.black.cgColor
    v.setTitleColor(.black, for: .normal)
    v.titleLabel?.font = .systemFont(ofSize: 20)
    v.setTitle("refresh", for: .normal)
    return v
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
        
    view.backgroundColor = .white

    view.addSubview(numberLabel)
    view.addSubview(refreshButton)
    
    numberLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

    refreshButton.snp.makeConstraints { make in
      make.top.equalTo(numberLabel.snp.bottom).offset(10)
      make.size.equalTo(CGSize(width: 100, height: 30))
      make.centerX.equalTo(numberLabel)
    }

    DispatchQueue.main.async { [weak self] in
      self?.setupBind()
      self?.viewModel?.viewDidLoad()
    }
  }
  
  private func setupBind() {
    disposeBag = DisposeBag()
    
    viewModel?.randomNumber.subscribe(onNext: { [weak self] number in
      self?.numberLabel.text = "\(number)"
    }).disposed(by: disposeBag)
    
    refreshButton.rx.tap.subscribe(onNext: { [weak self] in
      self?.viewModel?.refresh()
    }).disposed(by: disposeBag)
  }
}
