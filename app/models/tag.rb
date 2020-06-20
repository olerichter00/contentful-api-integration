class Tag < ContentfulModel::Base
  self.content_type_id = "tag"

  coerce_field name: :String
end
