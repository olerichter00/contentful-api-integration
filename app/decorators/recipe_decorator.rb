PREVIEW_PHOTO_DIMENSIONS = [300, 200]
PHOTO_DIMENSIONS = [600, 400]

class RecipeDecorator < Draper::Decorator
  include MarkdownHelper

  delegate_all

  def photo_src
    object.photo.resize(*PHOTO_DIMENSIONS).load
  end

  def preview_photo_src
    object.photo.resize(*PREVIEW_PHOTO_DIMENSIONS).load
  end

  def chef_name
    object.chef&.name
  end

  def has_chef?
    !!object.chef
  end

  def decription_html
    parse_markdown(object.description)
  end
end
