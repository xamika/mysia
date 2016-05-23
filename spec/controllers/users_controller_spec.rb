require 'rails_helper'

describe UsersController do
  login_user

  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

  describe "GET #index" do
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

end
