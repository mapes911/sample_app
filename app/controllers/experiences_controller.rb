class ExperiencesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy

  def index
    @experiences = Experience.paginate(page: params[:page])
  end

  def show
    @experience = Experience.find(params[:id])
    @chapter = @experience.chapters.build if signed_in?
  end

  # GET /experiences/new
  # GET /experiences/new.json
  def new
    @experience = Experience.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @experience }
    end
  end

  # GET /experiences/1/edit
  def edit
    @experience = Experience.find(params[:id])
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = current_user.experiences.build(params[:experience])
    if @experience.save
      flash[:success] = "New Experience created! Add some nice text here!"
      redirect_to @experience
    else
      render 'new'
    end
  end

  # PUT /experiences/1
  # PUT /experiences/1.json
  def update
    @experience = Experience.find(params[:id])

    respond_to do |format|
      if @experience.update_attributes(params[:experience])
        format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @experience.destroy
    redirect_to root_url
  end

  private
    def correct_user
      @experience = current_user.experiences.find_by_id(params[:id])
      redirect_to root_url if @experience.nil?
    end

end
