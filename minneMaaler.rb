require 'benchmark'
require 'objspace'

def measure_performance(filename)
    memory_before = ObjectSpace.memsize_of_all
    time = Benchmark.realtime do
        numbers = File.readlines(filename).map(&:to_i)
        sum = numbers.sum
    end
    memory_after = ObjectSpace.memsize_of_all
    memory_used = memory_after - memory_before

    puts "#{filename} - tid #{time.round(4)}s, Minnebruk: #{memory_used} bytes"
end

['SmallTestList.txt', 'MediumTestList.txt', 'LargeTestList.txt'].each do |file|
    measure_performance(file)
end