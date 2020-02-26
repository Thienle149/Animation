//
//  ViewController.swift
//  Position
//
//  Created by thienle on 2/26/20.
//  Copyright © 2020 thienle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var circleView: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		circleView = getCircleView()
		view.addSubview(circleView)
	}
	
	func getCircleView() -> UIView {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
		view.backgroundColor = .red
		view.layer.cornerRadius = view.bounds.size.width / 2
		view.layer.add(positionXCircleView(), forKey: nil)
		return view
	}
	
	func positionXCircleView() ->CABasicAnimation {
		let animation = CABasicAnimation(keyPath: "position.x")
		animation.fromValue = 50
		animation.toValue = self.view.frame.width - 50
		animation.repeatCount = Float.infinity
		animation.autoreverses = true
		animation.duration = 1
		return animation
	}
	
}

