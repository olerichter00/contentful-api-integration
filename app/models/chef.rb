class Chef < ContentfulModel::Base
  self.content_type_id = "chef"

  coerce_field name: :String
end
