class ListFactory

  def self.list(params = {})
    params[:occasion] ||= "some occasion"
    List.create! params
  end

end