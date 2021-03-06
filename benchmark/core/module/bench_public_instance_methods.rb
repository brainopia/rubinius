require 'benchmark'
require 'benchmark/ips'

Benchmark.ips do |x|
  m = Module.new do
    0.upto(100) do |i|
      eval "def method#{i}; end"
    end
  end

  c = Class.new do
    include m
  end

  x.report "on module" do
    m.public_instance_methods
  end

  x.report "on class" do
    c.public_instance_methods
  end

end
