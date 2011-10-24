class Shout < ActiveRecord::Base
  validates :body, length: { in: 10..145, too_short: "too short!" }

  def self.search(query)
    where("body like ?", "%"+query+"%")
  end
end
