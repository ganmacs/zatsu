require 'memory_profiler'
require 'socket'

N = 100
CRLF = "\r\n".freeze

w, r = Socket.pair(Socket::PF_UNIX, Socket::SOCK_STREAM)

N.times do
  w.write("testtttttttttttttttttttttttttttttt#{CRLF}")
end

report = MemoryProfiler.report do
  N.times do
    r.gets(CRLF).chomp
  end
end
report.pretty_print
