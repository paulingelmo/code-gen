puts "Welcome to...\n\n"
print "     ..|''||   '||''''| '||''''|    '|| '||'  '|' '||' |''||''| '||'  '||'  \n
    .|'    ||   ||  .    ||  .       '|. '|.  .'   ||     ||     ||    ||   \n
    ||      ||  ||''|    ||''|        ||  ||  |    ||     ||     ||''''||   \n
    '|.     ||  ||       ||            ||| |||     ||     ||     ||    ||   \n
     ''|...|'  .||.     .||.            |   |     .||.   .||.   .||.  .||.  \n
                                                                            \n
                                                                            \n
     '||'  '||' '||'  .|'''.|     '||'  '||' '||''''|      |     '||''|.    \n
      ||    ||   ||   ||..  '      ||    ||   ||  .       |||     ||   ||   \n
      ||''''||   ||    ''|||.      ||''''||   ||''|      |  ||    ||    ||  \n
      ||    ||   ||  .     '||     ||    ||   ||        .''''|.   ||    ||  \n
     .||.  .||. .||. |'....|'     .||.  .||. .||.....| .|.  .||. .||...|'   \n"
     puts "\n\nCreated by Paul Ingelmo."
puts "\n\nYou stand in a forest clearing. All is quiet, but you're familiar with TV tropes. You sense your enemy and rush at him with your weapon!"
puts "\n*It is difficult to strike directly at the head*"
puts "*Try to attack the arm to weaken the enemy's ability to attack*"
puts "*Attack the torso to make it more easier to hit the enemy*"
puts "*Strike at the head to win the game!*"

$playHP = [12, 20, 15]
$enemHP = [12, 20, 15]
$playEV = [75, 25, 35]
$enemEV = [75, 25, 35]
$playTOR = true
$enemTOR = true
$playARM = true
$enemARM = true
$playhitHEAD = false
$playhitTOR = false
$playhitARM = false
$playhitMISS = false
$enemhitHEAD = false
$enemhitTOR = false
$enemhitARM = false
$enemhitMISS = false

def playATT
  puts "\nDo you choose\n"
  if ($playARM)
    puts "to strike the HEAD"
    puts "to strike the TORSO"
    puts "to strike the ARM\n"
  else
    puts "to bite the HEAD"
    puts "to bite the TORSO"
    puts "to bite the ARM\n"
  end
  playCTH = rand(0..100)
  choice = gets.chomp.upcase
  if choice == "HEAD" && playCTH > $enemEV[0]
    $enemHP[0] -= rand(3..6)
    $playhitHEAD = true
  elsif choice == "TORSO" && playCTH > $enemEV[1]
    $enemHP[1] -= rand(3..6)
    $playhitTOR = true
  elsif choice == "ARM" && playCTH > $enemEV[2]
    $enemHP[2] -= rand(3..6)
    $playhitARM = true
  else
    $playhitMISS = true
  end
end

def playATTmin
  puts "\nDo you choose\n"
  if ($playARM)
    puts "to strike the HEAD"
    puts "to strike the TORSO"
    puts "to strike the ARM\n"
  else
    puts "to bite the HEAD"
    puts "to bite the TORSO"
    puts "to bite the ARM\n"
  end
  playCTH = rand(0..100)
  choice = gets.chomp.upcase
  if choice == "HEAD" && playCTH > $enemEV[0]
    $enemHP[0] -= rand(2..3)
    $playhitHEAD = true
  elsif choice == "TORSO" && playCTH > $enemEV[1]
    $enemHP[1] -= rand(2..3)
    $playhitTOR = true
  elsif choice == "ARM" && playCTH > $enemEV[2]
    $enemHP[2] -= rand(2..3)
    $playhitARM = true
  else
    $playhitMISS = true
  end
end

def enemATT
  enemCTH = rand(0..100)
  enemCH = rand(0..10)
  if $enemARM
    if enemCH > 9 && (enemCTH > $playEV[0])
      $playHP[0] -= rand(3..6)
      $enemhitHEAD = true
    elsif enemCH > 3 && (enemCTH > $playEV[1])
      $playHP[1] -= rand(3..6)
      $enemhitTOR = true
    elsif enemCH > 0 && (enemCTH > $playEV[2])
      $playHP[2] -= rand(3..6)
      $enemhitARM = true
    else
      $enemhitMISS = true
    end
  else
    if enemCH > 9 && (enemCTH > $playEV[0])
      $playHP[0] -= rand(2..3)
      $enemhitHEAD = true
    elsif enemCH > 3 && (enemCTH > $playEV[1])
      $playHP[1] -= rand(2..3)
      $enemhitTOR = true
    elsif enemCH > 0 && (enemCTH > $playEV[2])
      $playHP[2] -= rand(2..3)
      $enemhitARM = true
    else
      $enemhitMISS = true
    end
  end
