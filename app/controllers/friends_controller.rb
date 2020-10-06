class FriendsController < InheritedResources::Base

  private

    def friend_params
      params.require(:friend).permit(:friend_id)
    end

end
