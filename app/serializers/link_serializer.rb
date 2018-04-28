class LinkSerializer < ActiveModel::Serializer
  attributes :id, :full_url, :access_count
end