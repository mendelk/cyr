require 'spec_helper'

describe UsersParser do

  it "parses a comma-delimited string and creates a User" do
    UsersParser.parse("Abercrombie, Neil, Male, Tan, 2/13/1943", ',')
    User.all.last.to_s.should == "Abercrombie Neil Male 02/13/1943 Tan"
  end

  it "parses a space-delimited string and creates a User" do
    UsersParser.parse("Kournikova Anna F F 6-3-1975 Red", ' ')
    User.all.last.to_s.should == "Kournikova Anna Female 06/03/1975 Red"
  end

  it "parses a pipe-delimited string and creates a User" do
    UsersParser.parse("Smith | Steve | D | M | Red | 3-3-1985", '|')
    User.all.last.to_s.should == "Smith Steve Male 03/03/1985 Red"
  end

  it "raises error when using a delimiter other than '|' (pipe), ',' (comma) or ' '  (space)" do
    expect { UsersParser.parse("Marc;Rosenberg", ';') }.to raise_error
  end

end