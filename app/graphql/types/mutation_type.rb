module Types
  class MutationType < Types::BaseObject
    # mutation($photo: Upload!) {
    #   uploadPhoto(photo: $photo) {
    #     id
    #     imageUrl
    #   }
    # }
    field :upload_photo, PhotoType, null: true do
      argument :photo, ApolloUploadServer::Upload, required: true
    end
    def upload_photo(photo:)
      Photo.create(image: photo)
    end
  end
end
