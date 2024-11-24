platform :ios, '15.0' # Thiết lập nền tảng iOS tối thiểu
source 'https://github.com/CocoaPods/Specs.git'
# Nếu bạn xây dựng cho cả iOS và macOS
abstract_target 'Mail' do
  use_frameworks!

  target 'mail' do
    platform :ios, '14.0'
    pod 'MailCore2', :git => 'https://github.com/MailCore/mailcore2.git'
  end
end
