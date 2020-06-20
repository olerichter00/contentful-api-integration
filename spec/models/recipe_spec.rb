require "rails_helper"

describe Recipe, type: :model do
  subject(:recipe) { RecipeFactory.create }

  describe "fields" do
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:description) }
  end

  describe "associations" do
    it { is_expected.to respond_to(:tags) }
    it { is_expected.to respond_to(:chef) }
  end
end
