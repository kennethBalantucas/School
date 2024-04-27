using SerialPorts
include("ArduinoTools.jl")

h = ArduinoTools.connectBoard(115200)

for i = 1:3
  write(h,"v")
  s = read(h, 2)
  println(s)
end

close(h)
