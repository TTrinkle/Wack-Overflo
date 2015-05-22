require 'spec_helper'


describe Answer do
  let(:answer) {FactoryGirl.create :answer}

  it "has a valid answer" do
    expect(:answer).to be_valid
  end
end