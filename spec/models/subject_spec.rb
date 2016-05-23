require 'rails_helper'

describe Subject do

  before(:each) { @subject = Subject.new(name: "name", number: 1) }

  it "#name returns a string" do
    expect(@subject.name).to match "name"
  end

  it "#number returns a integer" do
    expect(@subject.number).to match 1
  end

end
