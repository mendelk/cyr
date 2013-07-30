require 'spec_helper'

describe User do

  it { should respond_to :last_name }
  it { should respond_to :first_name }
  it { should respond_to :gender }
  it { should respond_to :date_of_birth }
  it { should respond_to :favorite_color }

  it "keeps track of instances" do
    expect { 2.times { User.new.save } }.to change{ User.all.count }.by(2)
  end

  it "sort method works as it should" do
    User.clear
    u1 = User.create first_name: "Avi", last_name: "Flombaum"
    u2 = User.create first_name: "Adam", last_name: "Flombaum"
    u3 = User.create first_name: "Adam", last_name: "Kramer"
    User.sort_by(:last_name, :first_name).should == [u2,u1,u3]
  end

end