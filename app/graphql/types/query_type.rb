module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :photo, PhotoType, null: false do
      description "Find a photo by ID"
      argument :id, ID, required: true
    end
    def photo(id:)
      Photo.find(id)
    end

    # photos(first: 10) {
    #     edges {
    #       cursor
    #     }
    #     nodes {
    #       id
    #       imageUrl
    #     }
    #     pageInfo {
    #       endCursor
    #       hasNextPage
    #     }
    #   }
    # }
    field :photos, PhotoType.connection_type, null: false
    def photos
      Photo.all
    end
  end
end
