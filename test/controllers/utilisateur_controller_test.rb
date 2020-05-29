require 'test_helper'

class UtilisateurControllerTest < ActionDispatch::IntegrationTest
  test "should get nouveau" do
    get utilisateur_nouveau_url
    assert_response :success
  end

end
