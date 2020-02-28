//
//  ViewController.swift
//  borderWidth
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
		let animationWidth = animationBorderWidth()
		let animationColor = animationBorderColor()
		let view = UIView(frame: CGRect(x:0, y: 0, width: 200, height: 200))
		view.backgroundColor = .blue
		view.layer.add(animationWidth,forKey: nil)
		view.layer.add(animationColor, forKey: nil)
		return view
	}
	
	func animationBorderWidth() ->CABasicAnimation {
		let animation = CABasicAnimation(keyPath: "borderWidth")
		animation.fromValue = 0
		animation.toValue = 20
		animation.duration = 1
		animation.repeatCount = Float.infinity
		animation.autoreverses = true
		return animation
	}
	
	func animationBorderColor() ->CABasicAnimation {
		let animation = CABasicAnimation(keyPath: "borderColor")
		animation.fromValue = UIColor.brown.cgColor
		animation.toValue = UIColor.green.cgColor
		animation.duration = 0.5
		animation.repeatCount = Float.infinity
		animation.autoreverses = true
		return animation
	}
	
}

