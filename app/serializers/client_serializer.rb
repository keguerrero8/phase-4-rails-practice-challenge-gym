class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :totalcharge
  has_many :memberships

  def totalcharge
    object.memberships.sum {|m| m.charge}
  end
end
