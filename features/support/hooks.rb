require 'report_builder'


After do |scenario|


    add_screenshot(scenario)

    if scenario.failed?
        add_browser_logs
    end
end

def add_screenshot(scenario)

    time_now = Time.now
    
    nome_cenario = scenario.name.gsub(/[^A-Za-z0-9]/, '')
    nome_cenario = nome_cenario.gsub(' ','_').downcase!
    screenshot = "log/screenshots/"+time_now.strftime('%Y-%m-%d-%H-%M')+"/"+time_now.strftime('%Y-%m-%d-%H-%M-%S') +"_#{nome_cenario}.png"
    page.save_screenshot(screenshot)
    attach(screenshot, 'image/png')
end

def add_browser_logs
    time_now = Time.now
    # Getting current URL
    current_url = Capybara.current_url.to_s
    # Gather browser logs
    logs = page.driver.browser.manage.logs.get(:browser).map {|line| [line.level, line.message]}
   # Remove warnings and info messages
    logs.reject! { |line| ['WARNING', 'INFO'].include?(line.first) }
    logs.any? == true
    attach(time_now.strftime('%Y-%m-%d-%H-%M-%S' + "\n") + ( "Current URL: " + current_url + "\n") + logs.join("\n"), 'text/plain', 'BROWSER ERROR')
end


