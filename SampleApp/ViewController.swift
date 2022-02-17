//
//  ViewController.swift
//  SampleApp
//
//  Created by Kiri Haran on 2/17/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        CallServices().getApiResponce { (responce) in
            print(responce)
        } faliure: { (error) in
            print(error)
        }

    }
    
}

