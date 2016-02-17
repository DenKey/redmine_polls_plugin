Redmine::Plugin.register :polls do
  name 'Redmine Simple Polls plugin'
  author 'Denys Kriukov'
  description 'The simpliest polls plugin for Redmine.Allow registered user to vote.'
  version '0.0.1'

  project_module :polls do
    permission :view_polls, :polls => :index
    permission :vote_polls, :polls => :vote
  end

  menu :project_menu, :polls, { :controller => 'polls', :action => 'index' }, :caption => 'Polls', :after => :activity, :param => :project_id
end
