class ProfileController < ApplicationController



  def new
    @user_detail = UserDetail.new
  end

  def create
    puts "before user detail"
    @user_detail = UserDetail.new(user_detail_params)
    puts "user detail = #{@user_detail}"
    puts "before saving"
    if @user_detail.save
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
