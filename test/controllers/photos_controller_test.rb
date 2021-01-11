require "test_helper"

class PhotosControllerTest < ActionDispatch::IntegrationTest
  test 'POST photos' do
    post photos_path, params: { photo: { image: fixture_file_upload(Rails.root.join('test/fixtures/files/monga.png'), 'image/png') } }
    assert_equal Photo.count, 1
  end

  test 'POST graphql' do
    query = <<~QUERY
      mutation($photo: Upload!) {
        uploadPhoto(photo: $photo) {
          id
          imageUrl
        }
      }
    QUERY
    post graphql_path, params: {
      operations: {
        query: query,
        variables: {
          photo: nil,
        }
      }.to_json,
      map: {
        photo: ['variables.photo']
      }.to_json,
      photo: fixture_file_upload(Rails.root.join('test/fixtures/files/monga.png'), 'image/png'),
    }
    assert_equal Photo.count, 1
  end
end
