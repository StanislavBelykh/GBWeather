//
//  LoginViewController.swift
//  GBWeather
//
//  Created by Stanislav Belykh on 05.08.2021.
//

import UIKit

final class LoginViewController: UIViewController {

	@IBOutlet private var scrollView: UIScrollView!
	@IBOutlet private var titleImageView: UIImageView!
	@IBOutlet private var titleLabel: UILabel!
	@IBOutlet private var loginTextField: UITextField!
	@IBOutlet private var passwordTextField: UITextField!
	@IBOutlet private var loginButton: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()

		//Жест тапа по скроллу
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
		// Добавляем жест для скролла
		scrollView?.addGestureRecognizer(tapGesture)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		// Подписываемся на два уведомления: одно приходит при появлении клавиатуры
		NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
		// Второе — когда она пропадает
		NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)

		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
	}

	override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

		if identifier == "loginSegue" {
			// Получаем логин
			let loginText = loginTextField.text

			// Получаем пароль
			let passwordText = passwordTextField.text

			if loginText == "1" && passwordText == "1" {
				print("Success")
				return true
			} else {
				print("Error login or password")
				showAlert(title: "Ошибка", message: "Не верный логин или пароль")
				return false
			}
		} else {
			return true
		}
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "demoLoginSegue" {
			let destinationController = segue.destination as! UITabBarController
			destinationController.viewControllers?.forEach { $0.view.backgroundColor = .orange }
			destinationController.tabBar.items?[1].badgeValue = "1"
		}
	}

	@IBAction func logout(_ segue: UIStoryboardSegue) {
		loginTextField.text = ""
		passwordTextField.text = ""
	}

	@IBAction private func loginButtonPressed(_ sender: UIButton) {

	}

	private func showAlert(title: String, message: String) {
		let alertController = UIAlertController(title: title,
												message: message,
												preferredStyle: .alert)

		let closeAction = UIAlertAction(title: "Ok",
										style: .cancel) { [weak self] _ in
			guard let self = self else { return }
			self.loginTextField.text = ""
			self.passwordTextField.text = ""
		}

		alertController.addAction(closeAction)

		present(alertController, animated: true, completion: nil)
	}

	@IBAction func demoButtonPressed(_ sender: UIButton) {
		performSegue(withIdentifier: "demoLoginSegue", sender: nil)
	}

	@objc func hideKeyboard() {
		self.scrollView?.endEditing(true)
	}

	// Когда клавиатура появляется
	@objc func keyboardWasShown(notification: Notification) {

		// Получаем размер клавиатуры
		let info = notification.userInfo! as NSDictionary
		let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
		let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

		// Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
		self.scrollView?.contentInset = contentInsets
		scrollView?.scrollIndicatorInsets = contentInsets
	}

	// Когда клавиатура исчезает
	@objc func keyboardWillBeHidden(notification: Notification) {
		// Устанавливаем отступ внизу UIScrollView, равный 0
		let contentInsets = UIEdgeInsets.zero
		scrollView?.contentInset = contentInsets
		scrollView?.scrollIndicatorInsets = contentInsets
	}
}
