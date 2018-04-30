class LinkSerializer < ActiveModel::Serializer
  attributes :id, :full_url, :clicks
end