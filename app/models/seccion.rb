# == Schema Information
#
# Table name: seccions
#
#  id                :integer          not null, primary key
#  contenido_id      :integer
#  test_id           :integer
#  numero_ejercicios :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  nombre            :text
#

class Seccion < ApplicationRecord
end
