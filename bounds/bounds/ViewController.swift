//
//  ViewController.swift
//  bounds
//
//  Created by thienle on 2/26/20.
//  Copyright © 2020 thienle. All rights reserved.
//

import UIKit


enum CheckColor: String{
	case checked = "CHECK"
	case unchecked = "UNCHECK"
	
	var color: UIColor{
		switch self {
		case .checked:
			return .orange
		default:
			return .white
		}
	}
}



class ViewController: UIViewController {
	
	var animationView: UIView!
	var borderView: UIView!
	var isCheck: Bool = false
	let animationID = "ID"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		animationView = getAnimationView()
		self.view.addSubview(animationView)
		borderView = getBorderView()
		self.view.addSubview(borderView)
		
		borderView.addSubview(animationView)
		animationView.translatesAutoresizingMaskIntoConstraints = false
		
		animationView.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 20).isActive = true
		animationView.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -20).isActive = true
		animationView.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -20).isActive = true
		animationView.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 20).isActive = true
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(tapView))
		animationView.addGestureRecognizer(tap)
	}
	
	@objc func tapView() {
		self.isCheck = !self.isCheck
		var animation = self.animationBound(from: [0,0],to: [self.animationView.frame.width, self.animationView.frame.height], value: .checked)
		if !self.isCheck {
			animation = self.animationBound(from: [self.animationView.frame.width, self.animationView.frame.height],to: [0,0], value: .unchecked)
		}
		self.animationView.layer.add(animation, forKey: nil)
		
	}
	
	
	func getBorderView() -> UIView {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		view.layer.borderColor = UIColor.gray.cgColor
		view.layer.borderWidth = 10
		return view
	}
	
	func getAnimationView() -> UIView {
		let view = UIView()
		return view
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	func animationBound(from:[CGFloat],to: [CGFloat], value: CheckColor) -> CABasicAnimation {
		let animation = CABasicAnimation(keyPath: "bounds.size")
		animation.setValue(value.rawValue, forKey: animationID)
		animation.delegate = self
		animation.fromValue = from
		animation.toValue = to
		animation.repeatCount = 1
		animation.duration = 1
		return animation
	}
}

extension ViewController: CAAnimationDelegate {
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		if let valueAnimation = anim.value(forKey: animationID) as? String {
			if valueAnimation == CheckColor.checked.rawValue {
				animationView.backgroundColor = CheckColor.checked.color
			} else {
				animationView.backgroundColor = CheckColor.unchecked.color
			}
		}
	}
	
	func animationDidStart(_ anim: CAAnimation) {
		if let valueAnimation = anim.value(forKey: animationID) as? String {
			if valueAnimation == CheckColor.checked.rawValue {
				animationView.backgroundColor = CheckColor.checked.color
			}
		}
	}
}
