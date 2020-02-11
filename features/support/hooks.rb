Before do
  @login_page = LoginPage.new
  @movie_page = MoviePage.new
  @sidebar = SideBarView.new

  # page.current_window.resize_to(1300, 800)
  page.current_window.maximize
end

Before("@login") do
  user = CONFIG["users"]["cat_manager"]
  @login_page.go
  @login_page.with(user["email"], user["pass"])
end

After do |scenario|
  screenshot = page.save_screenshot("log/screenshots/#{scenario.__id__}.png")
  embed(screenshot, "image/png", "Screenshot")
end

