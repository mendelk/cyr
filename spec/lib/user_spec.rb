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

end