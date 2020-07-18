module QuestionDetailHelper
    def scream_check(l_id)
        screams=Scream.where(user_id:current_user.id)
        bars=Bar.where(lesson_id:l_id)
        scream_flag=0
        if screams.present? and bars.present?
            blist1=screams.pluck(:bar_id)
            blist2=bars.pluck(:id)
            b=blist1&blist2
            if b.present?
                scream_flag=1
            end
        end
    return scream_flag
    end
end
