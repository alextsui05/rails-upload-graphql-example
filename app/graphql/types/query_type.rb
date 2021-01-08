module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :photo, PhotoType, null: false do
      description "Find a photo by ID"
      argument :id, ID, required: true
    end
    def photo(id:)
      Photo.find(id)
    end

    field :photos, PhotoType.connection_type, null: false
    def photos
      Photo.all
    end
  end
end
