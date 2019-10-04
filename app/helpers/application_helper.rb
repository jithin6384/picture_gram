module ApplicationHelper
	def alert_for(flash_type)
      { success: 'alert-success',
      	error: 'alert-danger',
      	alert: 'alert-danger',
      	notice: 'alert-info'
      }[flash_type.to_sym] || flash_type.to_s
	end

	def placeholder(params)
      placeholder = params["action"]=="new" ? 'placeholder.png' : @post.image.url
    end

    def profile_avatar_select(user)
      placeholder = user.avatar.url.present? ? 'default-profile.png' : @user.avatar.url
    end
end
