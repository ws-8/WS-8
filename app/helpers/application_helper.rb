module ApplicationHelper
    def get_lectures
    # get courses
        @courses=Course.all
    end
end
