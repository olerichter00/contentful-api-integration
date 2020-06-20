# Let's you create factories for contentful models using vcr to record API calls
class ContentfulBaseFactory
  class << self
    def create(id = default_id)
      cassette_name = "#{class_name.gsub("::", "_").downcase}_#{id}"

      VCR.use_cassette(cassette_name) do
        class_name.constantize.find(id)
      end
    end

    def class_name
      name.delete_suffix("Factory")
    end

    attr_accessor :default_id
  end
end
