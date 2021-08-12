//
//  ViewController.swift
//  GBWeather
//
//  Created by Stanislav Belykh on 05.08.2021.
//

import UIKit

class ViewController: UIViewController {

	init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Экран (View) уже загружен
		view.backgroundColor = .darkGray
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		// Уведомляет что экран скоро будет показан

	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		// Уведомляет что экран уже показан
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		// Уведомляет что экран скоро будет скрыт
	}

	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		// Уведомляет что экран уже скрыт
	}
}

