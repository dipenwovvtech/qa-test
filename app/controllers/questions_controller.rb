class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :follow_topic, :follow_user]
  before_action :all_topic, only: [:new, :create, :edit, :update]

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answer = @question.answers.new
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def follow_topic
    topic = Topic.friendly.find(params[:topic_id])
    if current_user.following?(topic)
      redirect_to question_path(@question), flash: { alert: "Already following."}
    else
      current_user.follow(topic)
      redirect_to question_path(@question), flash: { notice: "You have followed #{topic.name}."}
    end
  end

  def follow_user
    user = User.friendly.find(params[:user_id])
    if current_user.following?(user)
      redirect_to question_path(@question), flash: { alert: "Already following."}
    else
      current_user.follow(user)
      redirect_to question_path(@question), flash: { notice: "You have followed #{user.name}."}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.friendly.find(params[:id])
    end

    def all_topic
      @topics = Topic.all
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:name, :user_id, :topic_id, :slug)
    end
end
