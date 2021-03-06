class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy, :sdefault]
  before_filter :find_agent

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    # @contacts = @agent.contacts

  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
    @agent = Agent.find(params[:agent_id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = @agent.contacts.build(contact_params)

    respond_to do |format|
      if @contact.save
        if @agent.contact.nil?
          @agent.contact = @contact
          @agent.save
        end
        format.html { redirect_to agent_url(@agent), notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to agent_contact_url(@agent,@contact), notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to agent_url(@agent), notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sdefault
    @agent.contact = @contact
    @agent.save
    redirect_to agent_url(@agent), notice: "Default contact is #{@contact.email}"
  end
  def find_agent
    @agent = Agent.find(params[:agent_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:email, :agent_id)
    end
end
