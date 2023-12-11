class ProfileController < ApplicationController



  def new
    @user_detail = UserDetail.new
  end

  def create
    puts "before user detail"
    @user_detail = UserDetail.new(user_detail_params)
    @user_detail.user = current_user
    puts "user detail = #{@user_detail}"
      if @user_detail.save
        puts "before saving"
        redirect_to posts_path
      else
        puts "Validation errors: #{@user_detail.errors.full_messages}"
        flash[:alert] = @user_detail.errors.full_messages
        return
      end
  end

  private

  def user_detail_params
    params.require(:user_detail).permit(:name, :userName, :DOB, :email, :gender, :mobile)
  end
end
