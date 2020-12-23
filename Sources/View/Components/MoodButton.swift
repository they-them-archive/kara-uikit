// Copyright 2020 @they-them.

import UIKit

class MoodButton: UIButton {
    required init(mood: MoodType, backgroundColor: UIColor) {
        super.init(frame: .zero)

        // Disable translate autoresizing mask into constraints.
        self.translatesAutoresizingMaskIntoConstraints = false
        // Set text colour to white.
        self.setTitleColor(.white, for: .normal)
        // Set title to capitalized rawValue of provided mood.
        self.setTitle(mood.rawValue.capitalized, for: .normal)
        // Set font to bold body preferred font.
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: .body).pointSize)
        // Set background colour.
        self.backgroundColor = backgroundColor
        // Set corner radius to make rounded rectangle.
        layer.cornerRadius = 25.0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
