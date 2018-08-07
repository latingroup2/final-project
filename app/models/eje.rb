# == Schema Information
#
# Table name: ejes
#
#  id          :integer          not null, primary key
#  materia_id  :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Eje < ApplicationRecord
end
