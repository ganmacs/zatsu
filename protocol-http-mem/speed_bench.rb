require 'benchmark'
require 'socket'

N = 100
CRLF = "\r\n".freeze

w, r = Socket.pair(Socket::PF_UNIX, Socket::SOCK_STREAM)

(N * 2).times do
  w.write("testtttttttttttttttttttttttttttttt#{CRLF}")
end

Benchmark.bm 10 do |rr|
  rr.report "r.gets(CRLF).chomp" do
    N.times { r.gets(CRLF).chomp  }
  end

  rr.report "r.gets(CRLF, chomp: true)" do
    N.times { r.gets(CRLF, chomp: true) }
  end
end
