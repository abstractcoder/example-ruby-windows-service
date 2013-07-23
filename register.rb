require 'rubygems'
require 'win32/service'
include Win32

Service.create({
  service_name: 'testservice',
  host: nil,
  service_type: Service::WIN32_OWN_PROCESS,
  description: 'Test Service',
  start_type: Service::AUTO_START,
  error_control: Service::ERROR_NORMAL,
  binary_path_name: "#{`where ruby`.chomp} -C #{`echo %cd%`.chomp} service.rb",
  load_order_group: 'Network',
  dependencies: nil,
  display_name: 'Test Service'
})

Service.start("testservice")