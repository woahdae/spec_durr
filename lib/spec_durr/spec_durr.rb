COLORS = {
  green: "\e[0;32m",
  yellow: "\e[0;33m",
  none: "\e[0m"
}

if ARGV.empty?
  puts "Example usage: `print_inferior_specs Tests/Specs/**/*.m`"
  exit(1)
end

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
        COLORS[:green]
      when 'pending'
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

