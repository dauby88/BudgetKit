#
# Be sure to run `pod lib lint BudgetKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BudgetKit'
  s.version          = '0.1.1'
  s.summary          = 'A Wrapper for the YNAB API.'

  s.description      = <<-DESC
BudgetKit is an iOS framework wrapper for the YNAB (You Need A Budget) Public API. It manages authentication, network calls, and model objects associated with the API. No need to worry about networking or JSON parsing, simply import BudgetKit and start developing your iOS app using the YNAB API!
                       DESC

  s.homepage         = 'https://github.com/dauby88/BudgetKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Stuart Daubenmire' => 'dauby88@icloud.com' }
  s.source           = { :git => 'https://github.com/dauby88/BudgetKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'  
  s.source_files = 'BudgetKit/Classes/**/*'
  s.frameworks = 'SafariServices'
end
