require_relative 'spec_helper'

describe Barracks do
  before :each do
    @barracks = Barracks.new
  end

  describe "#train_siege" do
    it "should cost 200 gold" do
      @barracks.train_siege
      expect(@barracks.gold).to eq(800)
    end
    it "should cost 60 lumber" do
      @barracks.train_siege
      expect(@barracks.lumber).to eq(440)
    end
    it "should cost 3 food" do
      @barracks.train_siege
      expect(@barracks.food).to eq(77)
    end
    it "should return instance of a SiegeEngine" do
      siege = @barracks.train_siege
      expect(siege).to be_an_instance_of(SiegeEngine)
    end
  end

  describe "#can_train_siege?" do
    it "returns true if there are enough resources to train a siege" do
      expect(@barracks.can_train_siege?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      expect(@barracks).to receive(:food).and_return(1)
      expect(@barracks.can_train_siege?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      expect(@barracks).to receive(:gold).and_return(134)
      expect(@barracks.can_train_siege?).to be_falsey
    end

    it "returns false if there isn't enough lumber" do
      expect(@barracks).to receive(:gold).and_return(58)
      expect(@barracks.can_train_siege?).to be_falsey
    end
  end

    describe "#train_siege" do
    it "does not train a siege if there aren't enough resources" do
      expect(@barracks).to receive(:can_train_siege?).and_return(false)
      expect(@barracks.train_siege).to be_nil
    end
    it "trains a siege if there are enough resources" do
      expect(@barracks).to receive(:can_train_siege?).and_return(true)
      expect(@barracks.train_siege).to be_a(SiegeEngine)
    end
  end

end







