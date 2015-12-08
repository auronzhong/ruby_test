Before do
  browser_type = 'firefox'
  args =Hash.new
  args.store(:browser, browser_type)

  @br = WebDriverBrowserFactory.new(args).get_browser_instance
end

After do
  @br.close
end

