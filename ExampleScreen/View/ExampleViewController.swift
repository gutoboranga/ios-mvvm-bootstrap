//
//  ExampleViewController.swift
//  MyProject
//
//  Created by Augusto on 09/12/19.
//  Copyright © 2019 Augusto. All rights reserved.
//

import Foundation
import UIKit

class ExampleViewController: UIViewController {

    // MARK: - Attributes

    let viewModel: ExampleViewModel

    // MARK: - Init

    init(viewModel: ExampleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ExampleViewController", bundle: nil)
        viewModel.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - ExampleViewModelDelegate

extension ExampleViewController: ExampleViewModelDelegate {

}
