Pod::Spec.new do |s|
  s.name                = 'InjectionSlave'
  s.version             = '0.0.1'
  s.summary             = 'auto load injectionIII.'
  s.homepage            = 'https://github.com/OneSlave/InjectionSlave'
  s.license             = { :type => 'MIT', :file => 'LICENSE' }
  s.author              = { 'oneslave' => 'OneSlave@github.com' }
  s.source              = { :git => 'https://github.com/OneSlave/InjectionSlave.git', :tag => s.version.to_s }
  s.platform            = :ios, "11.0"
  s.source_files        = 'InjectionSlave/Classes/*.{h,m}'
  s.public_header_files = ['InjectionSlave/Classes/UIViewController+Injection.h']
  s.resource            = ['InjectionSlave/Assets/iOSInjection.bundle']
  script_one = <<-CMD
    injectPath=$(pwd)/InjectionSlave/InjectionSlave/Assets/iOSInjection.bundle
    filePath=$(pwd)/InjectionSlave/InjectionSlave/Classes/Injection.h
    if [[ ! -e injectPath ]];then
    	injectPath=$(dirname $(dirname "$PWD"))/InjectionSlave/Assets/iOSInjection.bundle
        filePath=$(dirname $(dirname "$PWD"))/InjectionSlave/Classes/Injection.h
    fi
    if [[ -e injectPath ]];then
        echo "---->【"$filePath"】<----"
        chmod +w $filePath
        cat /dev/null > $filePath
        echo '#define InjectionBundlePath @"'$injectPath'"' >> $filePath
    else
        echo "====>【"$(pwd)"】<===="
    fi
  CMD
  script_two = <<-CMD
    injectPath=$(pwd)/InjectionSlave/InjectionSlave/Assets/iOSInjection.bundle
    filePath=$(pwd)/InjectionSlave/InjectionSlave/Classes/Injection.h
    if [[ ! -e injectPath ]];then
    	injectPath=$(dirname $(dirname "$PWD"))/InjectionSlave/Assets/iOSInjection.bundle
        filePath=$(dirname $(dirname "$PWD"))/InjectionSlave/Classes/Injection.h
    fi
    if [[ -e injectPath ]];then
        echo "---->【"$filePath"】<----"
        chmod +w $filePath
        cat /dev/null > $filePath
        echo '#define InjectionBundlePath @""' >> $filePath
    else
        echo "====>【"$(pwd)"】<===="
    fi
  CMD
  s.script_phases = [
    {:name => 'pod compile before', :script => script_one, :shell_path => '/bin/sh', :execution_position => :before_compile},
    {:name => 'pod compile after', :script => script_two, :shell_path => '/bin/sh', :execution_position => :after_compile}
  ]
end
