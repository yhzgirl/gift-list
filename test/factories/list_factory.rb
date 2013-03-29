# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  occasion   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ListFactory

  def self.list(params = {})
    params[:occasion] ||= "some occasion"
    List.create!(params)
  end
end
