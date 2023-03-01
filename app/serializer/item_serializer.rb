class ItemSerializer < Panko::Serializer
    attributes :newStock, :previousStock
    ItemSerializer.new.serializer_to_json(Item.first)
end