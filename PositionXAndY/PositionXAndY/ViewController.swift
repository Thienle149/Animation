//
//  ViewController.swift
//  PositionXAndY
//
//  Created by thienle on 2/26/20.
//  Copyright © 2020 thienle. All rights reserved.
//

import UIKit
enum AnimationCircle: String{
	case top = "animationTop"
	case left = "animationLeft"
	case bottom = "animationBottom"
	case right = "animationRight"
}
class ViewController: UIViewController {
	
	var circleView: UIView!
	var idAnimation = "ID"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		circleView = getCircleView()
		view.addSubview(circleView)
	}
	
	func getCircleView() -> UIView {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
		view.backgroundColor = .red
		view.layer.cornerRadius = view.bounds.size.width / 2
		let animationTop = positionXCircleView(from: 50, to: self.view.frame.width - 50, value: .top)
		view.layer.add(animationTop, forKey: "postionX")
		return view
	}
	
	func positionXCircleView(from: CGFloat, to: CGFloat, value: AnimationCircle) ->CABasicAnimation {
		let animation = CABasicAnimation(keyPath: "position.x")
		animation.fromValue = from
		animation.toValue = to
		animation.repeatCount = 1
		animation.setValue(value.rawValue, forKey: idAnimation)
		animation.duration = 2
		animation.delegate = self
		return animation
	}
	
	
	func positionYCircleView(from: [CGFloat], to: [CGFloat], value: AnimationCircle) ->CABasicAnimation {
		let animation = CABasicAnimation(keyPath: "position")
		animation.fromValue = from
		animation.toValue = to
		animation.repeatCount = 1
		animation.setValue(value.rawValue, forKey: idAnimation)
		animation.delegate = self
		animation.duration = 2
		return animation
	}
	
}

extension ViewController: CAAnimationDelegate {
	public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		if let animation = anim.value(forKey: idAnimation) as? String {
			if animation == AnimationCircle.top.rawValue {
				let animationRight = positionYCircleView(from: [self.view.frame.width - 50,50], to: [self.view.frame.width - 50,self.view.frame.height - 50], value: .right)
				self.circleView.layer.add(animationRight, forKey: nil)
			} else if animation == AnimationCircle.right.rawValue {
				let animationBottom = positionYCircleView(from: [self.view.frame.width - 50,self.view.frame.height - 50], to: [50,self.view.frame.height - 50], value: .bottom)
				self.circleView.layer.add(animationBottom, forKey: nil)
			} else if animation == AnimationCircle.bottom.rawValue {
				let animationLeft = positionYCircleView(from: [50,self.view.frame.height - 50], to: [50,50], value: .left)
				self.circleView.layer.add(animationLeft, forKey: nil)
			} else if animation == AnimationCircle.left.rawValue {
				let animationTop = positionXCircleView(from: 50, to: self.view.frame.width - 50, value: .top)
				self.circleView.layer.add(animationTop, forKey: "nil")
			}
			
		}
	}
	
}
