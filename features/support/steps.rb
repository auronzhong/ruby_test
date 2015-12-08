module KnowsLoginPage
  def login_page
    @login_page ||= Login.new(@br)
  end
end
World(KnowsLoginPage)