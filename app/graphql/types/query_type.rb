module Types
  class QueryType < Types::BaseObject
    # field name
    field :items,
      # result type
      [Types::ItemType],
      # null is required - must be true or false
      null: false,
      # human readable description
      description: "Returns a list of items in the martian library"
    
    # resolver - must be the same as the field name
    def items
      Item.all
    end
  end
end
