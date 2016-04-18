class TextbooksController < ApplicationController
  before_action :set_textbook, only: [:show, :edit, :update, :destroy, :new_contact, :send_contact]

  # GET /textbooks
  # GET /textbooks.json
  def index
    @textbooks = Textbook.all
  end

  # GET /textbooks/1
  # GET /textbooks/1.json
  def show
  end

  # GET /textbooks/new
  def new
    @textbook = Textbook.new
    @textbook.user = current_user
  end

  # GET /textbooks/1/edit
  def edit
  end

  # POST /textbooks
  # POST /textbooks.json
  def create
    @textbook = Textbook.new(textbook_params)
    @textbook.user = current_user

    respond_to do |format|
      if @textbook.save
        format.html { redirect_to @textbook, notice: 'Textbook was successfully created.' }
        format.json { render :show, status: :created, location: @textbook }
      else
        format.html { render :new }
        format.json { render json: @textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /textbooks/1
  # PATCH/PUT /textbooks/1.json
  def update
    respond_to do |format|
      if @textbook.update(textbook_params)
        format.html { redirect_to @textbook, notice: 'Textbook was successfully updated.' }
        format.json { render :show, status: :ok, location: @textbook }
      else
        format.html { render :edit }
        format.json { render json: @textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /textbooks/1
  # DELETE /textbooks/1.json
  def destroy
    @textbook.destroy
    respond_to do |format|
      format.html { redirect_to textbooks_url, notice: 'Textbook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_contact
  end

  def send_contact
    message = params[:message]
    if Contact.send_contact(@textbook, current_user, message).deliver
      flash[:success] = "Email sent."
      redirect_to @textbook
    else
      flash[:alert] = "There was a problem sending the email."
      render :new_contact
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_textbook
      @textbook = Textbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def textbook_params
      params.require(:textbook).permit(:title, :price, :user_id, :user)
    end
end
