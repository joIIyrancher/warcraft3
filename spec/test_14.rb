require_relative 'spec_helper'

describe Barracks do
  describe "#new" do
    it "should return 500 lumber" do
      barracks = Barracks.new
      expect(barracks.lumber).to eq(500)
    end
  end
end