# == Schema Information
#
# Table name: tributos
#
#  id             :integer          not null, primary key
#  contenido_name :text
#  contenido_id   :integer
#  indicador_name :text
#  indicador_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Tributo < ApplicationRecord
end
