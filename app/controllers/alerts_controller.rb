class AlertsController < ApplicationController
  # GET /alerts
  # GET /alerts.json
  def index
    @alerts = Alert.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @alerts }
    end
  end

  # GET /alerts/1
  # GET /alerts/1.json
  def show
    @alert = Alert.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @alert }
    end
  end

  # GET /alerts/new
  # GET /alerts/new.json
  def new
    @alert = Alert.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alert }
    end
  end

  # GET /alerts/1/edit
  def edit
    @alert = Alert.find(params[:id])
  end

  # POST /alerts
  # POST /alerts.json
  def create
    @alert = Alert.new(params[:alert])
    notifiers = Hash.new
    User.find(params[:notifiers]).each{|user| notifiers[user.id] = 0}
    @alert.notifiers = notifiers
    @alert.host = params[:host]
    @alert.trigger = params[:trigger]
    AlertMailer.system_alert(User.first).deliver
    respond_to do |format|
      if @alert.save
        format.html { redirect_to @alert, notice: 'Alert was successfully created.' }
        format.json { render json: @alert, status: :created, location: @alert }
	AlertMailer.new_alert(@alert.id).deliver
      else
        format.html { render action: "new" }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /alerts/1
  # PUT /alerts/1.json
  def update
    @alert = Alert.find(params[:id])
    notifiers = Hash.new
    User.find(params[:notifiers]).each{|user| notifiers[user.id] = 0}
    @alert.notifiers = notifiers
    @alert.host = params[:host]
    @alert.trigger = params[:trigger]
    respond_to do |format|
      if @alert.update_attributes(params[:alert])
        format.html { redirect_to @alert, notice: 'Alert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def acknowledged
    # adjust alert status to acknowledge
    
    #email all others on the alert with acknowledgement email template
    AlertMailer.acknowledged(params[:id]).deliver
  end

  def ignore
    # set's status of alert to false for that User
    AlertMailer.ignore(params[:id]).deliver
  end  
  
  def blocked
    # set's status of alert to false for that User
    AlertMailer.blocked(params[:id]).deliver
  end  
  
  def alert_check
    logger.info("Starting alertcheck")
    Alert.all.each do |alert|
      alertcheck = Servicestatus.where(:host_name => alert.host).where(:service_description => 'HTTP').where(:current_state => 1 ... 9).where(:nagiostimeid => (alert.trigger.to_i  * 5+240).minutes.ago ... Time.now).count
      AlertMailer.notification(alert).deliver unless alert.trigger <= alertcheck
      logger.info "Sending email for #{alert.host}"
    end  
  end
  # DELETE /alerts/1
  # DELETE /alerts/1.json
  def destroy
    @alert = Alert.find(params[:id])
    @alert.destroy

    respond_to do |format|
      format.html { redirect_to alerts_url }
      format.json { head :no_content }
    end
  end
end
