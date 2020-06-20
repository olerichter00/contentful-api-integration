require "rails_helper"

RECIPE_TITLES = [
  "Crispy Chicken and Rice with Peas & Arugula Salad",
  "White Cheddar Grilled Cheese with Cherry Preserves & Basil",
  "Tofu Saag Paneer with Buttery Toasted Pita",
  "Grilled Steak & Vegetables with Cilantro-Jalapeño Dressing"
]

feature "Recipes" do
  feature "with existing recipe" do
    background do
      VCR.use_cassette("recipe_overview_page") do
        visit "/recipes"
      end
    end

    feature "when opening the overview" do
      scenario "the user sees all recipes" do
        RECIPE_TITLES.each do |title|
          expect(page).to have_content(title)
        end
      end
    end

    feature "when clicking on a recipe" do
      background do
        VCR.use_cassette("recipe_detail_page") do
          click_link(recipe_title)
        end
      end

      let(:recipe_title) { RECIPE_TITLES.first }

      scenario "the user sees the details page" do
        expect(page).to have_content("Crispy Chicken and Rice with Peas & Arugula Salad")
        expect(page).to have_content("gluten free")
        expect(page).to have_content("healthy")
        expect(page).to have_content("Crispy chicken skin, tender meat, and rich, tomatoey")
        expect(page).to have_content("Chef: Jony Chives")
      end
    end
  end

  feature "with non-existent recipe" do
    feature "when opening the details page" do
      background do
        VCR.use_cassette("recipe_detail_page_not_found") do
          visit "/recipes/#{not_found_id}"
        end
      end

      let(:not_found_id) { "not-found-recipe-id" }

      scenario "the user sees a not found page" do
        expect(page).to have_content("The page you were looking for doesn't exist.")
      end
    end
  end
end
