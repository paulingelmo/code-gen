system("clear")
puts "Welcome to"
puts "\n
  sss. d       b d ss.  d    b d d    b   sSSSs   d ss.
d      S       S S    b S    S S S    S  S     S  S    b
Y      S       S S    P S    S S S    S S       S S    P   S
  ss.  S       S S sS'  S    S S S    S S       S S sS'
     b S       S S   S  S    S S S    S S       S S   S
     P  S     S  S    S  S   S S  S   S  S     S  S    S   S
^ ss^    ^sss^   P    P   ^ssS P   ^ssS   ^sss^   P    P

  sSSs.   sSSSs   d s  b   sSSSs   d ss.  d sss     sss.   sss. d   sSSSs   d s  b d s.   d
 S       S     S  S  S S  S     S  S    b S       d      d      S  S     S  S  S S S  ~O  S
S       S       S S   SS S         S    P S       Y      Y      S S       S S   SS S   `b S
S       S       S S    S S         S sS'  S sSSs    ss.    ss.  S S       S S    S S sSSO S
S       S       S S    S S    ssSb S   S  S            b      b S S       S S    S S    O S
 S       S     S  S    S  S     S  S    S S            P      P S  S     S  S    S S    O S
  ^sss^   ^sss^   P    P   ^sss^   P    P P sSSss ^ ss^  ^ ss^  P   ^sss^   P    P P    P P sSSs

d sss   d ss    d sss sssss d   sSSSs   d s  b
S       S   ~o  S     S     S  S     S  S  S S
S       S     b S     S     S S       S S   SS
S sSSs  S     S S     S     S S       S S    S
S       S     P S     S     S S       S S    S
S       S    S  S     S     S  S     S  S    S
P sSSss P ss^   P     P     P   ^sss^   P    P"

active = true

class Main
  attr_accessor :people, :path, :term, :index

  def initialize
    @people = {voter: [], politician: []}
    sample
  end

  def setup
    @path = ""
    @term = ""
    @index = nil
    puts "\n\n"
    puts "Setup phase:"
    puts "What would you like to do?"
    puts "Create, List, Update, or Delete."
    puts "(enter first letter of choice)"
    print ">>"
    menu = gets.chomp.downcase.strip
    case menu
    when "c"
      system("clear")
      create
    when "l"
      system("clear")
      list
    when "u"
      system("clear")
      @path = "u"
      edit
    when "d"
      system("clear")
      @path = "d"
      edit
    else
      puts "\n"
      puts "Invalid option."
      sleep 1
      system("clear")
      setup
    end
  end

  def create
    puts "\n\n"
    puts "Create options:"
    puts "What kind of person would you like to create?"
    puts "Voter or Politician"
    puts "(enter first letter of choice)"
    print ">>"
    menu = gets.chomp.downcase.strip
    case menu
    when "v"
      system("clear")
      voter
    when "p"
      system("clear")
      politician
    else
      puts "\n"
      puts "Invalid option."
      sleep 1
      system("clear")
      create
    end
  end

  def list
    puts "\n\n"
    puts "List options:"
    puts "What data would you like displayed?"
    puts "Voters, Politicians, or Both"
    puts "(enter first letter of choice)"
    print ">>"
    menu = gets.chomp.downcase.strip
    case menu
    when "v"
      @people[:voter].each do |x|
        puts "Voter, #{x.name}, #{x.political_affiliation}"
      end
    when "p"
      @people[:politician].each do |x|
        puts "Politician, #{x.name}, #{x.party}"
      end
    when "b"
      @people[:voter].each do |x|
        puts "Voter, #{x.name}, #{x.political_affiliation}"
      end
      @people[:politician].each do |x|
        puts "Politician, #{x.name}, #{x.party}"
      end
    else
      puts "\n"
      puts "Invalid option."
      sleep 1
      system("clear")
      list
    end
  end

  def edit
    check = 0
    puts "\n\n"
    if @path == "u"
      puts "Update options:"
      puts "What type of entry are you updating?"
    elsif @path == "d"
      puts "Deletion options:"
      puts "What type of entry are you deleting?"
    end
    puts "Voter or Politician"
    puts "(enter first letter of choice)"
    print ">>"
    menu = gets.chomp.downcase.strip
    case menu
    when "v"
      if @path == "u"
      @path = "uv"
      elsif @path == "d"
      @path = "dv"
      end
      search
    when "p"
      if @path == "u"
      @path = "up"
      elsif @path == "d"
      @path = "dp"
      end
      search
    else
      puts "\n"
      puts "Invalid option."
      sleep 1
      system("clear")
      setup
    end
  end

  def search
    check = 0
    case @path
    when "uv", "dv"
      puts "\n"
      puts "Which voter would you like to edit?"
      puts "(enter exact name or suffer the consequences)"
      print ">>"
      @term = gets.chomp
      puts "\n"
      @people[:voter].select do |x|
        if x.name == @term
          check += 1
          puts "Voter, #{x.name}, #{x.political_affiliation}"
          @index = @people[:voter].find_index {|y| @term == y.name}
        end
      end
    when "up", "dp"
      puts "\n"
      puts "Which politician would you like to edit?"
      puts "(enter exact name or suffer the consequences)"
      print ">>"
      @term = gets.chomp
      puts "\n"
      @people[:politician].select do |x|
        if x.name == @term
          check += 1
          puts "Politician, #{x.name}, #{x.party}"
          @index = @people[:politician].find_index {|y| @term == y.name}
        end
      end
    end
    case check
    when 1
      if @path == "uv" || @path == "up"
        update
      elsif @path == "dv" || @path == "dp"
        delete
      end
    else
      puts "\n"
      puts "Error, check name and try again."
      sleep 1
      system("clear")
      setup
    end
  end

  def update
    puts "\n\n"
    puts "What field would you like to update"
    puts "for " + @term + "?"
    if @path == "uv"
      puts "Name or Political Affiliation"
    elsif @path == "up"
      puts "Name or Party"
    end
    puts "(enter first letter of choice)"
    print ">>"
    menu = gets.chomp.downcase.strip
    case menu
    when "n"
      if @path == "uv"
        puts @people[:voter][@index].name
        puts "Enter new name:"
        print ">>"
        name = gets.chomp.strip
        @people[:voter][@index].name = name
      elsif @path == "up"
        puts @people[:politician][@index].name
        puts "Enter new name:"
        print ">>"
        name = gets.chomp.strip
        @people[:politician][@index].name = name
      end
      puts "\n"
      puts "Name updated!"
      sleep 1
      system("clear")
      setup
    when "p"
      if @path == "uv"
        puts @people[:voter][@index].political_affiliation
        puts "Select new political affiliation:"
        puts "Tea Party, Conservative, Neutral, Liberal, Socialist"
        puts "(enter first letter of choice)"
        print ">>"
        pol_aff_choice = gets.chomp.downcase.strip
        case pol_aff_choice
        when "t"
          political_affiliation = "Tea Party"
        when "c"
          political_affiliation = "Conservative"
        when "n"
          political_affiliation = "Neutral"
        when "l"
          political_affiliation = "Liberal"
        when "s"
          political_affiliation = "Socialist"
        else
          puts "\n"
          puts "Invalid option."
          sleep 1
          system("clear")
          update
        end
        @people[:voter][@index].political_affiliation = political_affiliation
        puts "\n"
        puts "Political affiliation updated!"
      elsif @path == "up"
        puts @people[:politician][@index].party
        puts "Select new party:"
        puts "Republican, Independent, Democrat"
        puts "(enter first letter of choice)"
        puts ">>"
        party_choice = gets.chomp.downcase.strip
        case party_choice
        when "r"
          party = "Republican"
        when "i"
          party = "Independent"
        when "d"
          party = "Democrat"
        else
          puts "\n"
          puts "Invalid option."
          sleep 1
          system("clear")
          update
        end
        @people[:politician][@index].party = party
        puts "\n"
        puts "Party updated!"
      end
      sleep 1
      system("clear")
      setup
    else
      puts "\n"
      puts "Invalid option."
      sleep 1
      system("clear")
      update
    end
  end

  def delete
    puts "\n\n"
    puts "Are you sure you want to delete this person?"
    puts @term
    puts "(y/n)"
    print ">>"
    menu = gets.chomp.downcase.strip
    case menu
    when "y"
      puts "\n"
      puts "You were warned. Deleting..."
      if @path == "dv"
        @people[:voter].delete_if {|x| x.name == @term}
      elsif @path == "dp"
        @people[:politician].delete_if {|x| x.name == @term}
      end
      sleep 1
      system("clear")
      setup
    when "n"
      puts "\n"
      puts "Deletion cancelled."
      sleep 1
      system("clear")
      setup
    else
      puts "\n"
      puts "Invalid option."
      sleep 1
      system("clear")
      delete
    end
  end

  def voter
    puts "\n\n"
    puts "Enter a voter name:"
    puts ">>"
    name = gets.chomp.strip
    puts "\n"
    puts "Select political affiliation:"
    puts "Tea Party, Conservative, Neutral, Liberal, Socialist"
    puts "(enter first letter of choice)"
    print ">>"
    pol_aff_choice = gets.chomp.downcase.strip
    case pol_aff_choice
    when "t"
      political_affiliation = "Tea Party"
    when "c"
      political_affiliation = "Conservative"
    when "n"
      political_affiliation = "Neutral"
    when "l"
      political_affiliation = "Liberal"
    when "s"
      political_affiliation = "Socialist"
    else
      puts "\n"
      puts "Invalid option."
      sleep 1
      system("clear")
      voter
    end
    @people[:voter] << Voter.new(name, political_affiliation)
  end

  def politician
    puts "\n\n"
    puts "Enter a politician name:"
    puts ">>"
    name = gets.chomp.strip
    puts "\n"
    puts "Select party:"
    puts "Republican, Independent, Democrat"
    puts "(enter first letter of choice)"
    puts ">>"
    party_choice = gets.chomp.downcase.strip
    case party_choice
    when "r"
      party = "Republican"
    when "i"
      party = "Independent"
    when "d"
      party = "Democrat"
    else
      puts "\n"
      puts "Invalid option."
      sleep 1
      system("clear")
      politician
    end
    @people[:politician] << Politician.new(name, party)
  end

  def sample
    @people[:voter] << Voter.new("Paul N. Ingelmo", "Liberal")
    @people[:voter] << Voter.new("Maria A. Ingelmo", "Conservative")
    @people[:voter] << Voter.new("Glenn Beck", "Tea Party")
    @people[:voter] << Voter.new("Justin Cooster", "Neutral")
    @people[:voter] << Voter.new("Eugene V. Debs", "Socialist")
    @people[:politician] << Politician.new("Hillary R. Clinton", "Democrat")
    @people[:politician] << Politician.new("Donald J. Trump", "Republican")
    @people[:politician] << Politician.new("Bernard Sanders", "Independant")
    @people[:politician] << Politician.new("Ted \"Asshole\" Cruz", "Republican")
  end
end

class Voter
  attr_accessor :name, :political_affiliation

  def initialize (name, political_affiliation)
    @name = name
    @political_affiliation = political_affiliation
  end
end

class Politician
  attr_accessor :name, :party

  def initialize (name, party)
    @name = name
    @party = party
  end
end

united_states = Main.new
while active
  united_states.setup
end
