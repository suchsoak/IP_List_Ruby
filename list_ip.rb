require 'socket'
require 'ipaddr'
require 'colorize'
require 'time'
puts
puts
puts '''

▄▄▄ ▄▄▄▄▄▄▄    ▄▄▄     ▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄
█   █       █  █   █   █   █       █       █
█   █    ▄  █  █   █   █   █  ▄▄▄▄▄█▄     ▄█
█   █   █▄█ █  █   █   █   █ █▄▄▄▄▄  █   █
█   █    ▄▄▄█  █   █▄▄▄█   █▄▄▄▄▄  █ █   █
█   █   █      █       █   █▄▄▄▄▄█ █ █   █
█▄▄▄█▄▄▄█      █▄▄▄▄▄▄▄█▄▄▄█▄▄▄▄▄▄▄█ █▄▄▄█

∼∼https://github.com/suchsoak/IP_List_Ruby∼∼
                  suchsoak
                ~~v:1.0.3~~

''' .colorize(:blue)

puts
puts "------------"
puts "Put The IP"
puts
IP = gets.chomp
puts
puts "IP: #{IP}".colorize(:blue)
puts "------------"
puts "Put The Final IP"
puts
IP_2 = gets.chomp
puts
puts "Final IP: #{IP_2}".colorize(:blue)
puts
puts "------------"
sleep(5)

def scan_ips(start_ip, end_ip, port_list)
    (IPAddr.new(start_ip)..IPAddr.new(end_ip)).each do |ips|
    port_list.each do |port|
    begin
        socket = TCPSocket.new(ips.to_s, port)
        service = get_service_name(port)
        prot = socket.peeraddr[0]
        puts "\t\t\t\t\t", "|#{ips}| \t |#{port}" "\t #{service}|" "\t |#{prot}|".colorize(:green)
        rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH, IO::TimeoutError, IPAddr::InvalidAddressError
        rescue Interrupt
        puts "\nScript Interrupt".colorize(:red)
        exit
            end
        end
    end
end

def get_service_name(port)
    `getent services #{port}`.strip.split(' ')[0]
    rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH, IO::TimeoutError, IPAddr::InvalidAddressError
    rescue Interrupt
        puts "\nScript Interrupt".colorize(:red)
        exit
end

port_list = 1..65535

puts

scan_ips(IP, IP_2, port_list)
