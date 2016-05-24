require 'rails_helper'

describe Mark do

  before(:each) { @mark = Mark.new(mark: 1.5, weighting: 1.5, shorttest: false, notenplan_id: 2, subject_id: 3) }


  it "#mark returns a float" do
    expect(@mark.mark).to match 1.5
  end

  it "#weighting returns a float" do
    expect(@mark.weighting).to match 1.5
  end

  it "#shorttest returns a boolean" do
    expect(@mark.shorttest).to match false
  end

  it "#notenplan_id returns a integer" do
    expect(@mark.notenplan_id).to match 2
  end

  it "#subject_id returns a integer" do
    expect(@mark.subject_id).to match 3
  end

  it "should have one notenplan" do
    t = Mark.reflect_on_association(:notenplan)
    t.macro.should == :belongs_to
  end

  it "should have one subject" do
    t = Mark.reflect_on_association(:subject)
    t.macro.should == :belongs_to
  end

end
