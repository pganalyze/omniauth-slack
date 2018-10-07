require 'helper'
require 'omniauth-slack'

describe OmniAuth::Slack::OAuth2::AccessToken do
  def setup
    @access_token = OmniAuth::Slack::OAuth2::AccessToken.new(
      OmniAuth::Slack::OAuth2::Client.new('key','secret'),
      "ABC123DEF456",
      {'user' => {'id' => '11', 'name' => 'bill'}, 'team_id' => 33, 'team_name' => 'my team'}
    )
  end
  
  it 'defines getter methods for basic user data' do
    assert_equal 'bill', @access_token.user_name
    assert_equal 'my team', @access_token.team_name
  end
  
  it 'defines access_token to provide universal access for data-methods' do
    assert_equal @access_token, @access_token.access_token
  end
  
  describe 'user_id' do
    it "gets data from params['user'].to_h['id']" do
      assert_equal '11', @access_token.user_id
    end
    
    it "gets data from params['user_id']" do
      @access_token.params.replace({'user_id' => 'user-id-01'})
      assert_equal 'user-id-01', @access_token.user_id
    end
    
    it "gets data from params['authorizing_user'].to_h['user_id']" do
      @access_token.params.replace({'authorizing_user' => {'user_id' => 'user-id-02'}})
      assert_equal 'user-id-02', @access_token.user_id
    end
  end
  
  describe 'uid' do
    it 'gets concatenated user_id-team_id' do
      assert_equal '11-33', @access_token.uid
    end
  end
  
  describe 'is_app_token?' do
  end
  
  describe 'is_identity_token?' do
  end
  
  describe 'all_scopes' do
  end
  
  describe 'has_scope?' do
  end
  
  describe 'self.has_scope?' do
  end
end