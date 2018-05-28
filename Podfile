# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Start Project' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  use_frameworks!

  # Pods for Start Project
  pod 'AFNetworking'
  pod 'GHConsole'
  pod 'ChameleonFramework', :inhibit_warnings => true
  
  
#  pod 'IQKeyboardManager'
#  pod 'SVProgressHUD'
#  pod 'KLCPopup', :git => 'https://github.com/jmascia/KLCPopup', :inhibit_warnings => true
#  pod 'MagicalRecord'


  #Easy debug
  pod 'FLEX', :configurations => ['Debug'], :inhibit_warnings => true
#  pod 'Reveal-iOS-SDK', '1.6.2', :configurations => ['Debug']
  
  #Memory leaks detection
  pod 'MLeaksFinder', :configurations => ['Debug'], :inhibit_warnings => true
  pod 'FBRetainCycleDetector', :configurations => ['Debug'], :inhibit_warnings => true


  # ce bout de code permet de redéfinir la swift version du pod, car sinon elle est override à chaque update/install
#  post_install do |installer|
#      # Your list of targets here.
#      myTargets = ['DynamicBlurView']
#      installer.pods_project.targets.each do |target|
#          if myTargets.include? target.name
#              target.build_configurations.each do |config|
#                  config.build_settings['SWIFT_VERSION'] = '4.0'
#              end
#          end
#      end
#  end

end
