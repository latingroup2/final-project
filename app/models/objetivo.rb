# == Schema Information
#
# Table name: objetivos
#
#  id          :integer          not null, primary key
#  eje_id      :integer
#  descripcion :text
#  numeral     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Objetivo < ApplicationRecord
end
