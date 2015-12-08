class SiteMenuNavigate
  def menu_navigate_to(addr)
    @br.execute_script(@master_head[addr])
  end
end