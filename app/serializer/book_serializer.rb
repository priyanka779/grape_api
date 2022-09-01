class BookSerializer < Panko::serializer
    attributes :newStock, :previousStock

    has_many :flows, serializer:  FlowSerializer
end