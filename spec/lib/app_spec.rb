require 'spec_helper'

describe App do

  before :all do
    @app = App.instance
  end

  it "parses comman line options into files with path and delimiter" do
    @app.parse_options ['file_1', 'delim_1', 'file_2', 'delim_2']
    @app.files.should == [{path: "file_1", delimiter: "delim_1"}, {path: "file_2", delimiter: "delim_2"}]
  end

  it "parses files and sends to UserParser" do
    @app.parse_options ['spec/lib/examples/comma.txt', ',', 'spec/lib/examples/space.txt', ' ']
    UsersParser.should_receive(:parse).with('Flombaum, Avi, Male, Pink, 6/23/1973', ',')
    UsersParser.should_receive(:parse).with('Kramer Menachem M M 5-21-1987 Orange', ' ')
    @app.parse_files
  end

end