//
//  ExampleViewController.swift
//  MyProject
//
//  Created by Augusto on 09/12/19.
//  Copyright © 2019 Augusto. All rights reserved.
//

import Foundation
import UIKit

class ExampleViewModel {

    // MARK: - Attributes

    weak var delegate: ExampleViewModelDelegate?

    let router: ExampleRouter

    // MARK: - Init

    init(router: ExampleRouter) {
        self.router = router
    }

}
