require "./lib/user"

class Game 
    $table = []
    $users = []
    $turno = 1
    $iteradorJugadores = 0
    $size = 0

    def reset()
        $table = []
        $users = []
        $turno = 1
        $iteradorJugadores = 0
        $size = 0
        return true
    end

    def initGame (x,y)
        tam = x*y
        $size = x
        for i in 1..tam do
            $table.push('0000F')
        end
        return $table
    end

    def dotsAndBoxes(posX,posY,orientation)
        pos2 = 0
        pos1 = ($size*(posX - 1)) + posY
        result = -1
        changePlayer = true
        if orientation == 'U'
          if (pos1-1) % $size != 0
            pos2 = pos1 - 1
            result = play('D', pos2)
            if(result == 2)
              changePlayer = false
            end
          end
          elsif orientation == 'D'
            if pos1 % $size != 0
              pos2 = pos1 + 1
              result = play('U', pos2)
              if(result == 2)
                changePlayer = false
              end
            end
          elsif orientation == 'L'
            if pos1 > $size
              pos2 = pos1 - $size
              result = play('R', pos2)
              if(result == 2)
                changePlayer = false
              end
            end
          elsif orientation == 'R'
          if pos1 <= (($size * $size) - $size)
            pos2 = pos1 + $size 
            result = play('L', pos2)
            if(result == 2)
              changePlayer = false
            end
          end
        end
        result = play(orientation, pos1)
        if(result == 2)
          changePlayer = false
        end
        if(changePlayer)
          changePlayer()
        end 
        return true       
    end

    def play(side,position)
        result = 1
        position = position - 1
        space = $table[position]
        if side == 'L'
            space = insertMove(0, space)
            result = insertSpace(position, space)
            return result
        elsif side == 'R'
            space = insertMove(3, space)
            result = insertSpace(position, space)
            return result
        elsif side == 'U'
            space = insertMove(1, space)
            result = insertSpace(position, space)
            return result
        elsif side == 'D'
            space = insertMove(2, space)
            result = insertSpace(position, space)
            return result
        end
    end

    def insertMove(position, space)
        if space[position] == '0'
            space.slice!(position)
            space.insert(position,'1')
        else
            return -1
        end
    end

    def insertSpace(position, space)
        if space != -1
            result = 2
            for i in 0..3 do
                if space[i]=='0'
                    result = 1
                end
            end
            if result == 2
                space = setTrue(space)
                addScore(1)
            end
            $table.delete_at(position) 
            $table.insert(position, space)           
            return result
        else
            return -1
        end
    end

    def returnActualTable()
        return $table
    end

    def setTrue(space)
        if space[4] == 'F'
            space.slice!(4)
            space.insert(4,'T')
        else
            return -1
        end
    end

    def addUser(name, color)
        if($iteradorJugadores < 4)
            user = User.new()
            user.addUser(name, color)
            $users[$iteradorJugadores] = user
            $iteradorJugadores = $iteradorJugadores + 1
            return user.getUsername()
        else
            return false
        end
    end

    def changePlayer()
        if($turno == $iteradorJugadores)
            $turno = 1
        else 
            $turno = $turno + 1 
        end 
        return $turno
    end

    def getTurno()
        $turno
    end
    
    def getPlayers()
        $users
    end

    def addScore(score)
        usuario = $turno - 1  
        user  = $users[usuario]
        user.addScore(score)
        return user.getScore()
    end 

    def gameOver()
        game_over = true 
        $table.each do |space|
            if space[4]=='F'
                game_over = false
            end
        end
        return game_over    
    end
    
end