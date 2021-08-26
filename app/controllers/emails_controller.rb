class EmailsController < ApplicationController
  before_action :set_email, only: %i[show edit update destroy]

  # GET /emails or /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1 or /emails/1.json
  def show
    @email = Email.find(params[:id])
    @email.update(read: true)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit; end

  # POST /emails or /emails.json
  def create
    @email = Email.create(subject: Faker::Book.title, body: Faker::Lorem.paragraph(sentence_count: 10))

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Email was successfully created.' }
      format.js {}
    end
  end

  # PATCH/PUT /emails/1 or /emails/1.json
  def update
    @email = Email.find(params[:id])
    @email.toggle(:read).save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

  # DELETE /emails/1 or /emails/1.json
  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_email
    @email = Email.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def email_params
    params.fetch(:email, {})
  end
end
