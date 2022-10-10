require_relative "./phone_number"

RSpec.describe PhoneNumber do
  let(:phone_number) { PhoneNumber.new("5558675309") }

  describe "#number" do
    it "is a formatted number" do
      expect(phone_number.number).to eq("(555) 867-5309")
    end
  end
  
  describe "#to_i" do
    it "is the number as an int" do
      new_number = PhoneNumber.new("555-867-5309")
      expect(new_number.to_i).to eq(5558675309)
    end
  end

  describe "#text" do
    it "calls PhoneActions#text!" do
      expect_any_instance_of(PhoneActions).to receive(:text!)
      phone_number.text("hello world!")
    end
  end

  describe "#call" do
    it "calls PhoneActions#call!" do
      expect_any_instance_of(PhoneActions).to receive(:call!)
      phone_number.call("hello world!")
    end
  end

  describe "#text_and_call" do
    it "calls both PhoneActions#text! and PhoneActions#call! methods" do
      expect_any_instance_of(PhoneActions).to receive(:text!)
      expect_any_instance_of(PhoneActions).to receive(:call!)
      phone_number.text_and_call("hello world!")
    end
  end
end

