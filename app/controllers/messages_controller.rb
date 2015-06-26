class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_ad

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    # binding.pry
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    # @message = Message.new(message_params)
    @message = current_user.messages.new(ad_id: @ad.id, text: params[:message][:text])

    respond_to do |format|
      if @message.save
        # format.html { redirect_to :back, notice: 'Message was successfully posted.' }
        format.html { redirect_to ad_path(@ad.id), notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to ad_message_path(@ad.id, @message.id), notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to ad_path(@ad.id), notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    def set_ad
      @ad = Ad.find(params[:ad_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      # params.require(:message).permit(:ad_id, :sender_id, :receiver_id, :text, :is_approved)
      params.require(:message).permit(:text)
    end
end
