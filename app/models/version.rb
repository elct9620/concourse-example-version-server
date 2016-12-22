class Version < ApplicationRecord
  has_many :monsters

  def to_s
    "#{major}.#{minior}"
  end
end
