class User < ActiveRecord::Base

  def admin?
    return self.login == 'admin'
  end

end
