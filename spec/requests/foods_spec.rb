require 'spec_helper'

describe "Foods" do
  describe "GET /foods" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      # get foods_index_path
      visit '/foods'
      response.status.should be(200)
    end
  end
end
