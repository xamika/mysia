require 'rails_helper'

describe NotenplansController do
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

  describe 'GET #new' do
    it 'assigns a new notenplan to @notenplan' do
      get :new
      expect(assigns(:notenplan)).to be_a_new(Notenplan)

    end
  end

end
