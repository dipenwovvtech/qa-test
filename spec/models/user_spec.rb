require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:questions) }
    it { should have_many(:answers) }
  end

  describe "public instance methods" do
    context "responds to its methods" do
      subject{ build(:user) }
      it { expect(subject).to respond_to(:topics) }
      it { expect(subject).to respond_to(:following) }
    end
  end


end
