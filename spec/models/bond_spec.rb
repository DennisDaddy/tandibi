RSpec.describe Bond, type: :model do
  describe "#valid?" do
    it "should validate the state correctly" do
      friend = User.new
      user = User.new
      bond = Bond.new(
        user: user,
        friend: friend
      )
      expect(bond).not_to be_valid
      Bond::STATES.each do |state|
        bond.state = state
        expect(bond).to be_valid
      end
    end
  end
end