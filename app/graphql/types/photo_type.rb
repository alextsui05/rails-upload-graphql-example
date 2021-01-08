module Types
  class PhotoType < Types::BaseObject
    description "A photo"
    field :id, ID, null: false
    field :image_url, String, null: false
  end
end
