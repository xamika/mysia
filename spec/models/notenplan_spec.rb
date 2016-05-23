require 'rails_helper'

describe Notenplan do

  before(:each) { @notenplen = Notenplan.new(name: 'name', description: 'description') }

  it { should respond_to(:name) }
  it { should respond_to(:description) }

  it "#name returns a string" do
    expect(@notenplen.name).to match 'name'
  end

  it "#description returns a string" do
    expect(@notenplen.description).to match 'description'
  end

  it "should have one owner" do
    t = Notenplan.reflect_on_association(:owner)
    t.macro.should == :belongs_to
  end

  it "should have many marks" do
    t = Notenplan.reflect_on_association(:marks)
    t.macro.should == :has_many
  end

  it "should have one user_notenplans" do
    t = Notenplan.reflect_on_association(:user_notenplans)
    t.macro.should == :has_many
  end

  it "should have one users" do
    t = Notenplan.reflect_on_association(:users)
    t.macro.should == :has_many
  end
end
