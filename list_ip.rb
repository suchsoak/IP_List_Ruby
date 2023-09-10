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

def scan_ips(start_ip, end_ip, port_list)
    (IPAddr.new(start_ip)..IPAddr.new(end_ip)).each do |ips|
    port_list.each do |port|
    begin
        socket = TCPSocket.new(ips.to_s, port)
        puts "|#{ips}| \t |#{port}|".colorize(:green)
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

system("clear")

def scan_ips(start_ip, end_ip, port_list)
    (IPAddr.new(start_ip)..IPAddr.new(end_ip)).each do |ips|
    port_list.each do |port|
    begin
        socket = TCPSocket.new(ips.to_s, port)
        puts "|#{ips}| \t |#{port}|".colorize(:green)
        rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH, IO::TimeoutError, IPAddr::InvalidAddressError
        rescue Interrupt
        puts "\nScript Interrupt".colorize(:red)
        exit 
            end
        end
    end
end

#port_list = [1, 21, 22, 23, 25, 53, 80, 110, 135, 139, 143, 443, 445, 993, 995] 
port_list = 1..65535 

puts 

scan_ips(IP, IP_2, port_list)
else 
    puts "Operating system does not support!"
end
