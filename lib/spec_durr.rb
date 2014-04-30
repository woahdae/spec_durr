require "spec_durr/version"

COLORS = {
  green: "\e[0;32m",
  yellow: "\e[0;33m",
  none: "\e[0m"
}

if ARGV.empty?
  puts "Example usage: `print_inferior_specs Tests/Specs/**/*.m`"
  exit(1)
end

spec_count = 0
pending_count = 0

ARGV.each do |file|
  level = 0
  puts

  File.readlines(file).each do |line|
    level += line.count("{")
    level -= line.count("}")

    if match = line.match(/^ *(describe|context|it|pending).*?"(.*?)"/)
      type, description = *match.captures
      color = case type
      when 'it'
        spec_count += 1
        COLORS[:green]
      when 'pending'
        pending_count += 1
        COLORS[:yellow]
      else # describe, context
        COLORS[:none]
      end

      level += 1 if type == 'pending'
      puts "#{'  ' * level}#{color}#{description}#{COLORS[:none]}"
      level -= 1 if type == 'pending'
    end
  end
end

if pending_count > 0
  total_count = spec_count + pending_count
  puts
  puts "#{pending_count} pending of #{total_count} (#{(spec_count/total_count.to_f * 100).floor}% complete)"
  puts
end
