RSpec.describe Bond, type: :model do
  describe "#valid?" do
    it "should validate the state correctly" do
      friend = build(:user)
      user = build(:user)
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

  describe "#save" do
  context "when complete data is given" do
    it "can be persisted" do
      user = User.create email: "e1@example.org",
        first_name: "Edwin",
        username: "e1"
        friend = User.create email: "a1@example.org",
        first_name: "Adam",
        username: "a1"
      bond = Bond.new(
        user: user,
        friend: friend,
        state: Bond::REQUESTING
      )
      bond.save
      expect(bond).to be_persisted
      expect(bond.user).to eq user
      expect(bond.friend).to eq friend
    end
  end
  end
end