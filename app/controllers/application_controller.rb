class ApplicationController < ActionController::Base
  private

  def not_found
    set_meta_tags(title: I18n.t("not_found"))

    render file: Rails.root.join("public", "404.html"), status: :not_found
  end
end
