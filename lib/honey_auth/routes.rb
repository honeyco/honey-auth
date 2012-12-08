class HoneyAuth::Routes < SimpleDelegator
  def draw
    resource :session, :account
  end
end
