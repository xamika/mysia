require 'rails_helper'

describe UserNotenplan do

  before(:each) { @user_notenplan = UserNotenplan.new( user_id: 1, notenplan_id: 1, admin: true) }


  it "#user_id returns a integer" do
    expect(@user_notenplan.user_id).to match 1
  end

  it "#notenplan_id returns a integer" do
    expect(@user_notenplan.notenplan_id).to match 1
  end

  it "#admin returns a boolean" do
    expect(@user_notenplan.admin).to match true
  end

  it "should have one notenplan" do
    t = UserNotenplan.reflect_on_association(:notenplan)
    t.macro.should == :belongs_to
  end

  it "should have one user" do
    t = UserNotenplan.reflect_on_association(:user)
    t.macro.should == :belongs_to
  end

end
