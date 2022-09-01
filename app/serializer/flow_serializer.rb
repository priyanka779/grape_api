class FlowSerializer < Panko::Serializer
    attributes :newStock, :previousStock
    FlowSerializer.new.serializer_to_json(Flow.first)
end