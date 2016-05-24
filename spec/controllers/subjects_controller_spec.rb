require 'rails_helper'

describe SubjectsController do
  login_user

  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

  describe 'GET #new' do
    it 'assigns a new subject to @subject' do
      get :new
      expect(assigns(:subject)).to be_a_new(Subject)

    end
  end

end
