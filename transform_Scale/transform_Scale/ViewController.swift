//
//  ViewController.swift
//  transform_Scale
//
//  Created by thienle on 2/27/20.
//  Copyright © 2020 thienle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var animationView: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		animationView = getAnimationView()
		self.view.addSubview(animationView)
	}

	func getAnimationView() -> UIView {
		let animation = transformScale()
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		view.backgroundColor = .red
		view.layer.borderColor = UIColor.gray.cgColor
		view.layer.borderWidth = 5
		view.layer.add(animation, forKey: nil)
		return view
	}

	func transformScale() ->CABasicAnimation {
		let animation = CABasicAnimation(keyPath: "transform.scale")
		animation.setValue("tranformID", forKey: "ID")
		animation.fromValue = 0
		animation.toValue = 1
		animation.duration = 1
		animation.repeatCount = Float.infinity
		animation.autoreverses = true
		return animation
	}
}

