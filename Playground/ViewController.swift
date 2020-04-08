//
//  ViewController.swift
//  Playground
//
//  Created by Melaka Atalugamage on 20/1/20.
//  Copyright © 2020 Melaka Atalugamage. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum ViewState {
        case normal, collapsed, expanded
    }
    
    lazy var normalStateOffset = {
       return UIScreen.main.bounds.height
    }()
    let collapsedStateOffset = 0
    lazy var expandedStateOffset = {
        return UIScreen.main.bounds.height * 2
    }()
    
    var currentState: ViewState = .normal

    @IBOutlet weak var imgHouse: UIImageView!
    @IBOutlet weak var imgBuildings: UIImageView!
    
    
    @IBOutlet weak var lblCannot: UILabel!
    @IBOutlet weak var lblCan: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.isPagingEnabled = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateUI(for: .normal, animated: false)
    }
    
    func updateUI(for state: ViewState, animated: Bool = true) {
        currentState = state
        switch state {
        case .normal:
            let offset = CGPoint(x: 0, y: normalStateOffset)
            scrollView.setContentOffset(offset, animated: animated)
        case .collapsed:
            let offset = CGPoint(x: 0, y: collapsedStateOffset)
            scrollView.setContentOffset(offset, animated: animated)
        case .expanded:
            let offset = CGPoint(x: 0, y: expandedStateOffset)
            scrollView.setContentOffset(offset, animated: animated)
        }
    }
}


extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        print("offset \(offset)")
        guard offset > 0 else {
            return
        }
        let scale1 = 1 + (offset/2600)
        let transform1 = CGAffineTransform(scaleX: scale1, y: scale1)
        imgBuildings.transform = transform1
        
     
        
        lblCan.alpha = 1 - offset/260
        lblCannot.alpha = offset/260
        
        
        if 818 > offset && offset > 0 {
            //collapsed to normal
            
        } else if 818 < offset && offset < 1178  {
            //normal to expanded
            let scale2 = 1 + (offset/3600)
            let transform2 = CGAffineTransform(scaleX: scale2, y: scale2)
            imgHouse.transform = transform2
        }
    }
//
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//
//        if velocity.y > 0.5 {
//          //  print("Scroll up - snap")
//            if currentState == .normal {
//                updateUI(for: .expanded)
//            }
//
//            if currentState == .collapsed {
//                updateUI(for: .normal)
//            }
//        }
//        if velocity.y < -0.5 {
//           // print("Scroll down - snap")
//            if currentState == .normal {
//                updateUI(for: .collapsed)
//            }
//
//            if currentState == .expanded {
//                updateUI(for: .normal)
//            }
//        }
//    }
}
