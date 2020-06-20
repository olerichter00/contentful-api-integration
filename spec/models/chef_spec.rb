require "rails_helper"

describe Chef, type: :model do
  subject(:chef) { ChefFactory.create }

  describe "fields" do
    it { is_expected.to respond_to(:name) }
  end
end
