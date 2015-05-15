include SessionsHelper

def sign_in(player)
  allow(self.controller).to receive(:current_player).and_return(player)
end

def login_as(player)
  visit "/"
  fill_in 'login_handle', with: player.handle
  fill_in 'login_password', with: 'Password'
  click_button 'Log in'
end
