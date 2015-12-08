require 'net/smtp'
require 'mailfactory'
require 'yaml'
require 'nokogiri'
require 'erb'


module Report

  def isAnyFailed
    f = File.open(File.dirname(__FILE__) + '/../report/report.html')
    doc = Nokogiri::HTML(f)
    is_any_failed = doc.css("script").last.text.include? "failed"
    f.close
    is_any_failed
  end


  def sendReport

    @email_config = YAML.load(File.open(File.dirname(__FILE__) + '/../config/email.yml'))
    mail = MailFactory.new()
    mail.to = @email_config["to"].split.join(",")
    mail.from = @email_config["from"]
    mail.subject = @email_config["subject"]
    @report_folder = File.dirname(__FILE__) + "/../report/"
    Dir.foreach(@report_folder) { |x|
      if x != "." && x != ".."
        full_path = @report_folder + x
        if full_path =~ /.*\.html$/
          mail.attach(full_path)
        end
      end
    }

    @report_folder = File.dirname(__FILE__) + "/../screenshots/"
    Dir.foreach(@report_folder) { |x|
      if x != "." && x != ".."
        full_path = @report_folder + x
        if full_path =~ /.*\.png/
          mail.attach(full_path)
        end
      end
    }

    # server, port, domain, account, passwor, authtype
    # Net::SMTP.start(@email_config["mailserver"]){ |smtp|
    #   smtp.send_message(mail.to_s(), @email_config["from"], @email_config["to"].split)
    # }

  end

  def clearReport
    @report_folder = File.dirname(__FILE__) + "/../report/"
    Dir.foreach(@report_folder) { |x|
      if x != "." && x != ".."
        full_path = @report_folder + "/" << x
        if full_path =~ /.*\.html|xml|txt$/
          File.delete full_path
        end
      end
    }

    @report_folder = File.dirname(__FILE__) + "/../screenshots/"
    Dir.foreach(@report_folder) { |x|
      if x != "." && x != ".."
        full_path = @report_folder + "/" << x
        if full_path =~ /.*\.png|jpeg|jpg|bmp/
          File.delete full_path
        end
      end
    }
  end

end


