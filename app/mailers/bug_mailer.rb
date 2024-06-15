class BugMailer < ApplicationMailer
    default from: 'omohsin3@gmail.com' # Replace with your email
  
    def bug_assigned(bug)
      @bug = bug
      @developer = @bug.assigned_to # Assuming there's an association to get the assigned developer
      mail(to: @developer.email, subject: 'A Bug Has Been Assigned to You')
    end
  end
  