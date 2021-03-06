class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :authenticate_user, except: [:new, :create]
  respond_to :html, except: [:add_skill, :add_cause, :delete_skill]
  respond_to :json, only: [:add_skill, :add_cause, :delete_skill]
  
  # Use Responders gem to set flash message
  responders :flash  

  # GET /resource/sign_up
  def new
    super
  end

  #POST /resource
  def create
    # super
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        # respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        # respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      # respond_with resource
    end

    redirect_to users_next_steps_path
    
  end
  
  # GET /user/next_steps
  def next_steps
    @user = current_user
    @skills = @user.skills
  end
  
  def user_skills 
    @user = current_user
    respond_with @user.skills
  end
  
  #POST /users/add_skill
  def add_skill
    
    @user = current_user
    skill = Skill.where("name": params[:skill]).first
    
    unless skill
      skill = Skill.create!({name: params[:skill]})
    end
    
    # byebug
    unless @user.skills.include?(skill)
    
      # byebug
      @user.skills << skill
      # byebug
    
      respond_to do |format|
        if @user.save
          format.html
          format.json { render json: @user.skills, status: :created }
          format.any(:xml) { render request.format.to_sym => @user.skills }
        else
          # respond_with(@user.errors)
          format.html
          format.json { render json: @user.errors, status: :unprocessable_entity }
          format.any(:xml) { render request.format.to_sym => @user.skills }
        end
      end
      
    else 
      
      # respond_with(@user.skills)
      respond_to do |format|
         format.html
          format.json { render json: "This skill exists", errors: "This skill is already added!" }
          format.any(:xml) { render request.format.to_sym => @user.skills }
      end
      
    end
    
  end
  
  def delete_skill
    @user = current_user
    skill = Skill.find(params[:skill])
    if @user.skills.include?(skill)
      @user.skills.delete(skill)
      respond_to do |format|
        if @user.save
          format.json { render json: skill, status: :ok }
        else
          format.json { render json: skill, status: :unprocessable_entity }
        end
      end
    end
      
  end

  def add_cause
    @user = current_user

  end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    stored_location_for(resource) ||
    if resource.is_a?(User)
      users_next_steps_path
    else
      super(resource)
    end
  end
  
  

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
  def authenticate_user 
    unless user_signed_in?
      flash[:alert] = 'You must be signed in to access this page.'
      redirect_to root_path and return
    end
  end
      
  
end
