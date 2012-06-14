require 'test_helper'
require 'gds-sso/api_access'

class ApiAccessTest < Test::Unit::TestCase
  def test_internet_explorer_7_accept_header_is_not_considered_to_be_api_call
    ie7_accept_header = 'image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, ' +
      'application/x-shockwave-flash, application/xaml+xml, application/x-ms-xbap, ' +
      'application/x-ms-application, */*'
    refute GDS::SSO::ApiAccess.api_call?('HTTP_ACCEPT' => ie7_accept_header)
  end

  def test_application_json_accept_header_is_considered_to_be_api_call
    assert GDS::SSO::ApiAccess.api_call?('HTTP_ACCEPT' => 'application/json')
  end

end