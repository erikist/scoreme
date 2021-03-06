class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  def new
  end

  def create
    @account = Account.new(account_params)

    respond_to do |wants|
      if @account.save
        wants.json { render :show, status: :created, location: @account }
        wants.js { }
      else
        wants.json { render json: @account.errors, status: :unprocessable_entity }
        wants.js { }
      end
    end
  end

  def edit
    respond_to do |wants|
      wants.json {  }
      wants.js {  render :layout => "account_swap"  }
    end
  end

  def update
    @account.update(account_params)
    #need to check if authorized
    respond_to do |wants|
      wants.json { }
      wants.js { }
    end
  end

  def destroy
  end

  def show
  end

  def login
    @authorized_account = Account.login(account_params[:username],account_params[:password])
    respond_to do |wants|
      if @authorized_account
        session[:uuid] = @authorized_account.tokens.last.uuid
        wants.js { };
      else
        wants.js { };
      end
    end
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def account_params
    params.require(:account).permit(:username, :password, :password_confirmation)
  end

end
