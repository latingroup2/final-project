# == Schema Information
#
# Table name: temas
#
#  id         :integer          not null, primary key
#  nombre     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tema < ApplicationRecord
    has_many :contenidos
end
