import UIKit

class AlertHelper {
    
    private let alertView = UIAlertView()
    
    init (parentView: UIView) {
        parentView.addSubview(alertView)
        prepareAlertView()
        prepareAlertViewConstraintsIn(parentView: parentView)
    }
    
    private func prepareAlertView() {
        alertView.okButtonCallback = {
            self.hideAlertView()
        }
    }
    
    private func prepareAlertViewConstraintsIn(parentView view: UIView) {
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        alertView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        alertView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        alertView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func showAlertView() {
        self.alertView.isHidden = false
        UIView.animate(withDuration: Constant.Anim.SHORT, animations: {
            self.alertView.alpha = 1.0
        })
    }
    
    private func hideAlertView() {
        UIView.animate(withDuration: Constant.Anim.SHORT, animations: {
            self.alertView.alpha = 0.0
        }) { _ in
            self.alertView.isHidden = true
        }
    }

    public func showTrueMessageWith(text: String) {
        showAlertWith(text: text, image: AlertViewData.TRUE_MESSAGE_IMAGE)
    }
    
    public func showWarningMessageWith(text: String) {
        showAlertWith(text: text, image: AlertViewData.WARNING_MESSAGE_IMAGE)
    }
    
    public func showWrongMessageWith(text: String) {
        showAlertWith(text: text, image: AlertViewData.WRONG_MESSAGE_IMAGE)
    }
    
    private func showAlertWith(text: String, image: UIImage) {
        alertView.textLabel.text = text
        alertView.imageView.image = image
        showAlertView()
    }
    
    private struct AlertViewData {
        public static let TRUE_MESSAGE_IMAGE = UIImage(named: "warning_icon")!
        public static let WARNING_MESSAGE_IMAGE = UIImage(named: "warning_icon")!
        public static let WRONG_MESSAGE_IMAGE = UIImage(named: "warning_icon")!
    }
}

class UIAlertView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var okButtonCallback: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
        addSubview(contentView)
        prepareContentViewConstraints()
        prepareStartParam()
    }
    
    private func prepareStartParam() {
        isHidden = true
        alpha = 0
    }
    
    private func prepareContentViewConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    @IBAction func onClickOkButton(_ sender: UIButton) {
        okButtonCallback?()
    }
}
