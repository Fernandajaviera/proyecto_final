class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: %i[ show edit update destroy ]

  def like
    puts params
    vet = User.find(params[:user_id])
    vet.likes += 1
    puts vet.likes
    vet.save
    redirect_to appointments_url
  end

  # GET /appointments or /appointments.json
  def index
    if current_user.role == "client"
      @pets = current_user.pets
    else
      @appointments = current_user.appointments
    end
  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @pets = current_user.pets
    @vets = User.where(role: "vet")
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    pet = Pet.find(params[:pet_id])
    user = User.find(params[:user_id])

    pet.appointments << @appointment
    user.appointments << @appointment

    mg_client = Mailgun::Client.new 'a7cacd51f2f6048e643de750bd0a8b6f-53ce4923-0b35fef0'
    message_params =  { from: 'admin@sandbox2509015e9aa44f2e934d416be1905cd6.mailgun.org',
                        to: user.email,
                        subject: 'Veterinaria virtual - Nueva hora médica',
                        text: 'Hola veterinario, se ha asignado una nueva hora médica para el día ' + @appointment.date.strftime("%d-%m-%Y") + ' con la mascota ' + pet.name
                      }

    mg_client.send_message 'sandbox2509015e9aa44f2e934d416be1905cd6.mailgun.org', message_params

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointments_url, notice: "Appointment was successfully created." }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    pet = Pet.find(params[:id])

    mg_client = Mailgun::Client.new 'a7cacd51f2f6048e643de750bd0a8b6f-53ce4923-0b35fef0'
    message_params =  { from: 'admin@sandbox2509015e9aa44f2e934d416be1905cd6.mailgun.org',
                        to: "heellxz@gmail.com",
                        subject: 'Veterinaria virtual - Hora médica actualizada',
                        text: 'Hola, se ha actualizado los datos de la hora médica de ' + pet.name 
                      }

    mg_client.send_message 'sandbox2509015e9aa44f2e934d416be1905cd6.mailgun.org', message_params

    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to appointments_url, notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "Appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      if current_user.role == "client"
        params.require(:appointment).permit(:date, :description)
      else
        params.require(:appointment).permit(:description, :is_active)
      end
    end

end
