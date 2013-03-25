class ListFactory
  def self.list(params = {})
    params[:occasion] ||= "some occasion"
    params
  end

end