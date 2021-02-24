//
//  PasscodeSignPlaceholderView.swift
//  Photo Vault
//
//  Created by HASAN CAN on 10/8/20.
//  Copyright © 2020 pbstudio. All rights reserved.
//

import UIKit

@IBDesignable
open class PasscodeSignPlaceholderView: UIView {
    public enum State {
        case inactive
        case active
        case error
    }

    @IBInspectable
    open var cornerRadius: CGFloat = 6 {
        didSet {
            setupView()
        }
    }

    @IBInspectable
    open var inactiveColor: UIColor = UIColor.white {
        didSet {
            setupView()
        }
    }

    @IBInspectable
    open var activeColor: UIColor = UIColor.gray {
        didSet {
            setupView()
        }
    }

    @IBInspectable
    open var errorColor: UIColor = UIColor.red {
        didSet {
            setupView()
        }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override open var intrinsicContentSize: CGSize {
        return CGSize(width: 12, height: 12)
    }

    private func setupView() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = 1
        layer.borderColor = activeColor.cgColor
        backgroundColor = inactiveColor
    }

    private func colorsForState(_ state: State) -> (backgroundColor: UIColor, borderColor: UIColor) {
        switch state {
        case .inactive: return (inactiveColor, activeColor)
        case .active: return (activeColor, activeColor)
        case .error: return (errorColor, errorColor)
        }
    }

    open func animateState(_ state: State) {
        let colors = colorsForState(state)

        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0,
            options: [],
            animations: {
                self.backgroundColor = colors.backgroundColor
                self.layer.borderColor = colors.borderColor.cgColor
            },
            completion: nil
        )
    }
}
