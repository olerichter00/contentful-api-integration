require "rails_helper"

describe Tag, type: :model do
  subject(:tag) { TagFactory.create }

  describe "fields" do
    it { is_expected.to respond_to(:name) }
  end
end
