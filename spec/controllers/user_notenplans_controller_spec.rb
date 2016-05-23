require 'rails_helper'

describe UserNotenplansController do
  login_user

  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

  describe 'GET #new' do
    it 'assigns a new user_notenplan to @user_notenplan' do
      get :new
      expect(assigns(:user_notenplan)).to be_a_new(UserNotenplan)

    end
  end

end
