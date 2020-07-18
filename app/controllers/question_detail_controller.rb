class QuestionDetailController < ApplicationController
  def index
    # get question
    q_id = params[:question_id]
    @question = Question.find(q_id)
    q_user_id = @question.user_id

    # get lesson number
    l_id = @question.lesson_id
    @lesson = Lesson.find(l_id)

    # get teacher
    @teacher=User.find(@lesson.user_id)

    # get course_name
    c_id = @lesson.course_id
    @course = Course.find(c_id)

    # get user name (who post question)
    @user = User.find(q_user_id)

    # get answers
    @answers = Answer.where(question_id: q_id)
  end

  def authorized
    @answer=Answer.find(params[:id])
    @answer.authorized=true
    @answer.save
    redirect_back(fallback_location: root_path)
  end

  def unauthorized
    @answer=Answer.find(params[:id])
    @answer.authorized=false
    @answer.save
    redirect_back(fallback_location: root_path)
  end


  def solved
    @question=Question.find(params[:id])
    @question.solved=true
    @question.save
    redirect_back(fallback_location: root_path)
  end

  def unsolved
    @question=Question.find(params[:id])
    @question.solved=false
    @question.save
    redirect_back(fallback_location: root_path)
  end
  
  def metoo
    @question=Question.find(params[:id])
    @question.metoo+=1
    @question.save
    @metoo=Metoo.new(user_id:params[:user_id],question_id:params[:id])
    @metoo.save
    redirect_back(fallback_location: root_path)
  end

  def ans_score
    @answer=Answer.find(params[:id])
    @answer.score+=1
    @answer.save
    @agood=Agood.new(user_id:params[:user_id],answer_id:params[:id])
    @agood.save
    redirect_back(fallback_location: root_path)
  end

  def com_score
    @comment=Comment.find(params[:id])
    @comment.score+=1
    @comment.save
    @cgood=Cgood.new(user_id:params[:user_id],comment_id:params[:id])
    @cgood.save
    redirect_back(fallback_location: root_path)
  end


  def ride
    @bar=Bar.find_by(lesson_id:@lesson.id,page:params[:page])
    if @bar==nil
      flash[:alert] = '存在しないpageが入力されています'
      redirect_back(fallback_location: root_path)
    else
      @scream=Scream.find_by(user_id:current_user.id,bar_id:@bar.id)
      if value<=@scream.score
        screamabout=Screamabout.new(rided_score:value,scream_id:@scream.id,question_id:@question.id)
        screamabout.save
      else
        flash[:alert] = 'Screamした値より大きな値が入力されています'
        redirect_back(fallback_location: root_path)
      end
    end
  end



end
