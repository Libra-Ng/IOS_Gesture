//
//  ViewController.swift
//  Gesture
//
//  Created by student on 2019/10/30.
//  Copyright © 2019 吴谭波. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Custom View"
        self.view.backgroundColor = UIColor.white

        let addBtn = UIBarButtonItem(title: "添加", style: .plain, target: self, action: #selector(addView))
        let moveBtn = UIBarButtonItem(title: "移动", style: .plain, target: self, action: #selector(moveViews))
        self.navigationItem.rightBarButtonItems = [addBtn, moveBtn]

        let clearBtn = UIBarButtonItem(title: "清空", style: .plain, target: self, action: #selector(clearView))
        self.navigationItem.leftBarButtonItem = clearBtn
    }
    @objc func addView() {
        let maxWidth: CGFloat = 150

        let x = CGFloat(arc4random() % UInt32(self.view.bounds.width))
        let y = CGFloat(arc4random() % UInt32(self.view.bounds.height - 40)) + 40
        let point = CGPoint(x: x, y: y)

        let width = CGFloat(arc4random() % UInt32(maxWidth))
        let height = CGFloat(arc4random() % UInt32(maxWidth))
        let size = CGSize(width: width, height: height)

        let view = MyView(frame: CGRect(origin: point, size: size))
        self.view.addSubview(view)
    }
    @objc func clearView() {
        self.view.subviews.map { $0.removeFromSuperview() }
    }
    @objc func moveViews() {
        self.view.subviews.map { (view) in
            let x = CGFloat(arc4random() % UInt32(self.view.bounds.width))
            let y = CGFloat(arc4random() % UInt32(self.view.bounds.height - 40)) + 40
            let point = CGPoint(x: x, y: y)

            UIView.animate(withDuration: 3, animations: {
                view.center = point
            })
        }
    }
    

}

