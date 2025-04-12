//
//  CustomSegmentControlDelegate.swift
//  Mazaady
//
//  Created by Aya Baghdadi on 4/12/25.
//

import UIKit

class UnderlineSegmentedControl: UISegmentedControl {

    private var underlineView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        setupStyle()
    }

    private func setupStyle() {
        backgroundColor = .clear
        selectedSegmentTintColor = .clear

        // Remove system background & divider images
        setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)

        layer.borderWidth = 0
        layer.borderColor = UIColor.clear.cgColor
        layer.cornerRadius = 0 // Remove rounded corners from the segmented control itself

        let normalColor = UIColor(named: "color_text") ?? .gray
        let selectedColor = UIColor(named: "color_main") ?? .systemPink

        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: normalColor,
            .font: UIFont.systemFont(ofSize: 13, weight: .medium)
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: selectedColor,
            .font: UIFont.boldSystemFont(ofSize: 13)
        ]

        setTitleTextAttributes(normalAttributes, for: .normal)
        setTitleTextAttributes(selectedAttributes, for: .selected)
    }

    private func setupUnderline() {
        underlineView?.removeFromSuperview()

        let segmentWidth = bounds.width / CGFloat(numberOfSegments)
        let underlineHeight: CGFloat = 2
        let underlineY = bounds.height - underlineHeight
        let underlineX = segmentWidth * CGFloat(selectedSegmentIndex)

        underlineView = UIView(frame: CGRect(x: underlineX, y: underlineY, width: segmentWidth, height: underlineHeight))
        underlineView.backgroundColor = UIColor(named: "collor_main") ?? .systemPink
        underlineView.layer.cornerRadius = 0 // Remove rounded corners from the underline
        underlineView.clipsToBounds = true // Ensure it doesn't overflow its bounds
        addSubview(underlineView)
    }

    private func moveUnderline() {
        guard underlineView != nil else { return }

        let segmentWidth = bounds.width / CGFloat(numberOfSegments)
        let targetX = segmentWidth * CGFloat(selectedSegmentIndex)

        UIView.animate(withDuration: 0.3) {
            self.underlineView.frame.origin.x = targetX
        }
    }

    @objc private func segmentChanged() {
        moveUnderline()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupUnderline()
    }

    // Force a fixed height
    override var intrinsicContentSize: CGSize {
        let original = super.intrinsicContentSize
        return CGSize(width: original.width, height: 36)
    }
}

