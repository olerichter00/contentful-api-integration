require "rails_helper"

describe RecipeDecorator do
  subject(:decorated_recipe) { described_class.decorate(recipe) }

  let(:recipe) { RecipeFactory.create }

  its(:title) { is_expected.to eq("Crispy Chicken and Rice\twith Peas & Arugula Salad") }
  its(:photo_src) { is_expected.to eq("//images.ctfassets.net/kk2bw5ojx476/5mFyTozvSoyE0Mqseoos86/fb88f4302cfd184492e548cde11a2555/SKU1479_Hero_077-71d8a07ff8e79abcb0e6c0ebf0f3b69c.jpg?w=600&h=400") }
  its(:preview_photo_src) { is_expected.to eq("//images.ctfassets.net/kk2bw5ojx476/5mFyTozvSoyE0Mqseoos86/fb88f4302cfd184492e548cde11a2555/SKU1479_Hero_077-71d8a07ff8e79abcb0e6c0ebf0f3b69c.jpg?w=300&h=200") }
  its(:has_chef?) { is_expected.to eq(true) }
  its(:chef_name) { is_expected.to eq("Jony Chives") }
  its(:decription_html) { is_expected.to eq("<p>Crispy chicken skin, tender meat, and rich, tomatoey sauce form a winning trifecta of delicious in this one-pot braise. We spoon it over rice and peas to soak up every last drop of goodness, and serve a tangy arugula salad alongside for a vibrant boost of flavor and color. Dinner is served! Cook, relax, and enjoy!</p>\n") }
end
