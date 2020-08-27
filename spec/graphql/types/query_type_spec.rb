require 'rails_helper'

RSpec.describe Types::QueryType do
  describe "items" do
    # First, we create a pair of items in our database
    let!(:items) {create_pair(:item)}
    # Then, we define the query under test
    let(:query) do
      %(query{
        items{
          title
        }
      })
    end
    # define result by calling GraphqlSchema.execute
    subject(:result) do
      MartianLibrarySchema.execute(query).as_json
    end

    it 'returns all items' do
      expect(result.dig('data', 'items')).to match_array(
        items.map {|item| { 'title' => item.title }}
      )
    end
  end
end