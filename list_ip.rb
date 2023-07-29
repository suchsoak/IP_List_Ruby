require 'socket'
require 'ipaddr'
require 'os'
require 'colorize'
require 'time'
puts
puts


puts "┏━━┓━━━┓".colorize(:blue)
puts "┗┫┣┛┏━┓┃".colorize(:blue)
puts "┃┃┃┃┗━┛┃".colorize(:blue)
puts "┃┃┃┃┏━━┛".colorize(:blue)
puts "┏┫┣┓┃┃┃┃".colorize(:blue)
puts "┗━━┛┛┃┃┃".colorize(:blue)
puts "┃┃┃┃┃┃┃┃".colorize(:blue)


if OS.windows?
puts "------------"
puts "Put The IP"
puts
IP = gets.chomp
puts
puts "IP: #{IP}".colorize(:red)
puts
puts "------------"
puts "Put The Final IP"
puts
IP_2 = gets.chomp
puts
puts "Final IP: #{IP_2}".colorize(:red)
puts "------------"
sleep(5)

system("cls")

# if system("ping -n 2 #{IP}")
#     puts

# else 
#     puts
#     puts "Algo de errado!"
# end

def scan_ips(start_ip, end_ip, port_list)
    (IPAddr.new(start_ip)..IPAddr.new(end_ip)).each do |ips|
    port_list.each do |port|
    begin
        socket = TCPSocket.new(ips.to_s, port)
        # service = Socket.getnameinfo(ips.to_s, port)
        puts "ip : |#{ips}| \t |#{port}|".colorize(:green)
      rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH, IO::TimeoutError, IPAddr::InvalidAddressError
      rescue Interrupt
        puts "\nScript Interrupt".colorize(:red)
        exit 
            end
        end
    end
end

port_list = [1, 21, 22, 23, 25, 53, 80, 110, 135, 139, 143, 443, 445, 993, 995] 
#port_list = 1..65535 

puts 

scan_ips(IP, IP_2, port_list)

elsif OS.linux?
    puts "------------"
    puts "Put The IP"
    puts
    IP = gets.chomp
    puts
    puts "IP: #{IP}"
    puts
    puts "------------"
    puts "Put The Final IP"
    puts
    IP_2 = gets.chomp
    puts
    puts "Final IP: #{IP_2}"
    puts "------------"
    
    system("clear")
    
    # if system("ping -n 2 #{IP}")
    #     puts
    
    # else 
    #     puts
    #     puts "Algo de errado!"
    # end
    
    def scan_ips(start_ip, end_ip, port_list)
        (IPAddr.new(start_ip)..IPAddr.new(end_ip)).each do |ips|
        port_list.each do |port|
        begin
            socket = TCPSocket.new(ips.to_s, port)
            # service = Socket.getnameinfo(ips.to_s, port)
            puts "ips : |#{ips}| \t portas : |#{port}|"
          rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH, IO::TimeoutError, IPAddr::InvalidAddressError
          rescue Interrupt
            puts ";-;"
            exit 
                end
            end
        end
    end
    
    port_list = [1, 21, 22, 23, 25, 53, 80, 110, 135, 139, 143, 443, 445, 993, 995] 
    #port_list = 1..65535 
    
    scan_ips(IP, IP_2, port_list)
    puts IP
      
else 
    puts "Sistema operacional não suportado!"
end