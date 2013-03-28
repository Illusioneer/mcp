class ApiController < ApplicationController

  def index
    @apis = Api.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apis }
      format.atom { render :action=>'index',:layout=>false }
      format.rss { render :layout => false }
    end
  end

  # GET /apis/1
  # GET /apis/1.json
  def show

    params.delete("action")
    params.delete("controller")
    render :text => params
   # @api = Api.where(title_slug: params[:id]).all.first
   # respond_to do |format|
   #   format.html # show.html.erb
   #   format.json { render json: @api }
   # end
  end

  def showgroups

    @groups = Group.all.map{|b| [b.groupname]}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
      format.atom { render :action=>'index',:layout=>false }
      format.rss { render :layout => false }
    end
    
  end
  
  # GET /apis/new
  # GET /apis/new.json
  
  def collectd
    logger.info(params.inspect)
  end  

  def lastcheck
    @lastcheck = Servicestatus.uptime(params["range"].to_i.days.ago, Time.now, params["service"], params["host"])

    respond_to do |format|
      if @lastcheck
        format.html { render text: @lastcheck }
        format.json { render json: @lastcheck }
      else
        format.html { render text: "Noooooooooooo" }
        format.json { render json: @lastcheck }
      end
    end
  end

  def hostping
  end

  def serviceping
  end

  def winjobs
  end
end
