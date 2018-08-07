# == Schema Information
#
# Table name: intento_tests
#
#  id         :integer          not null, primary key
#  test_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pendiente  :integer
#

class IntentoTest < ApplicationRecord
end