end

def enemATTmin
  enemCTH = rand(0..100)
  enemCH = rand(0..10)
  if $enemARM
    if enemCH > 4 && (enemCTH > $playEV[0])
      $playHP[0] -= rand(3..6)
      $enemhitHEAD = true
    elsif enemCH > 0
      if enemCTH > $playEV[1]
        $playHP[1] -= rand(3..6)
        $enemhitTOR = true
      end
      if enemCTH > $playEV[2]
        $playHP[2] -= rand(3..6)
        $enemhitARM = true
      end
    else
      $enemhitMISS = true
    end
  else
    if enemCH > 4 && (enemCTH > $playEV[0])
      $playHP[0] -= rand(2..3)
      $enemhitHEAD = true
    elsif enemCH > 0
      if enemCTH > $playEV[1]
        $playHP[1] -= rand(2..3)
        $enemhitTOR = true
      end
      if enemCTH > $playEV[2]
        $playHP[2] -= rand(2..3)
        $enemhitARM = true
      end
    else
      $enemhitMISS = true
    end
  end
end

def enemATTmax
  enemCTH = rand(0..100)
  enemCH = rand(0..10)
  if $enemARM
    if enemCH > 0 && (enemCTH > $playEV[0])
      $playHP[0] -= rand(3..6)
      $enemhitHEAD = true
    else
      $enemhitMISS = true
    end
  else
    if enemCH > 0 && (enemCTH > $playEV[0])
      $playHP[0] -= rand(2..4)
      $enemhitHEAD = true
    else
      $enemhitMISS = true
    end
  end
end

def status
  if $playhitMISS == true
    puts "\nYou swing at the enemy, but it is deflected. You miss."
  elsif $playhitHEAD == true
    puts "\nYou strike the head of the enemy! A trickle of blood oozes from his nose."
  elsif $playhitTOR == true
    puts "\nYou slice into the torso of the enemy. The wound looks painful."
  elsif $playhitARM == true
    puts "\nYou hit the sword arm! Perhaps his attack will be easier to avoid."
  else
  end
  if $enemhitMISS == true
    puts "The enemy attempts to strike you, but you avoid his attack with ease."
  elsif $enemhitHEAD == true
    puts "The enemy strikes at your head and connects! You feel dazed."
  elsif $enemhitTOR == true
    puts "The enemy pierces your torso! The wound stings with every breath."
  elsif $enemhitARM == true
    puts "The enemy slices into your arm! Your weapon feels heavy in your hand."
  else
  end
  if $playHP[1] <= 0
    $playTOR = false
    puts "\nYou have become wounded, and are less able to evade."
    $playEV[0] -= 15
    $playEV[1] -= 5
    $playEV[2] -= 10
  end
  if $playHP[2] <= 0
    $playARM = false
    puts "\nYour arm hangs limply at your side. You are unable to swing your sword."
  end
  if $enemHP[1] <= 0
    $enemTOR = false
    puts "\nYour enemy has a debilitating wound! He will not be able to dodge your attacks as easily."
    $enemEV[0] -= 15
    $enemEV[0] -= 5
    $enemEV[0] -= 10
  end
  if $enemHP[2] <= 0
    $enemARM = false
    puts "\nYour enemy's sword arm is wounded!"
  end
  $playhitHEAD = false
  $playhitTOR = false
  $playhitARM = false
  $playhitMISS = false
  $enemhitHEAD = false
  $enemhitTOR = false
  $enemhitARM = false
  $enemhitMISS = false
end

while ($playHP[0] > 0 && $enemHP[0] > 0)
  if $playARM
    playATT
  else
    playATTmin
  end
  if $enemARM && $enemTOR
    enemATT
  elsif $enemARM || $enemTOR
    enemATTmin
  else
    enemATTmax
  end
  status
end

if $enemHP[0] <= 0
  puts "\nIn a sudden burst of effort, your enemy's head is torn off his neck, and flies off in a spurt of gore. You have emerged victorious!"
elsif $playHP[0] <= 0
  puts "\nYour head flies off in an arc of blood. You have lost."
end
