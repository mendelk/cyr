require 'spec_helper'

describe User do

  it { should respond_to :last_name }
  it { should respond_to :first_name }
  it { should respond_to :gender }
  it { should respond_to :date_of_birth }
  it { should respond_to :favorite_color }

end