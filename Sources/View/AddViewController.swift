// Copyright 2020 @they-them.

import UIKit

protocol AddViewDelegate {
    // Define our delegate method.
    func handleDismissFromAddView()
}

final class AddViewController: UIViewController {
    
    // MARK: Properties
    // Passed data source object.
    var dataSource: DataSource?
    // Create the delegate reference so the MainView.. can assign as self.
    var delegate: AddViewDelegate?
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call the createUI function.
        createUI()
    }
    
    private func createUI() {
        // Set the background color to systemBackground.
        view.backgroundColor = .systemBackground
        
        // Create buttons and assign targets to their own function.
        let greatButton = MoodButton(mood: .great, backgroundColor: .checkInEvergreen)
        greatButton.addTarget(self, action: #selector(handleGreatButtonPressed(sender:)), for: .touchUpInside)
        let goodButton = MoodButton(mood: .good, backgroundColor: .checkInGreen)
        goodButton.addTarget(self, action: #selector(handleGoodButtonPressed(sender:)), for: .touchUpInside)
        let alrightButton = MoodButton(mood: .alright, backgroundColor: .checkInYellow)
        alrightButton.addTarget(self, action: #selector(handleAlrightButtonPressed(sender:)), for: .touchUpInside)
        let badButton = MoodButton(mood: .bad, backgroundColor: .checkInOrange)
        badButton.addTarget(self, action: #selector(handleBadButtonPressed(sender:)), for: .touchUpInside)
        let horribleButton = MoodButton(mood: .horrible, backgroundColor: .checkInRed)
        horribleButton.addTarget(self, action: #selector(handleHorribleButtonPressed(sender:)), for: .touchUpInside)
        
        // Create stack view.
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .equalSpacing
        
        // Add buttons to stack view.
        stackView.addArrangedSubview(greatButton)
        stackView.addArrangedSubview(goodButton)
        stackView.addArrangedSubview(alrightButton)
        stackView.addArrangedSubview(badButton)
        stackView.addArrangedSubview(horribleButton)
        
        // Add stack view to parent view.
        view.addSubview(stackView)
        
        // Activate constraints to create the layout.
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greatButton.heightAnchor.constraint(equalToConstant: 50),
            greatButton.widthAnchor.constraint(equalToConstant: 200),
            goodButton.heightAnchor.constraint(equalToConstant: 50),
            goodButton.widthAnchor.constraint(equalToConstant: 200),
            alrightButton.heightAnchor.constraint(equalToConstant: 50),
            alrightButton.widthAnchor.constraint(equalToConstant: 200),
            badButton.heightAnchor.constraint(equalToConstant: 50),
            badButton.widthAnchor.constraint(equalToConstant: 200),
            horribleButton.heightAnchor.constraint(equalToConstant: 50),
            horribleButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    // MARK: Actions
    @objc private func handleGreatButtonPressed(sender: MoodButton) {
        dataSource?.add(mood: .init(type: .great, createdAt: Date()))
        dismiss()
    }
    
    @objc private func handleGoodButtonPressed(sender: MoodButton) {
        dataSource?.add(mood: .init(type: .good, createdAt: Date()))
        dismiss()
    }
    
    @objc private func handleAlrightButtonPressed(sender: MoodButton) {
        dataSource?.add(mood: .init(type: .alright, createdAt: Date()))
        dismiss()
    }
    
    @objc private func handleBadButtonPressed(sender: MoodButton) {
        dataSource?.add(mood: .init(type: .bad, createdAt: Date()))
        dismiss()
    }
    
    @objc private func handleHorribleButtonPressed(sender: MoodButton) {
        dataSource?.add(mood: .init(type: .horrible, createdAt: Date()))
        dismiss()
    }
    
    private func dismiss() {
        dismiss(animated: true) {
            // This will be called in MainTableViewController and will refresh the table view.
            self.delegate?.handleDismissFromAddView()
        }
    }
}
