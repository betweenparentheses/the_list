# A MODEL OBJECT
class User < ActiveRecord::BASE
# attributes:
end


@user = nil

@user.username

# NoMethodError...can't call method "username" on nil


class UserPresenter

  def initialize(user)
    raise Error if user.nil
    @user = user
  end

  def twitter
    if @user.twitter_name.present?
      link_to @user.twitter_name, "http://twitter.com/#{@user.twitter_name}"
    else
      ""
    end
  end

end


