# == Schema Information
#
# Table name: indicators
#
#  id          :integer          not null, primary key
#  objetivo_id :integer
#  descripcion :text
#  numeral     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Indicator < ApplicationRecord
end
