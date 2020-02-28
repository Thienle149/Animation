//
//  ViewController.swift
//  shadow
//
//  Created by thienle on 2/27/20.
//  Copyright © 2020 thienle. All rights reserved.
//

import UIKit
import SafariServices
class ViewController: UIViewController {
	
	
	var animationView: UIView!
	var animationViewTwo: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		animationView = getAnimationView()
		self.view.addSubview(animationView)
		
		animationViewTwo = getAnimationView(frame: CGRect(x: 50, y: 300, width: 200, height: 200))
		self.view.addSubview(animationViewTwo)
		
		loadShadowOvalOne()
		loadShadowOvalTwo()
	}
	
	func getAnimationView(frame: CGRect = CGRect(x: 50, y: 50, width: 200, height: 200)) ->UIView {
		let view = UIView(frame: frame)
		view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
		view.layer.shadowRadius = 5
		view.layer.shadowOpacity = 0.4
		view.layer.shadowColor = UIColor.red.cgColor
		return view
	}
	
	func loadShadowOvalOne() {
		let shadowSize: CGFloat = 20
			let shadowDistance: CGFloat = 20
			let contactRect = CGRect(x: -shadowSize, y: 200 - (shadowSize * 0.4) + shadowDistance, width: 200 + shadowSize * 2, height: shadowSize)
			animationView.layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
	}
	
	func loadShadowOvalTwo() {
		let shadowSize: CGFloat = 20
		let contactRect = CGRect(x: -shadowSize, y: 200 - (shadowSize * 0.5), width: 200 + shadowSize * 2, height: shadowSize)
				animationViewTwo.layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
	}
	
	
}

