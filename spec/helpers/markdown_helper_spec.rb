require "rails_helper"

describe MarkdownHelper, type: :helper do
  describe "#parse_markdown" do
    let(:markdown_string) { "*Grilled Cheese 101*" }
    let(:html_string) { "<p><em>Grilled Cheese 101</em></p>\n" }

    it "parses markdown to html" do
      expect(parse_markdown(markdown_string)).to eq(html_string)
    end
  end
end
