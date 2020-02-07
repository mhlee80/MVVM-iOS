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
      
  private lazy var tableView: UITableView = {
    let v = UITableView()
    v.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    v.separatorStyle = .none
    v.refreshControl = refreshControl
    return v
  }()
  
  private lazy var refreshControl: UIRefreshControl = {
    let v = UIRefreshControl()
    return v
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
        
    view.backgroundColor = .white

    view.addSubview(tableView)
    
    tableView.snp.makeConstraints { make in
      make.top.left.bottom.right.equalTo(view.safeAreaLayoutGuide)
    }

    DispatchQueue.main.async { [weak self] in
      self?.setupBind()
      self?.viewModel?.viewDidLoad()
    }
  }
  
  private func setupBind() {
    disposeBag = DisposeBag()
    
    viewModel?.messages.asDriver(onErrorJustReturn: []).drive(tableView.rx.items(cellIdentifier: "Cell")) { _, message, cell in
      cell.textLabel?.text = message
    }.disposed(by: disposeBag)
    
    refreshControl.rx.controlEvent(.valueChanged).subscribe(onNext: { [weak self] in
      self?.viewModel?.refresh()
      self?.refreshControl.endRefreshing()
    }).disposed(by: disposeBag)
  }
}
