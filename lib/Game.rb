require "./lib/user"

class Game 
    $table = []
    $users = []
    $turno = 1
    $iteradorJugadores = 0

    def reset()
        $table = []
        $users = []
        $turno = 1
        $iteradorJugadores = 0
    end

    def initGame (x,y)
        tam = x*y
        for i in 1..tam do
            $table.push('0000F')
        end
        return $table
    end

    def addScore(score)
        usuario = $turno - 1  
        user  = $users[usuario]
        user.addScore(score)
        return user.getScore()
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
end